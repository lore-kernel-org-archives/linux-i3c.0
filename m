Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6D2D12671
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Dec 2025 21:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vezAbKIKCscXWUtKscbwP5pAGPBtTDOg+Fa60HodO2M=; b=3b4h5/36y3LpdO
	2cWl3FJD1T00QC/JXQrrC236kvqNBGcwAHPGFNiJhGInb0lU60x/U2tYfCnt5leIVQbPhAlFMbWFb
	1fQUU7F0t4DNNn9f+qMYgaLDHwRnWQIP0dUVPcVnlUaBQr5ggmmQbd2n0//Sh43VreSfTOQYCKXS3
	8QFImNlK2IwTenoUj9d9TbCF49QyHF04x3ttVJuB012vIkyejZ3cNGt0cSWuoidQF4EBMKzvs5rRg
	YOV7Qg+M2zUz3Mx1BAXgjH0D3ETFEZXCkUv98HbTtKk49QNvSDSI/gRtZWvMF2Lop3phomoTxOp2e
	65iNAFE5vQ286bv4rjQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQXmi-00000005qH8-1f4p;
	Tue, 02 Dec 2025 21:19:44 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQXmf-00000005qGY-10Et
	for linux-i3c@lists.infradead.org;
	Tue, 02 Dec 2025 21:19:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVEruHEytaNPxtrbwoBs6H7CopMPO9g+fd7CItGjGQzy2suniUfUesgZbOvr/TDiZMj26/mEHfioc9VEtbcPL2Fb1iBut5qKL/MsQ/OMRArZpmp9Q1XnmoKA4tBnVG0PCD3SCQtKTMocHpgeXgWS8J4dheMAGhwICHrrBuWfSpc+NfQMBS3iVzgCc2ynx7W1nkRgKEEQBUGEdFwgFozryH4aNH7usXaJwm500fJuyTyHB0DkQIW5tZTMdJ4Vjz4P5YioWabmLD/qtZN0Xm0XVMKxsLXPP+qwsEHyMY09pM+nb7kKQr7uBAVqU2dH8roTH0AJF5+LHTNRtiGsAcEpGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bZtigT6cSh3MJYGYH2KhBOBvUE0EGb/lTKx4SgOiBc=;
 b=y71IjtIbfJdaIlMFvlGWRBvLXsxo9X/Jb5GY1B8rD6iEhA3EARwbP+lt2qgNArFZ3jwbTmRNAwdNbnxn7HWzLLMM0RX+WWrtHwKQzdoPkoXEe3k0ditfjUKVjhOR7NfB+rfMUxJx9UEAaPq/WaYDCJUgVCBcEwV9UW3/ZLT5t1dCzRrbFyms99ml1Cg6qi9G7MxYs4l9zQvV2ApYZYqYzI/8OQ9tnE24E3xL6WhUiFlMGe1xRLJCOxGi83lwH6pg5uPGwZSAPGKird2rpLtW8eM/WX1jwPeiyEjYAWqBdeo55OA9EjMIOtxNUeOPvCZKu4WtqRlqZoHMdaVQb1+GUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bZtigT6cSh3MJYGYH2KhBOBvUE0EGb/lTKx4SgOiBc=;
 b=HX24LP0VtNsS5JNZVuW3HEHQrHnOZwEyTbPqATEbHoy3kklbscJOIYqvKJBFix68+YgGDFdicwhahPz2JmOfYtXTVtp2WWDvXJjeS4zjEyclZKx1biGrM3SCpUthdN9ncfLW4DF4oKZf3KbG2mW4ik8ZYuQBWzJmNuTvoZiM8Cq1HSuGwcpT7X0KSQVxEw3U1aWgJvr7NogD4BG0Pu890ttNEGfMhIq/wcJMad3Dfvc8PrwHkLAz34V2PZr7F8WikpIV89rOy+IakOpOVubquMSaS9PxMeJe3HryOSwpeuiUuyXOaqBcd4OkIl5Z2zFwQImj4vR7ap3n4PNvDPpTpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAXPR04MB8368.eurprd04.prod.outlook.com (2603:10a6:102:1bf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 21:19:37 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 21:19:37 +0000
Date: Tue, 2 Dec 2025 16:19:32 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/5] i3c: dw: Preserve DAT entry bits when restoring
 addresses
Message-ID: <aS9X5O+Pmm2uyBr+@lizhi-Precision-Tower-5810>
References: <cover.1764663888.git.adrianhoyin.ng@altera.com>
 <117625a9a02b2452dc33df87348ca36f59ead80d.1764663888.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <117625a9a02b2452dc33df87348ca36f59ead80d.1764663888.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: SA1P222CA0187.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::14) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAXPR04MB8368:EE_
X-MS-Office365-Filtering-Correlation-Id: 64d664ae-5489-4ae0-fb4d-08de31e87f56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|19092799006|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GycS/QSXwomVtqpBK03Bxc2drz9JxnRbHhyCgClrdb6khZ7vkzwZ0Ag4Dd/v?=
 =?us-ascii?Q?ZkaurcVop/+E2c54fC9d1wCkIhhxrg83u4HhwFJHpqCgipOrKIqOTh1oARWm?=
 =?us-ascii?Q?QAMiOSrEGTBi1mR1Awdy01mORp0hU3p/DWA2yiK9u1vIdbnqvJeyB6R7AAnq?=
 =?us-ascii?Q?k1+PzPwHrU217LLc2ix+X+al6LFrQDCr5g5Exp8UEnWBNcvtvEXlbDj+qCZa?=
 =?us-ascii?Q?r4kR/YayPKcDLPypoOzFj4Ga1aiaujwIyEPpe6KiiCxH5uBig4ugr6zBsZY1?=
 =?us-ascii?Q?LMEd3fQ6jd/p7RhPON9ETUEWe71B+g4O0a18Boxan/vI/PMQeaPrdv0T2BS/?=
 =?us-ascii?Q?b5a3dG4rQySzYjFNtvYMC4T91kGPjwgt0lD4400J8Cbh8/11S0DXxx5Ok24r?=
 =?us-ascii?Q?zh/6RDpp2RfKL9TQ5rev2PeKjc6oQwbk9hKM96pupmA8P05+9Pi22W0+C+Pn?=
 =?us-ascii?Q?np1/UsFRBXro8zY7EVZvwjWJshHhA4ZHXp+AcDh7v22HcGzupeimICoKTnx3?=
 =?us-ascii?Q?eJ3bRhkSEKnNoRlNJ/2z+i34gNT8O/R963BUHvNtU76tYMbtRPpGtdm59j0e?=
 =?us-ascii?Q?ofaNQx5jlJAGWUrR+2bE9B23QjeLbtzQ2qOt/BBIbMyBwS7mxdbgLHS8i9ev?=
 =?us-ascii?Q?+TdK2Dg1gzNh4wJN4dTHcaakm921IojfWQRBU9rOVlf01cwc3rw7HktjfvBf?=
 =?us-ascii?Q?jt0wfzbsE49lX9ZDZghQCjHKCEXaINIXPsgeqPd+X6YnBExHexjvb7UXi9jl?=
 =?us-ascii?Q?ZTgV4XNfZoGCKvhF0znPrLvzC0P8MPMQEQAvBZzM6GmkukmNJ5VDZRxRLZBP?=
 =?us-ascii?Q?N/qVQt0XnkwOmW4nV9KiN9+tWvoC10Tya/2BMsOunf/TTqybk21bpqevLdi3?=
 =?us-ascii?Q?jWO6lsd8kp6uvV5M8JIu/xnSFF/Nh/fcx+hnTz2cmNjScgbn21KBUEweWk1Z?=
 =?us-ascii?Q?aUGAflz4CR9udwYBCsLjWU00ffTEREUGE3uJamQS0K8aHoc2doO57pb/Rgoy?=
 =?us-ascii?Q?/9hHPFEhgNIUyEpFLYWOGd3j08tOrLhASXJfTMCzXkxU6qAms9uuYo5JvXs/?=
 =?us-ascii?Q?/zYPhthSs/p24GhRq5aVLcqGpV01zMV7XYo4HI4zzaT/5dkcaWq4yrQvzZgo?=
 =?us-ascii?Q?tjS4z1+F42cAnt1t1kXYfmKVRhVwCxoveJvKCGbsprpfRSTXHbxE3qOBlKM1?=
 =?us-ascii?Q?XJXm4WhzZQlwQZP/M7R+KDqmRZE+MrcKNyqIXyCIoiTwHTkUxIiLGM/VhnL6?=
 =?us-ascii?Q?L20n8CszJ7w/Ms15AKmXdcueV3cCnFPYgNIXGRfed+pOcd1VvJcI7s7qWJYe?=
 =?us-ascii?Q?7YYinN0gdsMdn///+GGRYJmQVStLnmgBdlq8AnFtxuFXFwjQ4Se5x4RVjdDz?=
 =?us-ascii?Q?qpKVWJYCImjDCLZSTBpVo7gDg9SXRRjTXMXCG5oFxdNLdjlxtAeg2K1yCoub?=
 =?us-ascii?Q?/A6qrkZiYm+TZut+OtppvAqcaMfypmpk+NYObldbN8zwVLlaNfto1l4UNI3R?=
 =?us-ascii?Q?Bo6I4CrjaZOxjf/AmTMViqupmdTatdA6ihbt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+t1ZWRdzfbfeI3bTYofptqcZZ4V8ysSXvcgMOquse8YCHHB+G2bfibSUJIal?=
 =?us-ascii?Q?myHkRkq9bMwVzY/0kyxFqM3CYVHPPPjidHQe1CIHVMPQKe1zsegDIZMnE0qd?=
 =?us-ascii?Q?QVauzX5x3hLFYECbfmsuLCLlb3vCqm00sm46C9X1iNtaN7TaW1wbJr1GpUNs?=
 =?us-ascii?Q?LNmKbIdbNLTDmtvyyNfSzZujmn/vrmax6H+OfPmm8jMOZHwLGQx1Lfbqr/e3?=
 =?us-ascii?Q?Ct+Fr5xnyDyXotPrz2xtxgbh4RshhEcv4jPERcpvr7Ml/UF/i6DbnZs3ZYIF?=
 =?us-ascii?Q?hWo5LgkX8bI7klpRDjm3OevgQQ6n3YkQr2DV5P+bfoLI5DAKZsRSyp98l3Zt?=
 =?us-ascii?Q?Nq+NPkVCCXFlkbG4iERPodqpsZwcOkOtNPCxZ1jKfpOjjFOszulblMAwdKd+?=
 =?us-ascii?Q?brnZ7Drk2TPN0Ow9Yi7AyhHzK2YIuzhEYfxGeplurRXa2b+oV0de4j7G+TWq?=
 =?us-ascii?Q?Hx77DNzJRXdoA7q0kGE2OefGS8SlJrLIWlSx1ZihRG1v6VDTriGQVr6gIitZ?=
 =?us-ascii?Q?uWRCY94eNJuHT3dG29ClO1O997g4DNNhgRw67I117jucvvVO7Nhhb7Zj18/w?=
 =?us-ascii?Q?JcIOO3bP7OJmUqSgX+4Z/xqFUFverUuo8rJXcZvhyRTz49WxYOhKnft88eKZ?=
 =?us-ascii?Q?x8uwKMN/XgpmGUr66ogJ6lSVcBp+7xIYoeisLqImY3ucOpTyNxFoMr6/DUu1?=
 =?us-ascii?Q?F0JkOJOAv8kNN4pMcn/4XsWYqAUhdA5HOXJxuo5H0LbyWFuq9KY+fpmROe7w?=
 =?us-ascii?Q?YUpzEXymxDKw1gGcCXGELNo8G4KBXrSLxDuFLjn0TUG6va+9kh7YxLupQmq8?=
 =?us-ascii?Q?0ZQcX9f7V5WNVC9V7IVD5t+Aa33vwlgts6L1lgrNVOQrjS7izveIIgyJOjvY?=
 =?us-ascii?Q?NUAhmC0rDRzC64Hv4NDIyPQAK2ADsgi9iLa2rzH9zkVAQinq0PVy4iMEyV1O?=
 =?us-ascii?Q?wT8apY6BIacgKaV6sS/pIe1urUoDbdndXmxz7qJVUrezN2twN7PmpLUC4Z6u?=
 =?us-ascii?Q?w6OJ3gYsjED2YlmLCLnd+qXhU9EfTjE/IIxPGh+GaUmL41RdoJ6DzVnCLmIs?=
 =?us-ascii?Q?b25fOHhZbyiZ/DumgRa25esF6I8CHV4FzGZk54ucQY/BDGWjaannaTDfMkhc?=
 =?us-ascii?Q?1mq8EdaZandn8PMtV3W6TJAH7jIqC/GmueUL4QjdPruGp5dVKO4uTGlr6pUC?=
 =?us-ascii?Q?FW9Cos6cFGLUVFC3PX+rhRRy5hRCPvjbE8naf2PehY6JuL8YXcObhDmDBPJN?=
 =?us-ascii?Q?Y9etqS1oGwbYvaGzDGx5mH1nva5WQdL3XleVfPDykm0GkH7DndL7ciuRrGib?=
 =?us-ascii?Q?86lbo6OymUvGYpGgMGNj1c8NmrWgzg1A8+PwUERDXvZ9N+h0KCqKyMKodYQ1?=
 =?us-ascii?Q?WqBvz7H2eWgABkf6hpAlskSODC/9xewz6FockVc4urQaF1JCahAV3etjPk6m?=
 =?us-ascii?Q?BPjd9dSGy25Q34wpkmL4doBVhiEHRSB+zJBluHxw8pvhN5eRbvcIVBll3ylA?=
 =?us-ascii?Q?MQ9vlqts08k4RArClQVRdr+Ye8FBgfD7Di9L3vz96lFpKhNZAaxc0pgunfkW?=
 =?us-ascii?Q?1LOJQaadQ1fo9jHKpCGEfkrFY2BtzN+BfMXgdh5k?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d664ae-5489-4ae0-fb4d-08de31e87f56
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 21:19:37.3572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PIVJMqTUeVuuM5PHMHHGNVUNrut/d7RGJobJYjkP0Nj3FHIP9nK/LG8xwPCv+BcU9CzuSd3IU3aJsEf83jfObw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8368
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_131941_285167_71FE9E65 
X-CRM114-Status: GOOD (  15.18  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, Dec 02, 2025 at 04:26:13PM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> Update dw_i3c_master_restore_addrs() to preserve existing bits in each
> Device Address Table (DAT) entry when restoring addresses. This prevents
> overwriting configuration bits during PM runtime resumes.
>
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/dw-i3c-master.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 1c1418d0a62a..36afd8ff4e2f 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1692,11 +1692,16 @@ static void dw_i3c_master_restore_addrs(struct dw_i3c_master *master)
>  		if (master->free_pos & BIT(pos))
>  			continue;
>
> -		if (master->devs[pos].is_i2c_addr)
> -			reg_val = DEV_ADDR_TABLE_LEGACY_I2C_DEV |
> +		reg_val = readl(master->regs + DEV_ADDR_TABLE_LOC(master->datstartaddr, pos));
> +
> +		if (master->devs[pos].is_i2c_addr) {
> +			reg_val &= ~DEV_ADDR_TABLE_STATIC_MASK;
> +			reg_val |= DEV_ADDR_TABLE_LEGACY_I2C_DEV |
>  			       DEV_ADDR_TABLE_STATIC_ADDR(master->devs[pos].addr);
> -		else
> -			reg_val = DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr);
> +		} else {
> +			reg_val &= ~DEV_ADDR_TABLE_DYNAMIC_MASK;
> +			reg_val |= DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr);
> +		}
>
>  		writel(reg_val, master->regs + DEV_ADDR_TABLE_LOC(master->datstartaddr, pos));
>  	}
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
