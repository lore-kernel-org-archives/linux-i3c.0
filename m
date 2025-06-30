Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AD2C8302D
	for <linux-i3c@archiver.kernel.org>; Mon, 30 Jun 2025 15:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7SuJqCFIvdQOAUYCa7AOBVwdQkGewB0oOm9w+Uo8+Gg=; b=lB6HegmSmvh7li
	+M6RaoBXy+MI+JWhCa5L1CQZHrXN2dxIRwpU1rhX6c6Au0eb1vTKJq6pm2jiYiHQvwmfrBC3Us6Xo
	HJ042Krk03qLAWED1mpmr63PTW68trAdvYulI/r5ysXpfRZWhb8LdaF5esUBPtsT9FKfCZZy8eOIb
	KEcaDzfbQV9HWQ0kPIYFzoURuEuvnjAeAuKj3Ybgj0jxGcuhiLRLZRVmA/NPutyDdDy7InCbE7qbZ
	DteJLemdPmAlKX1Ta00Zv9ySTzwndJnrnAVafa+sY/VZheM56U+VWT3xI6MlgRL1olcuSbE1UpJzw
	+kJKjEvwwbAz6CmeuEKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWGJn-00000002jM0-0p1d;
	Mon, 30 Jun 2025 15:21:15 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWGCg-00000002i8f-0iCd
	for linux-i3c@lists.infradead.org;
	Mon, 30 Jun 2025 15:13:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WsKZHVaj4JkLewi5L8GSL2mngoZLXpVCsUm2YamctmQVDUDM5VsQ8+qbU/QzoNV1PL9Xsnl5gBIwF12tsA/lkl26qg4pxHIARomVxv04ryZd507e9xVV2A4/m8/sLVpmHH3KsySazmYOzX/hJyEYsITZTODJqksCezpXXtWNTAOOv/kTMexZk5+NhfXJYKUgH/P+6D32jXPvnNclwUUQNZbtCaJUrQvjcmLZGf1uN0rUCXy0jUwPp3K67vA3evcbTKBoIlxamSu9i0GxjbRCk0YmZ5l9cZVaMbzIAiFORaQI3myLqFYTqD20KMsrMymepTn68sfYBsAnOQAGrFPihg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFL05wxzFLj1nlBumJAubvH8rM5PC0Ejg9RLhChR2IE=;
 b=bJosteh/ZZ2Owg0NAtJ86NJlL6RUQSonxv//AcapbcBXvgO/PmNXBj0xkuA5gmnWzQkLfyfK/eMSN9IvXQHJdseqCxjawYPwmGhiOW/xBxs57chM0VxGrxay6SGIv1Oas96ubW573VAvHvOyUUNkgfK/yM5Bup9ipAPvbMG0LabneSxRbXSRZvmdf97iv108mVP6g3uEzcW65/E8q/mLgwQgLQ4XszBkZD/lJUpg2vx0/nXkKfuQz0eixGevu8ZJ3Gyzh3sVtLCJ9dtKNpfMVEkyUm6/KrM6/+Td4rG1FYyNAqEA/Fx/lXKuJNdQoOsZnTuMQnxuTXkZKIFZy6eBEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFL05wxzFLj1nlBumJAubvH8rM5PC0Ejg9RLhChR2IE=;
 b=Qeelgwk2Shlgq4VN8FAvgbJJVBuxgsBJmWYAquzPwk4jMM6f1HXYQOzFhAsrGKIdiA1oTpTMBpkxPquhMt4nWYAO3DlGTGRr4uBiAr+pZi9Frre9JK7kMQFGmIXvuPvBm4MOzvFALABs9ENG2OWUJQutRH8wqAKaUzCg/YpobRmmOj3k4RbpAJaOLURsmasnTMxuqykX9JAYN+1hUElUSKmVfxZSfeb4dKdHfLtEYXilwf4wtN0m761ayWXIIcAFzWsWabAhVWzYNwN7D229DjklRjNG2zfGQ2k/QnZjhc+RCuRwO91J6iVp9ieR2r219XD2cYFo2fasPttgOnjCSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB8909.eurprd04.prod.outlook.com (2603:10a6:102:20c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 15:13:50 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 15:13:50 +0000
Date: Mon, 30 Jun 2025 11:13:46 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v3 3/3] i3c: master: cdns: replace ENOTSUPP with
 SUSV4-compliant EOPNOTSUPP
Message-ID: <aGKpkqeb+d+yrvFk@lizhi-Precision-Tower-5810>
References: <20250628192027.3932-5-wsa+renesas@sang-engineering.com>
 <20250628192027.3932-8-wsa+renesas@sang-engineering.com>
Content-Disposition: inline
In-Reply-To: <20250628192027.3932-8-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: AM9P250CA0027.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::32) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB8909:EE_
X-MS-Office365-Filtering-Correlation-Id: 32d99b36-37a7-42f4-cdf1-08ddb7e8b7d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wxw6j9waXzqud7wGfUusojVvYrFXP4els1HTOjtYN0SnOejFzEkCZuAJwXZG?=
 =?us-ascii?Q?jFFHsizcyS5wjT7lo9zJtFSoW5FUlgrjdqH0i7Wf/axzFq9TJHFIn95bk3yd?=
 =?us-ascii?Q?2C8tR+gnamyMxVOIqrI63DHXXrIMDGHE1ikQampHha/gDek7Fajyassi8YfD?=
 =?us-ascii?Q?lkBYGKn2WUSMEk+BS/maA2JvAsyEcT0aIhADhSerj3Z+n7LV6XDVY1BkRpoo?=
 =?us-ascii?Q?oORRksHLzoJnx7f5tCsK9VtRjR4Qw1BxHsP45BE3y2tYNAOkqcQ1pOUbvNSL?=
 =?us-ascii?Q?TjijexwD898tGlzcbLvFxELcJcf9NGCgXMJNMUtcnsBzxtKFPbCxsbiRv60j?=
 =?us-ascii?Q?mBEsgt0S08OneOwd9aHM6Md3s8e3T3nVE2WkKVVpS9VBSHwi+1cDyMuJco9v?=
 =?us-ascii?Q?DSjT+FnBlTHx+a+X9LovSsQblI3BF+bN6TlapeBi0+lXKmv27YNS2Cf/M8CA?=
 =?us-ascii?Q?fdEp+4uOj2pgXgkPBVmmJifkLllVWDK0/NdK0H+0QA7HT+hHhFJmRt0cBALM?=
 =?us-ascii?Q?Ilyc4yjFQlJI2ZPedf7VG/LSzjkScmsQ76r+ksQ/SIe3kAUJy8JKMf3qqY6l?=
 =?us-ascii?Q?v0/8OTdqQbOSuDZpZCey6cQ1uOUsndYpPKdrI7y4AU/vS3jeFGVfEhAdNZg6?=
 =?us-ascii?Q?I0dB/WMwnJEelJgT385E6vlrEbAaZl1PDlVW4Re5XU5HyWJPkCNsgnkeHktz?=
 =?us-ascii?Q?amLu8pYU1D+WhWYBDes4Ysf93TIWMRDyWl8Q5TnuKYMHDj6++5WqEC8QVK5c?=
 =?us-ascii?Q?YcNC+8JDygouNCrKE3S9e8B0rkCc8+/yb8LGiU1pkbZ3EwXylP5AXKGJ5fMh?=
 =?us-ascii?Q?rDqPnCs3yigkYFKTPosx314X3N0HJKSPTzJGtrE97Fo/xgKW91FN9Nz4mQ/E?=
 =?us-ascii?Q?Zd1DczxgMh6iSnIvvYTFBt2EFxJO7UpSncjjjJ8rXqRx/AMzjcuu5XmVyz4f?=
 =?us-ascii?Q?qtPOJ/JofP3Qy1Avj1LB0Kne4Z6u8QOaLMdXbcH3G6HUMy5eZBg0IMh8I/hB?=
 =?us-ascii?Q?GPDXBjqlrIWly5PGo3ujRwPXaE0yI2v2acAlg6D2QggjARxdntvUbfy4hHUw?=
 =?us-ascii?Q?H1UCAKxf4zUO5gdRE/32FVvD/e9bm4KbQKiv4TeGljhcUhat6TpBCW0/3/5f?=
 =?us-ascii?Q?DrddTXba7I7q5TKk4peBRzuK4MlGc8LL96bh1Pip6w+LQR7zNAWBFKLgBN+h?=
 =?us-ascii?Q?1Be+KP0RqGiT1o5dTa7YCY6OHq3Vwffb7D29wCe4Z4y19w4QwtLVm2sQFr+J?=
 =?us-ascii?Q?FvEKsLqBbKBFhKuLU/ZIy6jc6WlftqDwm/IIFPgeoR/MyUzz7kqj1ST79sSi?=
 =?us-ascii?Q?6Tq5hS/NJ0cXXBHGGFImR3PfXmoLHNjkDuhZccY0FuMDWWqULMP0irj3siY4?=
 =?us-ascii?Q?TWhY4bBPw/k7dywXGaoM9gOewObeS9wMSZpOHOcKRBy+bPD+9lHapChfugTe?=
 =?us-ascii?Q?1kNwhYso4a7G6EjZd/jJ71w+lRZejwJSdLA+rT1drqEDkDDqjdvJDg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g6wlo8miVM08shsZz/hT8/dAsfecx5lBHF6C0Ow09bAGiFVcZ9+DewOBhv29?=
 =?us-ascii?Q?1rY3We+At1/y6XbsBvgpUjuQSmXvfRH3IE0M/vNacUsZ48C/+l4Vr4jaiDaY?=
 =?us-ascii?Q?q7Jk+VdGtM/zhi0/wZ48eCd/cZkhj4mC20eKWTZkETuErN8xTpm0KYWT9VCi?=
 =?us-ascii?Q?kl2g5hikDV8MTgv3uFz5iMPE1uzn3eHoRyaEZ117cZcqVN1O2mdhKZmNf43q?=
 =?us-ascii?Q?/SijipjrCqPINeZU+2ozEaibg3BwdmSDklbMtA9anDu26gyM+y4x5vmlAepy?=
 =?us-ascii?Q?nm/dHKil5G3yTRFp3bi2mF2ValR+nRjzInu7QYIs8s7yLpgx77OYySb/8DL3?=
 =?us-ascii?Q?yfGGq4C3ZrUahChV8rR34aD9qPB88iM9jP5Ip8g1jafcAc96AZOhBATsN4Rd?=
 =?us-ascii?Q?dvqobPEg1RmHie9rOdT8lqE3Q7gvFKEWPEFNpGs/NyvuIaJ0ZzXF1q/NKPov?=
 =?us-ascii?Q?t5IA6E0t41sJCJCQq2vgtFyV3mN6rPEPqEW4RouoAFRhXkrbf+PKBinfHHfn?=
 =?us-ascii?Q?iYintXDwGJqhqlPhAu3aq9lSRprp/14Ry7vsdTxDIZ0TUcrhHOKcjE42Vo/A?=
 =?us-ascii?Q?waxuvxx8AZ2cu+wO5qug0OZnP9XCReWoZ2/SzZ4ny7ID1e4r5vzrQsmcaxjU?=
 =?us-ascii?Q?6bX2ZH1VOBUAw59zRIjuzeppSiGAjAPMoG4f7ysfHC0KrdEtSrtOEFq7AH6t?=
 =?us-ascii?Q?c6cOkc9pOpu1iMMUIIB0DMmhhld1gZsMM9Pwe2cvRxzgSVfpHDPLf5NbMm0D?=
 =?us-ascii?Q?hQDr/J0Y07jaU3IaqzlGf3AryUUqfocBzCIuI8bdG1quo/Bi/LupJp5CABdW?=
 =?us-ascii?Q?QsHwzJdYSqcf0CvcB/3x+gGBqXnUX0d/0zAkoBMiUWnBDe9ehCgdOEWkrORe?=
 =?us-ascii?Q?XEwykP5EL7w0zOx7M0dXADzFqft9PwVCEMVGHa52AnvT9DHZpaLKWKptYzKM?=
 =?us-ascii?Q?yLyT4xzAPmC1nyYPfNEmpa8rZBLHaaVR9xcF13rX2MNxJ328GW0sViZpBKXr?=
 =?us-ascii?Q?tKlPdY/BPPissYdog7oEgMDOnDQB2lL/x1kbsGgxpf8wUd8kMJQiNjQmy6i7?=
 =?us-ascii?Q?foSAr1luA++zaOQZdPXV/GoAr+cQ5GsunbCvaiP6jIAuj9+xM/PIwXntjA1e?=
 =?us-ascii?Q?doBVRYkORtaqAE2IN5k+w8F9DRpFSOu4N/pGI+sRjEy4cH0PKoU6Skr2iMaT?=
 =?us-ascii?Q?YquhIkW4fdXH+EFEc/q9uja1j6ZGD0q+96GPo1Wi/8YGlikH1/5eSbJV3h1S?=
 =?us-ascii?Q?NpBRWDzpEohkAvHDv9D47WN6IVKBeNTrcB9YfZyHxEzwWPkJ/t/fqd3q+uBt?=
 =?us-ascii?Q?CC0rR14gTk0iv8Ds7vz0zHr4ORrZgmBpyv4s0KNHZvjGruaiOshI9AMQmJwS?=
 =?us-ascii?Q?/rIGTZjHP0n5/tYflgPrLmNBeFiaZswjaXH5OIS7d5SVoCkvJ/1qEHY4st+m?=
 =?us-ascii?Q?H40Qcd5uew+iahOcKeGWwrL8bpIXeRnnjvzmVpa7RygKQxaE/n46DOQ42Y6d?=
 =?us-ascii?Q?d3EcLT26P9f+knVxiliosolhu5Qxhjhh6YIgXetcDK+JdUDb7q++KM2zkJt0?=
 =?us-ascii?Q?8C7cF9T3UOvpLUtoVd0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d99b36-37a7-42f4-cdf1-08ddb7e8b7d6
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 15:13:50.4062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YrqdOkDlm8U5KEwIUZ1SnyZsikIRgpqv/WEoT+YCTsBXSVrSHclAI2LlwLzdSC5Dvag+uyh6hAM8hH5+SDNlcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_081354_211451_18EA5D57 
X-CRM114-Status: GOOD (  17.83  )
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

On Sat, Jun 28, 2025 at 09:20:30PM +0200, Wolfram Sang wrote:
> Replace non-standard ENOTSUPP with the SUSV4-defined error code
> EOPNOTSUPP to fix below checkpatch warning:
>   "ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP"
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/i3c/master/i3c-master-cdns.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index fd3752cea654..e24d93a82e1c 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -742,7 +742,7 @@ static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
>
>  	for (i = 0; i < nxfers; i++) {
>  		if (xfers[i].len > CMD0_FIFO_PL_LEN_MAX)
> -			return -ENOTSUPP;
> +			return -EOPNOTSUPP;
>  	}
>
>  	if (!nxfers)
> @@ -750,7 +750,7 @@ static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
>
>  	if (nxfers > master->caps.cmdfifodepth ||
>  	    nxfers > master->caps.cmdrfifodepth)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	/*
>  	 * First make sure that all transactions (block of transfers separated
> @@ -765,7 +765,7 @@ static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
>
>  	if (rxslots > master->caps.rxfifodepth ||
>  	    txslots > master->caps.txfifodepth)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	cdns_xfer = cdns_i3c_master_alloc_xfer(master, nxfers);
>  	if (!cdns_xfer)
> @@ -822,11 +822,11 @@ static int cdns_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
>  	int i, ret = 0;
>
>  	if (nxfers > master->caps.cmdfifodepth)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	for (i = 0; i < nxfers; i++) {
>  		if (xfers[i].len > CMD0_FIFO_PL_LEN_MAX)
> -			return -ENOTSUPP;
> +			return -EOPNOTSUPP;
>
>  		if (xfers[i].flags & I2C_M_RD)
>  			nrxwords += DIV_ROUND_UP(xfers[i].len, 4);
> @@ -836,7 +836,7 @@ static int cdns_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
>
>  	if (ntxwords > master->caps.txfifodepth ||
>  	    nrxwords > master->caps.rxfifodepth)
> -		return -ENOTSUPP;
> +		return -EOPNOTSUPP;
>
>  	xfer = cdns_i3c_master_alloc_xfer(master, nxfers);
>  	if (!xfer)
> --
> 2.47.2
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
