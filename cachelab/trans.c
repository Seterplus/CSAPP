/***********************************
 *
 * Name:	Guo Tiankui
 * userID:	1300012790@pku.edu.cn
 *
 ***********************************/

/* 
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */ 
#include <stdio.h>
#include "cachelab.h"
#include "contracts.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/* 
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. The REQUIRES and ENSURES from 15-122 are included
 *     for your convenience. They can be removed if you like.
 */
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
	int i, j, k, l, a0, a1, a2, a3, a4, a5, a6, a7;
	REQUIRES(M > 0);
	REQUIRES(N > 0);

	if (M == 61) {
		for (i = 0; i < N; i += (i % 36 ? 20 : 16)) {
			for (j = 0; j < M; j += 4) {
				for (k = i; k < i + (i % 36 ? 20 : 16) && k < N; k += 2) {
					if (j < M)
						a0 = A[k][j];
					if (j + 1 < M)
						a1 = A[k][j + 1];
					if (j + 2 < M)
						a2 = A[k][j + 2];
					if (j + 3 < M)
						a3 = A[k][j + 3];
					if (k + 1 < N) {
						if (j < M)
							a4 = A[k + 1][j];
						if (j + 1 < M)
							a5 = A[k + 1][j + 1];
						if (j + 2 < M)
							a6 = A[k + 1][j + 2];
						if (j + 3 < M)
							a7 = A[k + 1][j + 3];
					}
					if (j < M)
						B[j][k] = a0;
					if (j + 1 < M)
						B[j + 1][k] = a1;
					if (j + 2 < M)
						B[j + 2][k] = a2;
					if (j + 3 < M)
						B[j + 3][k] = a3;
					if (k + 1 < N) {
						if (j < M)
							B[j][k + 1] = a4;
						if (j + 1 < M)
							B[j + 1][k + 1] = a5;
						if (j + 2 < M)
							B[j + 2][k + 1] = a6;
						if (j + 3 < M)
							B[j + 3][k + 1] = a7;
					}
				}
			}
		}
	} else if (M == 32) {
		for (i = 0; i < N; i += 8) {
			for (j = 0; j < M; j += 8) {
				if (i == j) {
					for (k = i; k < i + 8 && k < N; k++) {
						a0 = A[k][j];
						a1 = A[k][j + 1];
						a2 = A[k][j + 2];
						a3 = A[k][j + 3];
						a4 = A[k][j + 4];
						a5 = A[k][j + 5];
						a6 = A[k][j + 6];
						a7 = A[k][j + 7];
						B[k][j] = a0;
						B[k][j + 1] = a1;
						B[k][j + 2] = a2;
						B[k][j + 3] = a3;
						B[k][j + 4] = a4;
						B[k][j + 5] = a5;
						B[k][j + 6] = a6;
						B[k][j + 7] = a7;
					}
					for (k = i; k < i + 8 && k < N; k++) {
						for (l = k; l < j + 8 && l < M; l++) {
							a0 = B[l][k];
							B[l][k] = B[k][l];
							B[k][l] = a0;
						}
					}
				} else {
					for (k = i; k < i + 8 && k < N; k++) {
						for (l = j; l < j + 8 && l < M; l++) {
							B[l][k] = A[k][l];
						}
					}
				}
			}
		}
	} else if (M == 64) {
		for (j = 0; j < M; j += 8) {
			i = !(j >> 5) << 5;
			for (l = j; l < j + 8 && l < M; l++)
				for (k = j; k < j + 4 && k < N; k++)
					B[k][i + l - j] = A[k][l];
			for (l = j; l < j + 8 && l < M; l++)
				for (k = j + 4; k < j + 8 && k < N; k++)
					B[k - 4][i + l - j + 8] = A[k][l];
			for (l = j; l < j + 4 && l < M; l++) {
				for (k = j; k < j + 4 && k < N; k++)
					B[l][k] = B[k][i + l - j];
				for (k = j + 4; k < j + 8 && k < N; k++)
					B[l][k] = B[k - 4][i + l - j + 8];
			}
			for (l = j + 4; l < j + 8 && l < M; l++) {
				for (k = j; k < j + 4 && k < N; k++)
					B[l][k] = B[k][i + l - j];
				for (k = j + 4; k < j + 8 && k < N; k++)
					B[l][k] = B[k - 4][i + l - j + 8];
			}
			for (i = 0; i < N; i += 8) {
				if (i != j) {
					for (k = i; k < i + 2 && k < N; k++)
						for (l = j; l < j + 4 && l < M; l++)
							B[l][k] = A[k][l];
					a0 = A[i][j + 4];
					a1 = A[i][j + 5];
					a2 = A[i][j + 6];
					a3 = A[i][j + 7];
					a4 = A[i + 1][j + 4];
					a5 = A[i + 1][j + 5];
					a6 = A[i + 1][j + 6];
					a7 = A[i + 1][j + 7];
					for (k = i + 2; k < i + 4 && k < N; k++) {
						for (l = j; l < j + 4 && l < M; l++)
							B[l][k] = A[k][l];
						for (l = j + 4; l < j + 8 && l < M; l++)
							B[k - i + j][l - j + i] = A[k][l];
					}
					for (k = i + 4; k < i + 8 && k < N; k++)
						for (l = j; l < j + 2 && l < M; l++)
							B[l][k] = A[k][l];
					for (k = i + 2; k < i + 4 && k < N; k++)
						for (l = j + 4; l < j + 6 && l < M; l++)
							B[l][k] = B[k - i + j][l - j + i];
					B[j + 4][i] = a0;
					B[j + 5][i] = a1;
					B[j + 4][i + 1] = a4;
					B[j + 5][i + 1] = a5;
					a0 = B[j + 2][i + 6];
					a1 = B[j + 2][i + 7];
					a4 = B[j + 3][i + 6];
					a5 = B[j + 3][i + 7];
					for (k = i + 4; k < i + 8 && k < N; k++)
						for (l = j + 2; l < j + 4 && l < M; l++)
							B[l][k] = A[k][l];
					B[j + 6][i] = a2;
					B[j + 7][i] = a3;
					B[j + 6][i + 1] = a6;
					B[j + 7][i + 1] = a7;
					B[j + 6][i + 2] = a0;
					B[j + 7][i + 2] = a1;
					B[j + 6][i + 3] = a4;
					B[j + 7][i + 3] = a5;
					for (k = i + 4; k < i + 8 && k < N; k++)
						for (l = j + 4; l < j + 8 && l < M; l++)
							B[l][k] = A[k][l];
				}
			}
		}
	}

	ENSURES(is_transpose(M, N, A, B));
}

/* 
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started. 
 */ 

/* 
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
	int i, j, tmp;

	REQUIRES(M > 0);
	REQUIRES(N > 0);

	for (i = 0; i < N; i++) {
		for (j = 0; j < M; j++) {
			tmp = A[i][j];
			B[j][i] = tmp;
		}
	}    

	ENSURES(is_transpose(M, N, A, B));
}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
	/* Register your solution function */
	registerTransFunction(transpose_submit, transpose_submit_desc); 

	/* Register any additional transpose functions */
	registerTransFunction(trans, trans_desc); 

}

/* 
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
	int i, j;

	for (i = 0; i < N; i++) {
		for (j = 0; j < M; ++j) {
			if (A[i][j] != B[j][i]) {
				return 0;
			}
		}
	}
	return 1;
}

