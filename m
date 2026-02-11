Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BE2E9E31B
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Feb 2026 15:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2H73h1nSM+hGArb4JDuFxFdGpau8s/wcuhOi0aXCyDw=; b=x2+OOT7xEU7VR7
	TAGR62f9qqupG+6J4wOQkIb+ojnjpXn7p9JmrymLkG35TAL676Oyt6U9A5Le1kzrE4upPuQR432BC
	Xg/nfEVCcWzwoX74ahgDi4aGz8sCGa3DCM7Knu0N1MmpKzq+XQznFcaxWTGRGD5uvUhvAPcsp0hdx
	XAhXA3RJshiycMeiycwFoFijMOTmMWOTGwMqyJ2YxSOGt3NQ+k3kuEK56CzDcVFcTXrsEmRVP0sIF
	w5kIwc/Es9m3FaYZK0mADaiQy4RMPrsPj/W2j5R6xrRNa+ClwYxqUG/Ff8cFUhZ/mUm6b+NKKK69E
	VSQSTEkMHtWE/M0AtAbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqCJf-00000000nc9-2KFl;
	Wed, 11 Feb 2026 15:39:47 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqCJc-00000000nbm-32fB
	for linux-i3c@lists.infradead.org;
	Wed, 11 Feb 2026 15:39:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrydYxoi5LkJ1kmY+GRN9i2fchwMlCUNeIPaS5Rx2khSL6jxKzHWJmqfCceYfzqpff8xKQfnDmEh0/2MmFLfKs3Mh8ravBAsk7bs2lagAh4ZB5DRmb8WYgV1zwtn4yjzQOebNq7Le2Lje1f3TZCic9EVJkoXhoSilljmOyDxXwMEld9U1EBDH4KCR2GHwt549hJgczWBjiFf202VbpPbGWWZbcLMlGYCIQXNQhDH9j/WGDsD6qlV0t+9G4ScbxxqBYE1Lrk4BeIriBurMSDyvg+DwI7/AzEAB5MtN3YtIf31tIpEkiZuYY/51sSuzBoihA1TGXa8UJRSAgtT4G7yAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEFLUdR+AmkO77dyF6D5errjxbkZdS/n771SGPd2Shk=;
 b=UwCzleO8qXpLRmWXuTY/jaetVR/q8AKn8zda9W1Nh2TsCkBYmE677okIjA9XSS0sqt5C7Bel5/bwdwOjnQuA3LxZQ5zcTXOUFtnX6Fb2VLwPeXhHzJNLbuW+pVF1dWHEtPcyfzPXYLMIewkJlnvQHidcB5cHAeJYaFZXjV9+NHPm4XfoZxPJllwvB8XBr1DwdoxLO8xYWrSHAugnul8TKdkeR5fEOZRJ69hjX5N6VD9sOxJareiokwdezdls0NfHVKTiXP0OKpGWfvi597H0IxLhbfJRP357gDZ4jbKwLyFVC62LsML1WykbJXo3RVt3cfMEkn+oafLSKiyORY0nSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEFLUdR+AmkO77dyF6D5errjxbkZdS/n771SGPd2Shk=;
 b=moFNCZKhIG+OtZomXPSvDp8YR5lUD2Nt3/mDgiHwAe5hWO7FmkaECUdSMURLnj5Q+WQLZagNjeNMbsbEMEtIdHfXF5lSj8SaIQKlMaC94476yCnj9FPcW5fJdoWDnBgwgUxwPu1qNyO5Zf0gbWPaq2+WPH0zj/PfKORKs5LmUx3UymwU6cZpV0Th63uQK188j07hYT25qxsgHPIbwf2Dmc3WLxj4qp/Hju12I54pra2DBS694LaJQ4QgaQgHSWzSiNIEqzjyBqRk+ueULXLslJMoP2fTqneZdkBYC2Ja+LfEwmLtmTf9326L1ivIHITSjAEFhCcPNPx756xW2tG2IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9260.eurprd04.prod.outlook.com (2603:10a6:10:370::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 15:39:40 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 15:39:40 +0000
Date: Wed, 11 Feb 2026 10:39:32 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: dw-i3c-master: Set SIR_REJECT in DAT on device
 attach and reattach
Message-ID: <aYyitDINHJNPaial@lizhi-Precision-Tower-5810>
References: <8bff67c9df8d56a3d5e0191bc935362ff6d3c573.1770796093.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <8bff67c9df8d56a3d5e0191bc935362ff6d3c573.1770796093.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: PH0PR07CA0069.namprd07.prod.outlook.com
 (2603:10b6:510:f::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9260:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fbb4bf4-9919-45f7-b9a4-08de6983c4f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|52116014|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TZe5OGbHEj+05Zmjdlw/xEImER8sN/rZGc+j/fCidVPHUbr9SfXa8Vft9iyt?=
 =?us-ascii?Q?FV4h9KouJ/aCml8nusYeT8mJIkRTN9VbCRhYFRDExdM+YSuY8SwKBxVLZqJL?=
 =?us-ascii?Q?+T77b3Zi8Y2TF45fd41nYU87ro9GHImgafwowG989mUSCuU/C9JTgir97xFz?=
 =?us-ascii?Q?S/Gz+8Bz6ljk1hYMlIPPRH02bAxhZ94VDUwLZVn+O5Qu3dC9+wrkoyigPeu5?=
 =?us-ascii?Q?SEmxRq9DSraCbZhBj6g2UKIktM5E0RfOBKLXpbzEGbBW9MQdmgRdduXZ3l8m?=
 =?us-ascii?Q?S97c+Bb8ID9wZXoqSzqse0KAaGpw0+8HT7ez5Q+5BYtv3IBrsn+2Ul8U6nU6?=
 =?us-ascii?Q?B5ewIXiRg8RVxoDjX19EXZNyTZYyY5nKPz9JwGiCInrZFHVfOJx98Ct4/dU2?=
 =?us-ascii?Q?1x1nnSZLImvOLo6ehxqbFYSjVng8mHj5TnV03TGDSdWNB4f5Lb7BAhgNf42E?=
 =?us-ascii?Q?scsNRTDaCgOqUBU1UvQf22D2grKewv/cErt5cPrOakeTsvOKQhwZ6puYIP0C?=
 =?us-ascii?Q?7X6ZfBwZn8nCcrgPlWwfOmdWJMfS3wM8ePrkTHxvxT7B1qHPH3bFxJ0pmRQK?=
 =?us-ascii?Q?LqPPFdHSBYyzFGHrp5gbzfgTU9/8/AJO2/SP10ojNuOVEnoXt2ZxFUJK6EaU?=
 =?us-ascii?Q?tmCQjbGBqyKzD2P7R4WqNeKxA+4gV0XIseKMG6fhP2pVVcDrhX4MR4djIhoF?=
 =?us-ascii?Q?tXhmm1nKKMM1h7qEmq7aBZf/B8ZethrJRzne9IDBFjgyCpS1GGCLREDdTxOH?=
 =?us-ascii?Q?gqzggZfm7/THIJ4ol9a/pUurrthMXQGOE7ERxpwGeGGe5/MZpMJZ1NcCejn/?=
 =?us-ascii?Q?XPCdDx2jAbGsHEnSskW2orIB5Nc/WUjPgVFTfkiLqcOCXZpJUcqAXE/9FFKV?=
 =?us-ascii?Q?6l8lPRsehELxIKYKIyAnZRA3h5xr2sZSvBOwmIt9jzrru7orCWM9VNoYQL1k?=
 =?us-ascii?Q?jxmp2xIo0axLS6eBoMFdCQD1Jyme4yFyZJNi2cjemgEtDtpCxf7Ltd1aY+Jr?=
 =?us-ascii?Q?4qtdk/SrQnvvmQItG5Gv/Lxcs02VDEXue3TkwKrp7Q/K4D7izHnqw+FZK5Mo?=
 =?us-ascii?Q?xlMgNYqDOZV44Ygtcxn+VzUalIHi71QLrj+fK8YneHMBRwyggbvg/kzmECQM?=
 =?us-ascii?Q?WNusP/SxIdfgyx8DAhOADmgvE103hA76GUywiVx8oCrB5A20UJUZVgHWM5aK?=
 =?us-ascii?Q?Le+BSpcD+xhswUxP1OzEOSt+cJDf6h1GhrRHVxzEQj4w8x/6xwcYC/50XW8u?=
 =?us-ascii?Q?pWV8TBILzgY/c1sLVxOq4VTC4bXRyRtcumOmBfyJtST0IYOVXDuEgPrOGbKk?=
 =?us-ascii?Q?yDvio3315hoHf3lBP5quPAm80EeS0TK3ZgakTBZ5xgNRoRWojE9U/+FwvRql?=
 =?us-ascii?Q?/42b++tOdbV4lBEBStRjSLDV/HMbr5mo4WWtAyejy6/aFMiThD/syPjr19gZ?=
 =?us-ascii?Q?W/C56nIjrghkKTJtUMQoCLu2c6qlJt+jq0pVd49SixW5GtGqMyetHZ1L6OMi?=
 =?us-ascii?Q?hyXEVI59ferFoi+IDtMIdE56O/AFEqyWcYbc+HAiv6Z/gt1m9viE65ZPlHbX?=
 =?us-ascii?Q?yyZ/fkB0yUep/GXA5e7bDqax9TpF9dKwDriP3PAhZ8E3y9xbrSt3ziHal/R+?=
 =?us-ascii?Q?w9Zntt9vAh+EuivsqrQxkZI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fmLbkLOLjkNAVZp3tlbY32xn+BrCX/bQd65wAbPWVTfAZ9J4S2VSVxso7wei?=
 =?us-ascii?Q?vhU6yTGEt0m2ifqoFy5ycvKHmfzwbufJq7grdc8hpxgkXWLLDSADCYMrj2sw?=
 =?us-ascii?Q?yyu68mvdR3U5b2bCOXsugDeLKi4d8NVL1QfP6rA+j9Zc55ErHCGazJ0l/VNH?=
 =?us-ascii?Q?AJOwcCxH1o0zei3SxvkhUTVxiD9N8INrbYwBn/j/ht63he1iuQiw0nA41wZt?=
 =?us-ascii?Q?U8ygclPy8Dr5+OJueSoaPVC9Ncz2eQ4KoyKMjNJMoDutUBaSUipc9CPzboSg?=
 =?us-ascii?Q?d1Zz3jvBPmJ47OCSt7jDPXOqupGj5VAHGIpx6rt3ahr8Srn7HNDrCO9EiPqQ?=
 =?us-ascii?Q?5lPLmrg7R7ANqxcoEYeQItLgDVrJZJrmHGBeQYpaIRfAwMKYzXc9P2OHDJUq?=
 =?us-ascii?Q?phcg/vpKHUfpaNxJoIgUi9Dd//HZy6t0JV0WKCvy9mdzRa/xkRZy0JgSP5Sc?=
 =?us-ascii?Q?enS+4Z/x0J+T/6dwktz1LYbk6tpiqHo397e216LoDf1wjRG10pHs3eKuFMAD?=
 =?us-ascii?Q?UhXJEsu7K+S8A+Gk1k2B8OPsYql4q7J4qpSJDcP2vMQgz8gRQC4d4FmptcpS?=
 =?us-ascii?Q?+nvii/tpJLwIMaHW/r/u1A81IIlWzApmWf8Z9QLjh1+FNWitB/ilO4QAoMms?=
 =?us-ascii?Q?542e0fOQ7VFptrVNgm3yDa8JwrHDHMEZrbBIzTwe+y7Fzyvwv7PZgd8bQ03g?=
 =?us-ascii?Q?KpIzWg2Kca/ATBJXGK/COdFXyJEWWTyxrwPbvDZPtZ1JPJ2BvOO3gAinmWje?=
 =?us-ascii?Q?wnY0vRCWNfzgItiF8gBLRu2RDc+i/cUVYfCbPI3LDJfM53U8ni5a4/Q+85ce?=
 =?us-ascii?Q?9ivStSND69i8gb8fwwyFXzI8h/CpYtnM7MSwPhwRXz8zsd2h1eVSkGQAJQjV?=
 =?us-ascii?Q?UCY/uVyki3Gs4wSu/UoGbP1yyhpyIvmlTEKwsghTy0VC4BT9W/opUqCUaPo9?=
 =?us-ascii?Q?MTDbtghL0tFf0yrAlm1eYPQabPsT0HTWWNMa+InkY5+iQqb1JvkR3ZhlEN+t?=
 =?us-ascii?Q?ltowiaAiVoKZvsZ8f2yekgq4KgxocHLLjpewutfnS5LaiymhCEpcEBiu47Iq?=
 =?us-ascii?Q?AnHAsssNghT46zTuDyjOEwthS4lA//MxMWuHOQtTBvFQQHsRtauyhOo8xbHk?=
 =?us-ascii?Q?nn9VMgl+YKQ/k74l548OcXsL44SNx9v1qZjEk5hP58r2xwFxFYfhtogLJ2HT?=
 =?us-ascii?Q?T/eUYfRngRMqTkFi8shl68pWChPAe9oXeiMZeWz3nYxdjXhyfsj5FIBN39iq?=
 =?us-ascii?Q?wMeGXPaZDQhgF2zl7Y6MoBT3LEN+TrY4nGecnxFfQe1MJHIV0jNxnm7Og+ac?=
 =?us-ascii?Q?daAyQ4/qVvpd5Q6ZLj7g1qhyaqn7F9Ts/ukgY+wPK/ddO+Wub9+JXwEPQvx/?=
 =?us-ascii?Q?P3cxUqHs8L/OVTTGbdZC1JtJ22vCVWloW9hTNL7eVzeXy0nj9MbDL/J7rNeB?=
 =?us-ascii?Q?V0cA48oLJA0/eSg/7nsfrSqIEN4ujEIUAlYxHyTFEn7EoRlU4IBNqDv63vhl?=
 =?us-ascii?Q?7vLVTPtoHmE4eTLFBXTaBcbFZfVAT4JOIUfQsMjJCrCZjSSTQTGWlTN/lAaB?=
 =?us-ascii?Q?JCMzo5zXV687Pm3hSXIy8E3+DVVMYBXfUj/3MDscJFN2/GIJ9DD6uBYJbZO1?=
 =?us-ascii?Q?BJy1hyodHih4CJwXxUzNG0XAf92MfTEHFRvEttwRf855aCnDDcl8Nb3R6t8q?=
 =?us-ascii?Q?kXzeJRnmzp8NoLLtjACWjAE/X5f71x8ApXeeDM2Aa4+Z/haR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fbb4bf4-9919-45f7-b9a4-08de6983c4f2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 15:39:40.0548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ZaR9EnE4Vyg5Srqdozo9OL0+mHcu0NMRtesujHU1oQbYw0e7WyP7X7nQy67kzQX8a7Z9Po0OIA9y0rO4qppfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9260
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_073944_767547_82A59398 
X-CRM114-Status: GOOD (  17.29  )
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

On Wed, Feb 11, 2026 at 03:49:21PM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> The DesignWare I3C master controller ACKs IBIs as soon as a valid
> Device Address Table (DAT) entry is present. This can create a race
> between device attachment (after DAA) and the point where the client
> driver enables IBIs via i3c_device_enable_ibi().
>
> Set DEV_ADDR_TABLE_SIR_REJECT in the DAT entry during
> attach_i3c_dev() and reattach_i3c_dev() so that IBIs are rejected
> by default. The bit is cleared in enable_ibi() after ENEC is issued,

In patch, there are not clean this bit code?

> and restored in disable_ibi() after DISEC, keeping the controller
> state aligned with the device event configuration.
>

Fixes tags

Frank
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 7eb09ad10171..d014f2cd6071 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1024,7 +1024,7 @@ static int dw_i3c_master_reattach_i3c_dev(struct i3c_dev_desc *dev,
>  		master->free_pos &= ~BIT(pos);
>  	}
>
> -	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(dev->info.dyn_addr),
> +	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(dev->info.dyn_addr) | DEV_ADDR_TABLE_SIR_REJECT,
>  	       master->regs +
>  	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
>
> @@ -1053,7 +1053,7 @@ static int dw_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
>  	master->free_pos &= ~BIT(pos);
>  	i3c_dev_set_master_data(dev, data);
>
> -	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr),
> +	writel(DEV_ADDR_TABLE_DYNAMIC_ADDR(master->devs[pos].addr) | DEV_ADDR_TABLE_SIR_REJECT,
>  	       master->regs +
>  	       DEV_ADDR_TABLE_LOC(master->datstartaddr, data->index));
>
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
