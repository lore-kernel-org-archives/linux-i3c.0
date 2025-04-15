Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79419C369C1
	for <linux-i3c@archiver.kernel.org>; Tue, 15 Apr 2025 16:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/U3MLiM83pqtC5Y+5hGqBJFAJo2Ur/MndQFcgLsIY4=; b=P3t5EzRiBeGY8N
	udqlEpX85UYHMTexxBPiEkXmHkiaAbMvY8Ey6DYgOAjMX2L/oHAzY22MGLVRZIdfO/2FmLA7VGWV3
	1HYQkgKljmuXR3irKTkALU2KMSYfs4ETyRTFeVKpJB0NDxizAnSBLesygDlx5OOBP1Dt9EHTsZ8lS
	a2ZHAwVvkZXDVak1/uJ7xkDoSLvTumdmHwjisQMiUfcui3YZWxOvmxZGt5ChU7BKq0vXGhklDOBxE
	tDb43UHYYZzkKxzAddl+SzBJ2j4KJZ1SAUop0R9+x3JgYQQ+Eo07RtfPlYt2CL8OGlydbdynsaga4
	Uwz9AqupJRcm6mU65SGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4jL1-00000006RbL-0eGT;
	Tue, 15 Apr 2025 16:40:43 +0000
Received: from mail-northeuropeazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4iwZ-00000006Nlr-3taY
	for linux-i3c@lists.infradead.org;
	Tue, 15 Apr 2025 16:15:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3r8gcLRtRkJwJNWLA69N8hvjUR33Y2qvJ3Vc2MeA71VxOeMVfl2cgqJI+Al3zL9CtzU+I/1+/VCvra1KFHmSe1N6tS98NYZVXkGpRcVMtYm15XV5rPWPneMwNgCW2H/8R/VFoXn3b7gyZBpUkQ4U6/qpldnwrixkuGWkpn+APu9TLvzygII1AwGHp+KT3YmaVem/jiuarjBKDnrb8YdqWI2GK6Ttg8Ex6Nf3sn5Fi06rOC99ZXn1ObQEcaWjJ0xwUqDg4aCwPNRj4Mw4uguuO52CzDvFzB1CSB4k28jmoV+gHtNFqirzDXs7zzBNs6Han22lDiva3LJabg7Fu7a3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHqtDAAITSLgUf+Y20C7/Infe2Aa39qbgsJvy0QfwKg=;
 b=LlhjUfmkAWM+d32q+isuw+0xWcseZQVd9KJSQ4YucAXsBxNrzZaxYSYFp5aIIuIS8rEIJk7DReqMCivX9sQbZu2RsWL/Buj7Df2PetomM6IqlaWdRRt3FlvaccoC5xiRNPRRW/viHqr8jpUQ865azwK5GCSjyN21/GrlrVM4B+1aUtWWhhfjx0IBcSbYWzGMNZlrQ4Sp8s3j0P9tsWKt5HbjRAMv3uSHUk43/RiZ36/8FKg9r8z7I0JE0CxBVgrDrqi23H8cLAse9JhYJ/woNhYa5f2NGcrR3NNbxTkZrIaQd95Kf0krTBTbhG1DtwpKzB+kSArrdcWjJUd0lczTGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHqtDAAITSLgUf+Y20C7/Infe2Aa39qbgsJvy0QfwKg=;
 b=g2VmksizF8CngQhzonDFIvCkvGwgsXJN6ACrjUBmDsnVyyGfYnR/CfXQzVSx44eAF/m8OdDpAMGMwMWx5zB933Lj2hTe+X88llhxsJNpV0rY5ouU1/jfkRWYB/guRxXGfMcsiYp4mW5K+vRJq7W579/jEzm4Y3Zsd9rFlgCclCxWgI85VygakR83heJltoSrIjS1T1TEMeoRdWbJtg49AURI57zlaBTpGPc8Cp2R06alMkJI8kGX0hfJNzlfWmDWRj7R6WAMFEiqyXY27UGE8TjbV/yfdQIFw4MR0okD6eiM63gwHpi9oHmXAA/WCHICOdts9YC++eZ4Z8E1yb1ZwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS4PR04MB9649.eurprd04.prod.outlook.com (2603:10a6:20b:4cc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 16:15:23 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 16:15:23 +0000
Date: Tue, 15 Apr 2025 12:15:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v1 2/2] i3c: master: svc: Emit STOP asap in the IBI
 transaction
Message-ID: <Z/6GE9TWVdC8A2gx@lizhi-Precision-Tower-5810>
References: <20250415051808.88091-1-yschu@nuvoton.com>
 <20250415051808.88091-3-yschu@nuvoton.com>
Content-Disposition: inline
In-Reply-To: <20250415051808.88091-3-yschu@nuvoton.com>
X-ClientProxiedBy: PH7P222CA0030.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:33a::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS4PR04MB9649:EE_
X-MS-Office365-Filtering-Correlation-Id: a69b2239-9c43-4649-a8b3-08dd7c38b9e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NtTxBili3yqlYcamDRD2bGZbKPionAi+gEiDkK7vX31FUMgXCmo43R6MxHgl?=
 =?us-ascii?Q?juNm5X0mvD2ixGbpb0+SG/aniw+p/PUQs+b6pETiX5NXqTL4SQrxbgqk7zM6?=
 =?us-ascii?Q?c6njopsBiCuaBQMp9Rq9SBXtRFo1VEb6mACPTlSkDPtujvb5e4da42Ida18Q?=
 =?us-ascii?Q?ZWG6qvC8FmMcp29rfSk6yRIuLZ5ZHMxPbV/GJMwtysHwsfUWxftw/wrBgfog?=
 =?us-ascii?Q?CiwoRvrY48cIJjTYCuxkDn+1sTdZwTh70Q0k8vOHSw+R4YGBNN/0GM/GzSQr?=
 =?us-ascii?Q?MUYB/sjdys2sYbTZIl5h5QAIrqe1R1xxBGlh5USHaCD6z/Y0VYWzoTjvvLh9?=
 =?us-ascii?Q?ddMDeEJ/sd3dt8YY0RYGXCCFiRjZqqEA6mHOmqq+NeE2MQ5Bpq8A7I4Pzz5F?=
 =?us-ascii?Q?zeoRg8AqXSWtFIguQ7KIEEufyiL98nQvED0KL7fG/QCCHbSr36PWkwUrh5nG?=
 =?us-ascii?Q?1uQ06wuG+kqi28i2N0bu52BQvZRJcBGubUIP5kStb4lgcOm55R7JWzc8Ub/e?=
 =?us-ascii?Q?rbTAsXT5xjiRGrkHNijw7+rnL7upAndI+9XZAZ0BeT191DsWA7cak/yWUH+V?=
 =?us-ascii?Q?tPf5HiLv1Bj/SxrKVx8cnageko3/V5GmSzWK2NvJ87BgeS/FaW+OZUGj9Ka4?=
 =?us-ascii?Q?Dyk6mTYdY7dbHfPOratwXBsPF8BmQzU3BCZSmkSnnfhUzQ0HsQHitzG7VCoZ?=
 =?us-ascii?Q?3SPOs2hy5xi4EMb+5n2R3UqXlVf2e5/jTK+15CSh2FIENEF8eqjc2mcuNVKa?=
 =?us-ascii?Q?8D4sm75tMdSaniuIho2OwJOCwLImpI11Fyg75cBwT94pvAaZd+PqvejtJRW5?=
 =?us-ascii?Q?NFSNiOzmW6cVRiiYp8Rz9W6xwzDaUmBF9swlWLJX3B3U9bz8Py6Xh3nTVLPD?=
 =?us-ascii?Q?qVMHUbbte3yNDXWan0BgqwPGXYtyP0FybAnBoIn9Z/uMEnKWa3oB+xbZSHxv?=
 =?us-ascii?Q?bcYUW6sSZe3iqn6rc+yJMVVtUIJYdKxjDuZ4NwWQmR9S1S24AJgLNYorxHcq?=
 =?us-ascii?Q?Ow3AMRUm54mXz9csRu39J8yMaXX/B5wtfMHZvTBse3mxSDYNIF0msTFv0WSz?=
 =?us-ascii?Q?e9B0k3ggPmZkzqS7sEtL4lzczzYuc7m4Z24Ozzm4lagpPjMMepuZf5uOnRe1?=
 =?us-ascii?Q?taefYwvGGR/+scA/2JX9Td/wPdcZCL8GyUSQq6W3lkaVTOtByNP5A+qdZsET?=
 =?us-ascii?Q?+HHECVsovBwZsSWkRO75tPavh+wInywIvqgN37/WdNvt/bxwFyBDs2XCRklz?=
 =?us-ascii?Q?wbUcRARQAALd8uY/cjdmvxBKTTFsB7dM5RX4EmnaLzpo6E5T2fnxTRvKq9zl?=
 =?us-ascii?Q?D6ePY0t6R17BEX8KWG17tJYO/VR1Fv1LiifpC4dsdM9L+quGcZNaPbl1A2di?=
 =?us-ascii?Q?KeBwnXM9CQrmMlN61P8gGLgROfHHlgMeZ8wedmyiyFnyd1MrEn2ikUzVxtXM?=
 =?us-ascii?Q?tku2U1xocvpfCwEObCbDsEPIB3s+8FXfPADIzQl03RzCQCsWISb+3A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cob0tWS6t6SMTN8jG5JCdMcfnhLqhEv2+82bjFg+9b8qkrJR0R1tAzKAiGkN?=
 =?us-ascii?Q?RoecoANgtAXOHIg3vH3Qq6ysbR84hZurZLn7LDDYvpF6Ecaeg0i1W+YGwkxK?=
 =?us-ascii?Q?zxqA7g6nuJ7PaK2OPbEPtGctMCGYB47uMvNss45k/WJhKejsOnU2NzQJIY5M?=
 =?us-ascii?Q?e0KtmlD42XIsGfGr4O25a8OoE/K7+F/gJToC9LlPLCyYBINn8cHAbpQIh+HB?=
 =?us-ascii?Q?28a6I0zaJVxsvTr/HeDtdOAmsi9utib3lW+FtPbih+vJFUbSi540Yd+O8fdk?=
 =?us-ascii?Q?YdAPVLQzS/0yMELtp+TjznXE7sDev3PzqaDqlPw9mc45GwX+M8JAzgmKaSi5?=
 =?us-ascii?Q?N4zC7ZppsRoUFrZEXRh5773DJzAVusNnxVtNd1E7mwPOEvZBjkobEK94mp5j?=
 =?us-ascii?Q?fWf4/h0lXmQpJULVQvzBSCy8uXPMgQjjsIg7QCjVIsiwOyMjbEc4pxgsa74c?=
 =?us-ascii?Q?6/Vlz1NmD0rdHBJKtumpQQ78YYwajiJ4S0BAz1AGkatkjCo0fiYqzT7VAAlG?=
 =?us-ascii?Q?M6701HKSAElw3aEtxaJdNWyqQ2lLAHF6ZvCKLMHENX7ofG5hIlcaeh2lCSwA?=
 =?us-ascii?Q?c9Ya8q78cS/+520NJDMblj84ZdOKLex7UBjIuI911zP9w1oby17IHetahtun?=
 =?us-ascii?Q?KchYrlAoQLJ0E/5pRrK1KZx4HRerLpvHTJWuAnziwrdlFlg1RAZEagvFEX3X?=
 =?us-ascii?Q?CrSNN2TNgpE9oaZtdx8tr2YsB2l6pU73Ao+tOS8T/7PEbM4R2ZoemL2IgJnQ?=
 =?us-ascii?Q?bhyk4MI9sPVc8+l3BU4RzF+A7MkPOwCqvEbDGJTxASakbJFxaZ5iY4/22udE?=
 =?us-ascii?Q?hsuOWKbfhN+XjjQ75siq/GeIZ13Q6HvfROD5ezgi0SMm5rUlS3d6P9iSa9zp?=
 =?us-ascii?Q?PCBM521mxNOO/H+GtkuTGYKjvNa4QZC2AsQwf41A5I5CvGwgP0HbPIcckm5e?=
 =?us-ascii?Q?4HN0rba0RlLFB7S8TTE47aH5q/HS9kunYT+NZCH8Wimfj3k1t0UweMhxYyWw?=
 =?us-ascii?Q?Yn6JMselCflnBsJLLPcoQ6WtARslzwXJaiAp+7LaeEWp4Oomz6ofzdXfEuxJ?=
 =?us-ascii?Q?85zMy/AUw0bsNF0VoOOohR6lx3ahKAxPTUEh86VOjNM6NKjz8LP8Kw+ijJAX?=
 =?us-ascii?Q?psG/R9l2C/6N7DTrt3NcMwjg6ptUyFPvp0rjcdNpDMou4TzxGCkcpJ9WMUe9?=
 =?us-ascii?Q?hpjdPKu2KYCZ71RKgSb81u4ZEPCXVQEaDe4iKjFcrVij/h2aVGEdkeOpE0CE?=
 =?us-ascii?Q?imT5SMY3YVio5wVCW1S4LtGgwYnpLddVgCYM+9onzab/l1iCrlP7+ZQs4fdH?=
 =?us-ascii?Q?iCru/0wHTxPs9bKO8B3MaJsXzI8XdFW5+N1Wye40YsyeziVw8PTYczDFOKyk?=
 =?us-ascii?Q?4REriw5Ez2HBT8s8ojFCbNp0DICIRdSk63yCuQdearTTSAyN1QsFxD6/p2An?=
 =?us-ascii?Q?QD58s6wfK32GHD1Vjhm9XLoGs9smrSX0rVtCQlLuMGGQoiANVm3afcaT8Y0z?=
 =?us-ascii?Q?8J6x2+lejmeBLzCQZw/2XglAhnxgFYppRA1AOzGym70twaeiUGygQuz42RQS?=
 =?us-ascii?Q?gIMfPhOeXrwo/R9NMi4ckx9aHXpEcjp/glWnQ9id?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a69b2239-9c43-4649-a8b3-08dd7c38b9e1
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 16:15:23.6715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UxIU9JLe4gVhVzwbXmSl7/fAIFhO6IvG00kpowgKXde/7J4gHdDCu1UcqISz/E//tCmOV4T3jsrgFSmPz+UdTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9649
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_091527_987078_5F0DD107 
X-CRM114-Status: GOOD (  15.88  )
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

On Tue, Apr 15, 2025 at 01:18:08PM +0800, Stanley Chu wrote:
> From: Stanley Chu <yschu@nuvoton.com>
>
> Queuing the IBI request does not need to be done earlier than emitting
> the STOP. Emitting STOP immediately after receiving the IBI request can
> complete the IBI transaction earlier and return the bus to idle.
>
> Signed-off-by: Stanley Chu <yschu@nuvoton.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i3c/master/svc-i3c-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index 7ceaf3ec45bb..9b23239ad8db 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -577,11 +577,11 @@ static void svc_i3c_master_ibi_isr(struct svc_i3c_master *master)
>  	/* Handle the non critical tasks */
>  	switch (ibitype) {
>  	case SVC_I3C_MSTATUS_IBITYPE_IBI:
> +		svc_i3c_master_emit_stop(master);
>  		if (dev) {
>  			i3c_master_queue_ibi(dev, master->ibi.tbq_slot);
>  			master->ibi.tbq_slot = NULL;
>  		}
> -		svc_i3c_master_emit_stop(master);
>  		break;
>  	case SVC_I3C_MSTATUS_IBITYPE_HOT_JOIN:
>  		svc_i3c_master_emit_stop(master);
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
