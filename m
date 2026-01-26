Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8185ED19502
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Jan 2026 17:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fLX/jHKuNHYCXjgUJCU4Aox/iZ+u6B9C6SvbIKlzZag=; b=iWBvYvby3Vs4rw
	sQqNmrk1nrW6qSlBwsITpJkL1DRi8xGqScNGI7tMDalQdCSWRmjsOzWoRsGpM8oYVFoalEPS2asuz
	189eHpx7yWdDokGpPuNMDkUpQa4xPxJ11ptTbfewM9k/6mGD6DxHds5Wh1+nR9g8cuNSQuLTkyPtH
	FBDbq1wnG0jpCbiVNYmfGEYxM3bj2qTRte2dOzK94ompLgWq3CJJph1738aPJxxuNhMAZolc71qQv
	p7quBOzWkYIT9m2U3pXxxFesnNf5omJR/4HLCFK7G/p5ZbCqInifUvumkf40hkxHuv6Abm87gaiir
	HbJS+PdRm5hmEDqdMWmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQq1-0000000D1VB-0ygJ;
	Mon, 26 Jan 2026 17:57:21 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQpy-0000000D1Uf-1EIq
	for linux-i3c@lists.infradead.org;
	Mon, 26 Jan 2026 17:57:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5bas9T8isW6rGqqXpL9U0nNVMIm8b9JmMkk0pNVaxL53NSYLxvg5MXHbBjOSrnDhJrcoUe1I1I6/WJrpcYYpxSTW2YaYIhHN9heYYuitrS3Bx0ut646D1pgTxqxEVcaGCpcs70XErwnuIyOLK22O1CpLXq8LJnJMVQO6eyanFkW9XRuCD8EaGZ+aHAj4jHOXseonzOBgix5vUKe4QM1wKbRU+Y6Fo94cWP/oDXRUmGyRjXXGiPSGD4FpU39QQvCxvxI08CS6UTOUJOsawoICiRa1g2p+MH+eQjVVdqRnRwPNH44y7JOKtbYbqcCLwv19HoMGGMwW/7gzZjx7ZKWMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoirWMJBLdxLnGrNBpZbqkJGJWcAETL7Y5VUr7T0gMI=;
 b=BTuSW5N3cpeNLdy73++qRzBOtG3eR18o9gRZstFzzZph9r8C/1jpphoo3nZuBE+vuUY2u46U0kOONA2+u+nYOftHpqVBS6xW8Ja2MVZZXTMbslGX1gLfXpsuiZNY/7pZUP+gqvhUbfKkiGWv6QnXT3G1003YIUI2ez1/GTBgPafQCBBZa0QS6cwexW+kJgk3sgMUiBxdb7sOlQrotpF0r8+y9mGEgTEXgwIA8cDv7++mE/795U3Tp2d8KqrRfZwP67oTmOlkxzMcbtl7wHLvKu9Z6w9L8fS04yzsvaaw6c2H1cWr1PiJf0Wcfm28Zxxu6LyQP/2CliueYVdYdqw/Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoirWMJBLdxLnGrNBpZbqkJGJWcAETL7Y5VUr7T0gMI=;
 b=NKtCu84IZC1MhGtENQq50iljl/kMMFMwNTu4mqilCZizrznR1gCdo4jdjG1Jk9XosLmG6l9CHDjfy2+P92tLZfXf3li5p/dAV5IMTJ7MErg9An+Igjs1nBsUGB2jdpNQz1/iLuS6WlYLROJB/SNdk/WrlSeVE+H9b8t9/zncZ9BgddPcYhFju/lyQ8bKFAWzTCMohumHE9YK4UZtxyYVqH9Cdw/zquHpoHBP3aRu8VeCnwEPahOQfWQBXjOSbzPsVoz7bKJM5hmkhaZSRpOqQ+idKHm4Ry4PtSR18UdiSz67/B2ksC/aNzHMlU3A4eEOXGQ49cd66RfdijQY/Yd1+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBAPR04MB7254.eurprd04.prod.outlook.com (2603:10a6:10:1a4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 17:57:14 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Mon, 26 Jan 2026
 17:57:14 +0000
Date: Mon, 26 Jan 2026 12:57:07 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i3c: dw-i3c-master: fix SIR reject bit mapping
 for dynamic addresses
Message-ID: <aXeq86pUL1RUlz5x@lizhi-Precision-Tower-5810>
References: <cover.1769404925.git.adrianhoyin.ng@altera.com>
 <ec490708aee15c2a195849c420c65185656df6f6.1769404925.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <ec490708aee15c2a195849c420c65185656df6f6.1769404925.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: PH7P221CA0024.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::31) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBAPR04MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: f4959a6b-09ad-4d3a-8527-08de5d04565f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|1800799024|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MQ8aQxKvs0V+99Dq9CBpPstMIgRYQ13fLYXV8f9ZyqoEFtl7rXqbbPGFoL1/?=
 =?us-ascii?Q?5+Q5eVdUIVvjp5PU+mWF3TO3xF4yjezu/ZcX3QXPCS6XXoluTlkoeBdyTWf6?=
 =?us-ascii?Q?f+y24r2FbDqvI0orY4ZN05InCETmKdDSpO76aG/Y+F/6t+ZeiiYhggAl6yHx?=
 =?us-ascii?Q?1Pd7frqM/FyXHXWFT7ngJTsLuVtzAQQG/f4TXZDocM1LKc3UH6MAPFPkxXnz?=
 =?us-ascii?Q?zz8VyorWNmrzyMT9jejGhNICGNI78StIRkDhBvH2+7qho73qoTPluZ7AJi27?=
 =?us-ascii?Q?MtVVRKNKnCEw+wZnhSZlIzy48poa9wiNs7GFnQXPpULepQkBKk0gJLVr/5MC?=
 =?us-ascii?Q?D66A8cKDPFLcsQXh2dqyaGCoLoACDzcoZKhV7v+9fHQkm6q60K8RaaMD9EIO?=
 =?us-ascii?Q?pfl22XRoSQ8pToLyc6+V+RdxTul2YJk7zVoBJA1MvFbZIef5rMgQpCCGRUru?=
 =?us-ascii?Q?VS1eZVY2z4NuqTAkoj7U3rzBbBHc7Q5lvxGqqleNr6P7OhzNcC1YZUz+cArd?=
 =?us-ascii?Q?66mAhV6KV/m5Lv3/J+pDxYqwr1eVBCwdvwWiGRSTv5pAo9h9zPwf+B210R1v?=
 =?us-ascii?Q?CA8ZTx4FgDoBJcNjy15PzURqTBNueO6JiXdxKUUfSDfNNrzwp1qwtL5Q2PuW?=
 =?us-ascii?Q?zls5XIzfa+XskBmbJ8vWu+Q66vNC0X2xe81kutZiMXD/xVRtDThKRex6m27E?=
 =?us-ascii?Q?XkpPZEvqokD62Qu4xd+ECTWuRCYQwQQtgMVUKWwmWzHLzO/qFvHW7OdCmzCZ?=
 =?us-ascii?Q?opkVlvj6QahmGqPiz4Xg+xcJzHeP85LuThoCKzGqsiu20bMtB25exShTRiuI?=
 =?us-ascii?Q?45s5C4yMHFCYGzJ6AqxIpaVgxVqFwawzSiwbrqM+Luu+Az4+QCKgg2Y20EBg?=
 =?us-ascii?Q?JsWTx7rqfEiKNHzciJqJhQFDdOLJU3Cectoc1ZmGI5vUt/7HV6jZ65pevtoP?=
 =?us-ascii?Q?TXOXg5mC7elQOCexsev5B4fvN9quCLp6KRbRsbiL2++G20nxw8IdD8AOnrTg?=
 =?us-ascii?Q?f1cD8OW50Cg29t2v+Tox5dFiEFXdkuRkR+AMWZ8eSxXID7QExmCKboP9HKSA?=
 =?us-ascii?Q?idi0k8RAmC6+xXdHZnc2S3b5xHY/48upVp9FaLpbs8vWRpLsBzVhyOM6lnFs?=
 =?us-ascii?Q?EeY6BLC+RnektyqqJtZ+aMlgakgOpr2IgNC3vcY2fWEJtpKg+UYSMqBbRn3o?=
 =?us-ascii?Q?Gd7xfnFTZKrkBp6HhuLSdUnSqCgylV/S+cpuEXlTIdeNGhDhQOOjiDDM0XpR?=
 =?us-ascii?Q?SEYN1Fs9yazfGgeT/gpGamDbvBkpcOWkP9dSpnnioes89KLyUG/lvz3BQJ8P?=
 =?us-ascii?Q?o1teZ5pm0CEvJTelIDejrMG5D+clAJQqEKFiUALnaxVawBGcL3Si6zz1eebq?=
 =?us-ascii?Q?49Hz7QNR6TZJL+KmyVW0aChBHiMNV290GQW8N0qch78tHnlZ/NggGTJ0Z8wG?=
 =?us-ascii?Q?IG+VQ81OHAMPoymP7uVW4SoPpNi2w7PzyBwRTY2K4LMHlXs/uNAjH46q1MLB?=
 =?us-ascii?Q?vO5YNVmm8LC4Sz4mtSzS79+aUeXbaVwwilFf2XK4NbN0tsW7MJ94/Be8QuBD?=
 =?us-ascii?Q?C64hmf9pCyFFYwsKsqv97VuRgyf8ys0YIBUEIVlqOabY2dS/NfKRjzsXS2UT?=
 =?us-ascii?Q?sjVEilze6jGDw8bF7UANpbY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RtF0t5Ps/V4RCZHtoUofU76ZZ+1pxTwjkweO+ozIda2xQ2OKLv8nizMRHIy+?=
 =?us-ascii?Q?hugRrzpqUB3K6vy7Ujv0BvuOssN+aYL4FqQUzi3nyYHO7m1ZEAb1Xf9M8enb?=
 =?us-ascii?Q?EmsGy+o0YiSH9kNuWmB2U2P2NVdkn2+soyQCBDXA4WMkidpw+ULQHGKnoI3b?=
 =?us-ascii?Q?ftV93eOu+Dc9PTPHSck8QTQouqPwFkAhJmRS5EcxfCQsLbPxZY8ZuS2nYTHY?=
 =?us-ascii?Q?alaE46R/hcJ6nUaLgGxTvQB7Bwya1k8cahR58T6u0tY9YQ+lijoeomuwKf5V?=
 =?us-ascii?Q?e7yjK2qz8vkGADIFm0YThmE5Some+AeCqoow2MrJiwlqdLNqm6F7kypnlr0i?=
 =?us-ascii?Q?bgGktXwbcJxtLE22cadezwQqyXJW7y5cWPjSnTUgUeOJoAHa6w20OWIQ/QCB?=
 =?us-ascii?Q?CLvn73C0lUeNkQO9ZvpDirkZVVfQr1/RnwDeuvnIpQdmM63KnnRKkdN4MRui?=
 =?us-ascii?Q?OOjqBgJixXbEG+xiwPG6fid2U5jZuDYyzwqHmrS9wWZKorih9i9q7PSCWqMm?=
 =?us-ascii?Q?q8MSGcSqcREw9hHPIO1hiMTTZpTO5RHmSs0jJGPyFGW9LQWUouUkU9EKeoiO?=
 =?us-ascii?Q?DxyR8GapU/Zmhp7TuPye/kkCaYy9HQrAYTNpvLFaYzNLN98Vxn44dF1NbJwo?=
 =?us-ascii?Q?pQAAMremLFV6l/wsmqBk2KWKm0TdMJ9OFsXY03FRL96+E5P9ALl5u03ClkJ9?=
 =?us-ascii?Q?DvPugjKoPh2e2EixRzWqCowdUrJXTSZ9TNhYRuKGHmPFWuuGlZ1xqpdXa84b?=
 =?us-ascii?Q?nf4/91as9V4X7lmmEn09Fs+B3Y+3Rjh25+ftVSPK1AMUukKiSQvTGb2wx9aG?=
 =?us-ascii?Q?Khv6SC+NOsJnH/8x67IM1HlOe2FMF3CnxiDs29d2A8BK9ZuoSUepdy6thTQM?=
 =?us-ascii?Q?J0ZkF5mcfWXM/hgYGTZj251dUWuk6jUEh9Eupu5Rveq1ECvfDOEm/JWd2ZRo?=
 =?us-ascii?Q?xeZmk28roNRC2hMXAY0shRV3KfoiNyZ8xfllHCnwBKdWKjhiLIG1ahEPPkwj?=
 =?us-ascii?Q?t3fVVHKKHCZoOrLQ4BvgZabFTrgMAvIuL3Wft93yyjK/rwSowsG4TC5pgyMh?=
 =?us-ascii?Q?7/0bzseoEuJvqo8l3Nm1lrhZg3j7Ef0D7fACe4he9nItIkbKYcKCmtwX4REJ?=
 =?us-ascii?Q?5hbQWfSknMXg93QB7jXzuonJoAbeVABsMvlbXACQP0S60Z6mWW1oYXdxaCIR?=
 =?us-ascii?Q?Uc+8t3QoQyljg6LGOsgLRENElb7HkWLMY9jSpMoHTcpU10NrF+j/FbuyBp9H?=
 =?us-ascii?Q?eFdQIfNn7w7Fg+JBqu2GWELUOyKRY069eCGj9JjLWeAh3pDL34Fprdj/akWU?=
 =?us-ascii?Q?uqEvoIK0TCGV5YjNlbrATA7MjClyhIyOFezk+A4kW/fnbW+gKYdz868Wggda?=
 =?us-ascii?Q?rT2LPyf2MHL8jlDqeqUjT9x1Bf19LjYxkkYZ4pxhmei9qeNJbYdmB1l7WPLI?=
 =?us-ascii?Q?XCIFlDYvw4X0lPW9zNtcAVv+gHFT8NLXNdDwXy8HvKvJXxBPZU9eABBKXq2J?=
 =?us-ascii?Q?Mb0mrje2S8CeUOHBi3UkNYtPzpCDcSA65RNSRAbZqxR9AWxHuhrybGh5O+v+?=
 =?us-ascii?Q?8ozpI0DWVIz/Sxto72NSNhkgMfX6QOKZVBFworV5zw7ZbMX7oU4N7gcb4efX?=
 =?us-ascii?Q?KO6mDqwWP8KywQj588+Zxo75fp9dq/XjdlmH9bEb96E7jj37sDd/dLNGAcM3?=
 =?us-ascii?Q?nmlJR8DCrUTBibH0PGKCmDNTMImzRgiiQESQKlezaz8nTdRh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4959a6b-09ad-4d3a-8527-08de5d04565f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 17:57:14.5121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVNSboajjrkkxpAciqPae2YZd5NPOwf3JDNnGjwF32HFlaMmHY9hgSs0r9XVzVVov56VI1QuyAg8aIkMLKkhvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7254
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_095718_338584_C3C8206D 
X-CRM114-Status: GOOD (  24.68  )
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

On Mon, Jan 26, 2026 at 01:42:23PM +0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
>
> The IBI_SIR_REQ_REJECT register is a 32-bit bitmap indexed by the
> dynamic address of each I3C slave. The DesignWare controller derives
> the bit index by folding the 7-bit dynamic address into a 5-bit value,
> using the sum of the lower 5 bits and the upper 2 bits, modulo 32.
>
> The current implementation incorrectly uses the device table index
> when updating the SIR reject mask, which can result in rejecting or
> accepting IBIs for the wrong device.
>
> Compute the SIR reject bit index directly from the dynamic address,
> as defined by the controller specification, and use it consistently
> when updating the reject mask.
>
> Signed-off-by: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index ef8a38620e0e..77e0edd1c660 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -205,6 +205,11 @@
>  #define EXTENDED_CAPABILITY		0xe8
>  #define SLAVE_CONFIG			0xec
>
> +#define DYN_ADDR_LO_BITS		5

Not used,

> +#define DYN_ADDR_LO_MASK GENMASK(4, 0)
> +#define DYN_ADDR_HI_MASK GENMASK(6, 5)
> +#define IBI_SIR_BIT_MOD 32       /* 32-bit vector */
> +
>  #define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
>  #define DEV_ADDR_TABLE_DEV_NACK_RETRY_MASK   GENMASK(30, 29)
>  #define DEV_ADDR_TABLE_DYNAMIC_MASK		GENMASK(23, 16)
> @@ -217,6 +222,7 @@
>  #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
>  #define DEV_ADDR_TABLE_STATIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_STATIC_MASK, x)
>  #define DEV_ADDR_TABLE_LOC(start, idx)	((start) + ((idx) << 2))
> +#define DEV_ADDR_TABLE_GET_DYNAMIC_ADDR(x) FIELD_GET(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
>
>  #define I3C_BUS_SDR1_SCL_RATE		8000000
>  #define I3C_BUS_SDR2_SCL_RATE		6000000
> @@ -264,6 +270,14 @@ struct dw_i3c_drvdata {
>  	u32 flags;
>  };
>
> +static inline u32 get_ibi_sir_bit_index(u8 addr)
> +{
> +	u32 lo = FIELD_GET(DYN_ADDR_LO_MASK, addr);
> +	u32 hi = FIELD_GET(DYN_ADDR_HI_MASK, addr);
> +
> +	return (lo + hi) % IBI_SIR_BIT_MOD;
> +}
> +
>  static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
>  					   const struct i3c_ccc_cmd *cmd)
>  {
> @@ -1236,11 +1250,19 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
>  {
>  	u32 dat_entry, reg;
>  	bool global;
> +	u8 dynamic_addr;
>
>  	dat_entry = DEV_ADDR_TABLE_LOC(master->datstartaddr, idx);
>
>  	guard(spinlock_irqsave)(&master->devs_lock);
>  	reg = readl(master->regs + dat_entry);
> +	dynamic_addr = DEV_ADDR_TABLE_GET_DYNAMIC_ADDR(reg);
> +
> +	if (!dynamic_addr)
> +		dev_warn(master->dev,
> +			 "<%s> unassigned slave device, dynamic addr:%x\n",
> +			 __func__, dynamic_addr);
> +
>  	if (enable) {
>  		reg &= ~DEV_ADDR_TABLE_SIR_REJECT;
>  		if (dev->info.bcr & I3C_BCR_IBI_PAYLOAD)
> @@ -1253,11 +1275,11 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
>

if use
	idx = get_ibi_sir_bit_index(dynamic_addr);

code will be simpler

Frank
>  	if (enable) {
>  		global = (master->sir_rej_mask == IBI_REQ_REJECT_ALL);
> -		master->sir_rej_mask &= ~BIT(idx);
> +		master->sir_rej_mask &= ~BIT(get_ibi_sir_bit_index(dynamic_addr));
>  	} else {
>  		bool hj_rejected = !!(readl(master->regs + DEVICE_CTRL) & DEV_CTRL_HOT_JOIN_NACK);
>
> -		master->sir_rej_mask |= BIT(idx);
> +		master->sir_rej_mask |= BIT(get_ibi_sir_bit_index(dynamic_addr));
>  		global = (master->sir_rej_mask == IBI_REQ_REJECT_ALL) && hj_rejected;
>  	}
>  	writel(master->sir_rej_mask, master->regs + IBI_SIR_REQ_REJECT);
> --
> 2.49.GIT
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
