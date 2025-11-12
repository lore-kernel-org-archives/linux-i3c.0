Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54DECD13DF
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w73Zq1ZPGaHOW7e/2Bsc5L+zlxw0Jno4/1/GXpjpJcc=; b=XMxXA6uKDWoYCC
	z44RxOBCCz1uWY4J7tUVya0HbvCwmXg5meaZKWHJS8zhXvtmGO1jQ5WbvAlRl7ic2YxVUECaNlYfg
	0bzEK+8lTv7q+Mtz4tMePmvXt9UQ0LFduCi76PnVhQccz3Bb0ZhuXblPNJv0EHeUiFQkrlHbf62Re
	FxUTnQLdxHloq3dgLbCQAcQWgw5m+tBKb8zQqgYyaAwENKl8qCrOBfzlJGAiXTRtQoLcNVk3/T7BQ
	VU5Jf1pusUPkjVvJu3TY/2yvJqNUy6swtnOtpym917irJ74RMpCwex4J1JCGslc4Lm7WaTTgABJFM
	/Y4LKvoRR/1cip/wMVZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDPz-000000099rr-2G1D;
	Wed, 12 Nov 2025 16:09:59 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDPw-000000099rQ-42WN
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 16:09:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DozKz0RmSNgCvCgRcDNvuXcqg8jM4+T90sQ7yRGGCUeozrKdYhe6N25SI3sulT7CnadSAf1ptasVZ/7muFnae8H0ewXdvbeGLo4Qyfy3VxTUeLC6bS3Rtx2vos2P4qgw89JDUbay23tSdsQ5TuwpGmvtEKG5ujnmke9hk4FiuE/8OgzWrqkWT+f4WXYZhSwHcrXdVqwQ/lxXvDtM/sAgQm+FQ+zW+LKdm2rbymF7fLxJDuupe/icNxhpL8FtyfMtWClqbHkuS2jLul0ZZnAQdQHFHW0yF0dAgIVPy1bzlEylWlKVrNHyAQkGWlR7XNh8Jei0JvxHR0S/s2NHeTCwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlHpAfvFW8FQJD8Hq4+m7/SCadlecf7x5w5Qxq4xXs0=;
 b=GptB6/kY//CaU0DQPpDViwGOCaRVNZZMV08TgQIz4gAkDcixEMZtJicomE/wC5BAxgHQ5CbrLoiADraogvGvdJhKWkstrgpxKSfiB3rD/UHQCJJJgLPBVoAwKw/QTso4Jf4ZYKz+resDK8YFiyb+pFWhb/LOmegNySWnLMXqzNiwOql0CRMP4FJNa2LDJmgDdXCxcBpIKs7opprroDE0bELYnovo1BhDoiMiZXOlDWC0GN00jHSpB0MBEV+flrHBMHYDGqTruL51MxGpfBapc/uvpuV5d4Lj4JxTeLyP7hzR2uwz4EagHvggiLysV5j6nkAIQ/lZ4500/yETBeyDFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlHpAfvFW8FQJD8Hq4+m7/SCadlecf7x5w5Qxq4xXs0=;
 b=MIRTdmp9C1lwt0H2SUz+YSYFf0UtQEeSIiZoW/3P64p1JNrf4Y264OiYfiW/8MDE+QqYRwHimu+N+lp/fRSvk/daq48Duz4/Gr7Y25saFUmb4cny3D5jly4pbhALIKGuSv+JaBPL5zIzi646DcN+ELInTgvrt+tmDeHWBGrc2xWCpYJ8oRzNMcAFnUKTnroPGSbqxru2JoFC332V/r/Bmhhyd6JwoV9Y8Gl07C1oxLoYBa5xuf4bRRL0XqUosbIsdhAEO+bQ7yCCy3o6dIpqo54AacIGDezJPC+6XmPaiVLUjfohd6LLTuiXM/quNxQaObXV3UhBkQbmmTrCVK0BBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PA1PR04MB10502.eurprd04.prod.outlook.com (2603:10a6:102:44f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 16:09:51 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 16:09:51 +0000
Date: Wed, 12 Nov 2025 11:09:44 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 06/13] i3c: mipi-i3c-hci-pci: Factor out private
 registers ioremapping
Message-ID: <aRSxSHoFPKSpmc34@lizhi-Precision-Tower-5810>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
 <20251112100339.51726-7-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251112100339.51726-7-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::22) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PA1PR04MB10502:EE_
X-MS-Office365-Filtering-Correlation-Id: 42329591-e048-48d1-a1e0-08de2205e8b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3gBiUqQUV1lJdvC2jyZsp2noAV6x80KqFXQlcAswzmE1PiW6Hmdwz5xaL416?=
 =?us-ascii?Q?A1r4T0zKvsAzvHprYHXxDgmKJFBa8eWvXY3GIUtVZmC69/fqC1fAxgFBaS49?=
 =?us-ascii?Q?X9+jQaC0gBtM2ItkDwopo9bC95CudCA3F/zJSKNkxx75uAaiFyFs8fhfHk2O?=
 =?us-ascii?Q?4eI9BWKxDzNlET6Plae5XwfBmnfnEvuZIffpt9X0nU9TOVTJOrx9DMayynXS?=
 =?us-ascii?Q?p7nYZMTGz7ZytQeqYbr++KurshhbcnTqBhyl5ycMhNLjEgr+JFN42WL/4l+A?=
 =?us-ascii?Q?RIXe68dqiuW8br04kH8yFkzt5vakWbSO1YQtJKjoMt0ZMPV+JRZqUvqfLJl6?=
 =?us-ascii?Q?rID9d0UIIOqnAjQ+Qv4tBCd0qAM5J5IVcWzNNZDVDIm+zZW7VZEJRlSwrI3D?=
 =?us-ascii?Q?PvmUH9wpQu7KvNh3vgvjctVkjXZOTrpQoe1mDCdhShU4U2vmihaRs3thF7WT?=
 =?us-ascii?Q?KAevwH8k5a0CFzg5sqniDgm8zoSbxGwHexRX3Kt0WAwj0FLizQMJmL/guNqS?=
 =?us-ascii?Q?73FTGhVU/Bu2vHSXJiZAkJeaWIb85RJyrhsDfl9kNF8aFR0nyuWW/fSdVVxO?=
 =?us-ascii?Q?RDZFKBy/VElHfQIQPhLB8+XZGvl3fWa63/2KVMGYC55yknEOAp43GfBRLd+u?=
 =?us-ascii?Q?yX6ERs6PRae1CaQQeaGDqGJB6pQn+RronZ3sSJauffkahiOKvBnFV0hHmlmY?=
 =?us-ascii?Q?u93/zuuIQ8tc6LTA3gGix4mK6PEFdpJCjXd+x92WNklUubkv+6GsL95Q+Ryh?=
 =?us-ascii?Q?QuH1yWjHiZ4Vy61IE/Q2CJGyjJjh918x1CvC8zCHswQFRtt1JpniswncecCV?=
 =?us-ascii?Q?jSXfPfIPTTQ3goqL/2NmmodnSM5Pk7MziKg4AYdpMAEA3TXC/SaVpJz/2o6C?=
 =?us-ascii?Q?xkfqKPOh0oETvjrqRpsdN76r4jPJRJw0JlNO6BpniAvr2kll8q5L3NLGTqEb?=
 =?us-ascii?Q?s704/tlp7SktSrYI6FST/Yho1LdJfetYkQ7jjSzDUl9GYQ+mnN8uSbGaDh1S?=
 =?us-ascii?Q?wafrStH6l1aLvSZEuBjJVDAS5ig873joq5fIVuaV5vhIp/gKUhN13Kc7sZrG?=
 =?us-ascii?Q?x01gqcJCxLPBHw/4bILd2PbpU/RQPRIARDC5Rzgm1VE0eLyWBPr+TchkVgzG?=
 =?us-ascii?Q?6TzwoBPrdhJXVE42+XjLML1IuB9l8paIV/rcKH6qHXRQmYrfbfUiuOPLzTgL?=
 =?us-ascii?Q?xQyGq0PnTWQPyP82T3E8mrFMnDCeMvAEgYkwUbw7C8YW+E1CyoETqMTsGTp0?=
 =?us-ascii?Q?RloTVKDuEzIMuJPF/ufyV/7tIU7jzTyOkzllhNnW4keKK7udwaSSi7J321SM?=
 =?us-ascii?Q?UPdc3ZAdBfxwpRxOsm0H+GygjSz9OYlKItMiVUXoT8NB2Z3N7W1nDBEFw9x6?=
 =?us-ascii?Q?2bGt35mCHE/W1RSeh7BTCAcCRvq3LV1ODX9Hbl89gL3QRzJ20m5MJtIGYBTL?=
 =?us-ascii?Q?my4msV+7QhhNQnA/pC338M3hjxpSpn/X2kck+Luo1oTr0nJxxrqy4X6mXbnm?=
 =?us-ascii?Q?D11jT5TKzSi78szF8m7g0FKkbgNid3X/Ru51?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+aJVH73SXXReBcAeJa7vZ2nMssdKKCiaWlvvrD4ThK8GU3FWu1QLSNKFmQZx?=
 =?us-ascii?Q?xFfOdQsnEbVG4WjYmKooLnhEip3FaC8qvrSPIswB3NLYW43+bPk9Fhb0egN6?=
 =?us-ascii?Q?YYIXIxIwoBPDaINRVcZzlpVU5VNz7JASuSnzA4KMjrRpCX830GGBZeu2o4U4?=
 =?us-ascii?Q?JkO1Ox200UtlSfoXzc6LXU7MCCoKk1F0/ScCCcwO+PwigTRAnjxQa0eg8Nf/?=
 =?us-ascii?Q?yYPdJfAO8/rkvU7G6M+weulHeE+Rph0shrWupfrUCfIqI2OsIaP5nt1xHE2W?=
 =?us-ascii?Q?nYupV/TMhpjHpzE9sHu7n32mwa5xGFQJXjCd6u+GXIvFrc/MTwfD20h0sLFj?=
 =?us-ascii?Q?CCY798Hga0KTMWoy3+J9nyfYTAPItEttLTgKl0OxKBa+i6utbDaAbICPycES?=
 =?us-ascii?Q?nA5ilCG3sg+mQ2Mukhmf8xB+3MmFCEDLIV7zDJ6pj24i6+vkjKKoDEN5CFB2?=
 =?us-ascii?Q?fQazfeeKiiBXK/fxBou3GSa5Umj/Lz5RkHotr9U620PcuV/ug4Fuqc9KCUMd?=
 =?us-ascii?Q?EhIwRKo+J+3NMyKUIJM0/LedVs31KH4I4T8eOu5DJW2XHQgwEpCgUHJbF1Mm?=
 =?us-ascii?Q?I9gVhCNtoHwfc6MH5Sp2LV8Asjf10Ar9U2HAi8BMDEBg6y/bNwTM7yXqZd82?=
 =?us-ascii?Q?xuLvLCk7Tu1NcbdaEfL9NowZ4RDyiS44f4LxGukjD9kqP3KETwuSmGeLYc4S?=
 =?us-ascii?Q?RuxlXAY3s8bH/1RMgmHGN9323w74CthKSOkq2uQ5iI7+UMfOhu0fjH1yVien?=
 =?us-ascii?Q?qzz1JqM/vgTEYp/xLxYz2NV8/WFgDvqCsEzzhrEB7hI8m6WJejXrM4WquQ4y?=
 =?us-ascii?Q?Y1AP2XMHelq8tro4cnHnRnz2wJAEVUkWtzMee1565zK0lDd2/m2xpiywxEst?=
 =?us-ascii?Q?LXLmUqPvgQZH9DPTcmLUg/9H82dGmutr4EFoizV9bY1UO+gvw9x+G8olzPiJ?=
 =?us-ascii?Q?Ot8/IbHqzDR6CETOhTYEJjmD1GlNVgS2tIW4S/9CJp/Ltbs3RCmFW7kXPcM2?=
 =?us-ascii?Q?hgCFwCAipvVn8qBF0DNtlVJ1rrqNkSYkVrV3pIiefylmvL93wyV27LHff9M3?=
 =?us-ascii?Q?P8TrbXjvI25y9OzlYxMwUVytUs5m9VkRNKdCXvNMJ+CKUkjTIO09V4fBwbyf?=
 =?us-ascii?Q?WmhZ58W4rQEFZ8NNjJBiJqGEQ5c0xlOXMgg0TLDpxnvLRvXq64eNoDsh+GHT?=
 =?us-ascii?Q?32mamel3qmBW6xgH3nO0549rGljHYjDRJeSFaCKUMHqQFrSQpHj4SwI6oVAP?=
 =?us-ascii?Q?f5JO14IRi31qBa1lmO8WT9a8Ur6OyGZID9Jd00++e+TbQcymZUvKrjB76HtN?=
 =?us-ascii?Q?qMxHWM8EEDeLe26JvbXpYjIKeCTKzBP7zNu89eSjJZb+RqFdsRVkgRmLYRU7?=
 =?us-ascii?Q?3K1kdyD/xdMEwroZQYE/Mb4v8sO+kj6eJKg1xOyncPIn8la70nhPVyTvfYaS?=
 =?us-ascii?Q?ylfX2VPqJLlRAr33Lmh/RjOiob3pbn/XVbZPQjppnAQl5VEOXkm+WSmjTeXV?=
 =?us-ascii?Q?wwaL9BBdnyt3kz7B3HIZp7kkNxevtRQzUImJ1ny4i+7g9NbV29GGWZaf6NlE?=
 =?us-ascii?Q?nKBPQ38TxJ32XAGryUk6dgYsboP93jimSVkOxqn7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42329591-e048-48d1-a1e0-08de2205e8b9
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 16:09:51.0774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xiOrSfS9BBMgepBe/Zfkhg6cipTauIY1nVXYdA1SmHZT0gt9cslBngsJBESXLphCNWu2zjbasxidkrZ2HOjDFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10502
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_080957_028122_E5CF8FEB 
X-CRM114-Status: GOOD (  16.69  )
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

On Wed, Nov 12, 2025 at 12:03:32PM +0200, Adrian Hunter wrote:
> For neatness, factor out private registers ioremapping.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---

feel like not beanfit.

Frank

>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 59c592446b5c..003ae61e9f6c 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -27,15 +27,19 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>  #define INTEL_RESETS_RESET_DONE		BIT(1)
>  #define INTEL_RESETS_TIMEOUT_US		10000
>
> +static void __iomem *intel_priv(struct pci_dev *pci)
> +{
> +	resource_size_t base = pci_resource_start(pci, 0);
> +
> +	return devm_ioremap(&pci->dev, base + INTEL_PRIV_OFFSET, INTEL_PRIV_SIZE);
> +}
> +
>  static int intel_init(struct pci_dev *pci)
>  {
> -	void __iomem *priv;
> +	void __iomem *priv = intel_priv(pci);
>  	u32 reg;
>  	int ret;
>
> -	priv = devm_ioremap(&pci->dev,
> -			    pci_resource_start(pci, 0) + INTEL_PRIV_OFFSET,
> -			    INTEL_PRIV_SIZE);
>  	if (!priv)
>  		return -ENOMEM;
>
> --
> 2.51.0
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
