Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418B7D2FED2
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Jan 2026 18:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=94L0Qo2H/NL8s5b6AQflmsl/NLla91Z/J7Kt4TIsTHA=; b=UOrmd4ruZUR369
	bMCt5eZchuAf71BVlEY8v+JAuqU3ybi6rI2uWZuxERQLXPb4I9Ssm+NzIOPvy3O2Tl4YqlA0pyGMl
	nHxgK0uXPI7NTdALGwVKHLGC0CoJLaVklJ2edwPE124i5YAppg8uztoRlPz8ZhpRNjH1jdBtXIqqe
	nuvYT/xIIP5ODMV8oxG8ZoPbR1HjOd9pK3JH4MuDipPQqOY1vtpNBj7FpiIn8EcmBU+rdFyaVAyg1
	e6v9q5Xhh2FCnoxhFNUWLSEWUX+iKuywhsNirZCEMtdasGuemiaQkrlluWSawMaQ4HASrxbWmXsAF
	UMQmZBD76L+XIe8ipqEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknnV-0000000Eobb-4B1o;
	Tue, 27 Jan 2026 18:28:17 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknnU-0000000Eoal-0Naf
	for linux-i3c@lists.infradead.org;
	Tue, 27 Jan 2026 18:28:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2qduMdi8JEZWBnvcPdwYWBOiY90O2wMOADzlK4owTqVDp1umr7qzMxCsksogLy1c5qaaabH8koeJfQXbe6E+9Py7iJZAPM90wkwilA447Zh8gA9e40TQ37gJRdbpubiQ4bJ/wZO1iX0Jp7lJXaAzWw0UKV7P+lQ5H5gM29BwQWL5pNyndvcLymc/Mx/F0IRGZm1BtJAt3Dz4dqQzTXUhymN0DeFb4kiqHy4iTc2nlUj1Xbmnnb5qCHFAFCkw2OQ/vooyYnJ0NgJvNea4Upq4tZ1ByiqxFAsaU0Uy8ZTMQw7BFCaXWf8wgpvw7P1LCTHyuazawTWIdmRrEdwXDUpOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYdnFtRCQZdMklgq0fAcRPQArRdEHC4naMVdLIQbEpY=;
 b=MLekTcBIA02IBfiPzH/Tva8qQuU6qUqa12D65obCW+PvorB5xi2YjGHrF+gtGRmEl3OLqVze02i5BlDSQzj93niUm5eaExkg5qUsS0QtTu2VTJ6nblxB4faytA+NAV82rAWWoN9b7mrG1YbGqSat8DcoSiKVVnzy05OxQF6pmfg7m4c/eERIshVHN+KE2JO2lVxHIaxWPoLvCgMcH4xZ2xD6ubelQzj9TN9x/LWq5sKkvJb4UWlPhFuzeDQuhzRWW3kSlE4sRdHcwf8ju24FgWDZSd7jTqM7iVMNsftBT86C+TD/kj+665CeBx5MtE8duhhwuuJjLJAIZm1qjA1tQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYdnFtRCQZdMklgq0fAcRPQArRdEHC4naMVdLIQbEpY=;
 b=AvLfhC5kIhNFfz6rc+18PpnGDGzJy8jWv1zWCLNZz8Yz9EbOrXSgoze+e4PlspL8o80rqNoo8VaFkzCfX6AW2GMX0ALkn2xTUsJwGQu/6NsUXdZwXAn9yt5igmvbW8R2l8+SCcCa21AOc3ajJ40sTbL1ZP0VbrCxDsh2adY/oZAkcDvIE+4t+WgGDIRW/l2Sqhfbve2WK4/0G7Tt6Za3GT1XqM/b5tvRRjNl6PokE1l/6UQVFw+JhaGBsYrPDywd6X78cndFZoEb7ckf2hu2qubbpzgp+MwG4MuWa5qzD+XYTfOmQXgFU0uvzepcXJcFCrSajCiAaOls7PzAbPVZ8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB6895.eurprd04.prod.outlook.com (2603:10a6:803:13b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 18:28:11 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Tue, 27 Jan 2026
 18:28:11 +0000
Date: Tue, 27 Jan 2026 13:28:04 -0500
From: Frank Li <Frank.li@nxp.com>
To: adrianhoyin.ng@altera.com
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] i3c: dw-i3c-master: fix SIR reject bit mapping
 for dynamic addresses
Message-ID: <aXkDtPS4OUq9l74k@lizhi-Precision-Tower-5810>
References: <cover.1769479330.git.adrianhoyin.ng@altera.com>
 <d4ad8161e604156c60327060ad3d339ebf18fe4f.1769479330.git.adrianhoyin.ng@altera.com>
Content-Disposition: inline
In-Reply-To: <d4ad8161e604156c60327060ad3d339ebf18fe4f.1769479330.git.adrianhoyin.ng@altera.com>
X-ClientProxiedBy: BY5PR20CA0008.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bebecd6-1ae1-4217-1b50-08de5dd1d38f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|19092799006|366016|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Dnren6nkRTs2rqM7cIcaPxGwc2sEuW07XEmHvDWiOJ/f7voqi3Z9t1nfSOoM?=
 =?us-ascii?Q?1dhbYDDDXJROhreeFWDr0ggrZ80BTMsG8TPsGTQP0sWzt4EM2jrdnnAnrI0O?=
 =?us-ascii?Q?Vrd2+phNI2tpbuNk7fhjUAK8jXS/Ty/dn9mUPGVZ19aP66ZiIezYyyadWOp7?=
 =?us-ascii?Q?WgSlzOy3tLnxjcZkgSYfF/Cgvm+fWbomJKDSAvSr5d6TmJ4/fvchrP6Sh8Nn?=
 =?us-ascii?Q?01pCA0ivRZMyxtXpB7iK+qPkmRjYOmfx/74ueyR3YJSGgLbefVF1/W8bz56f?=
 =?us-ascii?Q?n+GbGRLGhQ9Uj2/bTRRBVieG3feSom6mH4GBjvq379Pp2d1p6wpscG/gZ1cP?=
 =?us-ascii?Q?q7Q7pg9H1ZI3nrw/CnHKhM3lt8igLlzBNmMv7cYqMlk5o0D8bwj9xMqrcra/?=
 =?us-ascii?Q?ZXf9+sqXS7hkXpGYySCAHm667WeZn1zPUuEeA74Ecj/kjT+mJzpHdAA/cj88?=
 =?us-ascii?Q?9PleffF0WdiJ21nLvidoGj8Pls1IxkXcUjMd3rflhiHX9zTUOYdHrKOgSkAX?=
 =?us-ascii?Q?nm9Cn+PYmXbRojZSSbPMkT8DjYSZS0rk161DKfdLfuccV/tKgrE4+tXnEkt6?=
 =?us-ascii?Q?INGG14RW9aVOT1TCYZtzbrl+djB0zPg5URgGBnLxMTKMsaz8PTiJjX2oRG33?=
 =?us-ascii?Q?hisRC35nQedW3hNXZWPZ0JCJWeWy3rBUqcxcqw37oVRwKKZ8XDEPvWUYv+fM?=
 =?us-ascii?Q?SOdnHIrxPuStlr/muNYQJ49JTy5608Y2YxVg9DghQuBTe+7l2K4HKCvUIzDc?=
 =?us-ascii?Q?mIohfgcOkYDAyXa80GW4gQA2krZumOANnDZYtjk0ko5CWcb3KCIuCYp14ZLP?=
 =?us-ascii?Q?PQKw+JLV7CknjQB5j3Iatj7bCtLcMGF/ya4F4EuKsuE5HM8d7u5khi5XVjm2?=
 =?us-ascii?Q?67W1fK0wMCLUMt2iJir7mXn3UF1RLRzEhHGcnmu0y5irtbIv08HmS8dmHS80?=
 =?us-ascii?Q?vGF7C2muUBbD3vFGxvOiX8KcYevsBWJqjCOvNWT6xT7oFqsEfQKLaUqBovwR?=
 =?us-ascii?Q?mGIo5bvxGRnzX4KmKNU08LQF/SaNKDuD2JsZMcPWBLDoUHGRy5NTMFfebAkt?=
 =?us-ascii?Q?5ENFwY+L9ILN+Yk2rdHPz4pDXrOu3pUSKH7bB/HREJ7vrq8rySU0GhCWge1m?=
 =?us-ascii?Q?4420cVN18A1k/or2QbMVMjq+r6TiTvL9dktIv4iv0maEkH6luPNl9u3lPVt6?=
 =?us-ascii?Q?dqoP5uAcYbdPKonQXCFIF+7pY0rscRd/9W15q0xlbl0asZ5ISJhq1ymT7WVb?=
 =?us-ascii?Q?DrnoyoaO6j1huAg2UIi8BdcZFy8gQHkUv5AIVHFAE2nI8nZHnTm5v2ysZmqV?=
 =?us-ascii?Q?so59O04dZvu2oh3aZl3SpG3cGLVPcqLxFdMri5+zUqLkLHJ3gS98aaVy64Q1?=
 =?us-ascii?Q?IgRLKzu1VgJuYU829QaQfBJ4vYI0wRyXBQUA5jK185xFREwSLz8KmN1yVgf1?=
 =?us-ascii?Q?QyLkqXSpVE5fq/CNzihMiRnarYDxhmPx43Tf1O3PHd0I5+Xc2jDJhAKjP3iX?=
 =?us-ascii?Q?1VOeTrCPHtgkLDM31psE1PO6fPncqxASHVtykBkzxa06npXfzanrWOIPBx+B?=
 =?us-ascii?Q?/7pauWpDMEjZZKNF5o47/+/u9HZr8VPBIkikTWvwBtShENaF6V0sGHKXQPd2?=
 =?us-ascii?Q?wy9ILRwh7arcNCJfFAIm7co=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(19092799006)(366016)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XTcaDg/QzBZdvd8wn6sOL2yn1ZHV2KsT1Vq3Z1S+HDv+UUnnoz15ACF2xakh?=
 =?us-ascii?Q?rU6wy4zaOmoc2S/wEabh6ZV5S2hx0RwPGDHG3vVC7806IEj6+nSkOgdr7tCX?=
 =?us-ascii?Q?reydDaspr/KCWQAZlteLCMxGFH8dhAm9dwyTimb9YqqN+6plDKmA7A4b0+5e?=
 =?us-ascii?Q?3Ew7EJkiwYRLr+HmvAqdudJo/gUQjYog0qM4B7IaNzrVgM1/EShkL8yTO6sF?=
 =?us-ascii?Q?WhX4LK5+/KFMxR4TLZq1dsbVL7TMuk73z9Em2fABHaUqUPtQbLuapV+Bxcgq?=
 =?us-ascii?Q?L8SptngasTxSbJZHWG8dppdmy2m8RDMPNEsGmfax3jaOeA/3zscw72YWpjn2?=
 =?us-ascii?Q?eoj0k85gobjc/+XvbV/n4CZzqKpju0qVcYorN9ThHXj8uFqZwP1Ika6jEKwp?=
 =?us-ascii?Q?IXA7WWwMlbNGTtKh1Jl4Hef+u+TR+/WDDeQ3uM2FCDx7PTuP9RKnxZ34lOfz?=
 =?us-ascii?Q?YtmHdTIKX86dn3+pZ7H5OGYY1i/hTqtL0Jul82kDqzNB/R8PxznciL+aOuYa?=
 =?us-ascii?Q?YzunGLZN7graK01BV77xgYTnoc23wsK01BZBTuqfMAmZhFRs+mmvbY5z3JGs?=
 =?us-ascii?Q?9Ibi9dGVkBJ5qv0EspPLdOmZ3ah9qxK3TSoSEmtPdqli5PDUTX5fFOrzn9TE?=
 =?us-ascii?Q?k4dVNbE9WjXdqzNEwP8owKo4SqTTYxpguSQsvmYt8JzRnUhx60KC9bL7yY+9?=
 =?us-ascii?Q?P2rtnF3qHNdHExRe5h679KtKDE0AmbiZI9+N+iMV5fUbKJQIJDdaUEUeCXYH?=
 =?us-ascii?Q?DtW3dxoVA0lnhgsPLLp+CUdLX/OGbJTgmr6CGv7oTEYzIVAIM/r+LAXGze3q?=
 =?us-ascii?Q?zcYj76oGdSJ8FEQw71eNC8h6S5PL1lnPJ1WYBPRYKYXIjn8sEJ62NAvW6825?=
 =?us-ascii?Q?TBOKdE3UG9ds3LSXhsWBLj5rIlPFdxYOHn2PQ8xO4RtehfF3t7aQZcaMCVDV?=
 =?us-ascii?Q?WsHSrfKpqcY/CjUR5jozfljPW7OPHwYr7jzeS8sPzt4/mq8x7eKoY/e+AeDF?=
 =?us-ascii?Q?p67R8H6lUSNT8whJIbMO7itzcCNkg/LM1kFpQQHFc+Mm0iyP0YSImjpIf/D/?=
 =?us-ascii?Q?7UoBNnu3isoPvbgWwfwb6/vV7DlgcsZnQ7hdYfugTDAnTwIYrkARKytOocgC?=
 =?us-ascii?Q?3mbakezAaJgwvZE5MDYkxi3gWisexXRx+qSPse1j2Wrv7Eo3eDdhzL4xqIJe?=
 =?us-ascii?Q?pMsi5QEFUhxQk2z/T7pca8tj+8xpbnMJT0C/j5rv7NmLnK07/Q8PhbaIL5HY?=
 =?us-ascii?Q?E2dnLajQbdLcoVHje5uYVZcWH+Se+ERFlpcxdw7gt5Rdw+LI8WtBZn8qmviN?=
 =?us-ascii?Q?o4Icb/os80GY60Q5eGWkhPVA4SWID6wd5vK0j1l5pfecn262iPjVQmNDz8mI?=
 =?us-ascii?Q?bT3EITmwYsndraDUZ8FGQCWgRbeYe0AkaRcEs8HPzUk7oJ1J2YOeMlJdPacY?=
 =?us-ascii?Q?F4DabEUF+piACEV20xBQKtFZKUWIR1CCNUFo+XZ/7U+/mObOUpE8vsUaLhV9?=
 =?us-ascii?Q?5Br9MYB7qvBs462Z8ke9vEQkIOKljVJyNB6xQ/nOkhKUfRbf56nFF9ZI/0G9?=
 =?us-ascii?Q?tJb0fut6Mr/CWTnz8ziUPNZrjdO1lJ1QXHDwFGywl9axc2UaQ5AxSgmjYwxg?=
 =?us-ascii?Q?jv320L8zDi7qFFjVQLs4zChqSVuv1gurGYOfejO5ttxwb2hit5z7nuSkAFhv?=
 =?us-ascii?Q?aGOEoSRGpksd0cWE1SD1O5vmwVs/N/68Kw+zYAp82N/09qZk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bebecd6-1ae1-4217-1b50-08de5dd1d38f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 18:28:11.4045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2oDs7OP0U6Ofkn3X5PZT8zfp2oZMNaRugp7Z6LGQf0s7GlXNOS+wytk+ny5P5opQ3WocQpCytEX9BvT+JvUjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6895
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_102816_132875_D7256F3C 
X-CRM114-Status: GOOD (  23.90  )
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

On Tue, Jan 27, 2026 at 10:05:07AM +0800, adrianhoyin.ng@altera.com wrote:
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/dw-i3c-master.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index ef8a38620e0e..9ce3519cc686 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -205,6 +205,10 @@
>  #define EXTENDED_CAPABILITY		0xe8
>  #define SLAVE_CONFIG			0xec
>
> +#define DYN_ADDR_LO_MASK GENMASK(4, 0)
> +#define DYN_ADDR_HI_MASK GENMASK(6, 5)
> +#define IBI_SIR_BIT_MOD 32       /* 32-bit vector */
> +
>  #define DW_I3C_DEV_NACK_RETRY_CNT_MAX	0x3
>  #define DEV_ADDR_TABLE_DEV_NACK_RETRY_MASK   GENMASK(30, 29)
>  #define DEV_ADDR_TABLE_DYNAMIC_MASK		GENMASK(23, 16)
> @@ -217,6 +221,7 @@
>  #define DEV_ADDR_TABLE_DYNAMIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
>  #define DEV_ADDR_TABLE_STATIC_ADDR(x) FIELD_PREP(DEV_ADDR_TABLE_STATIC_MASK, x)
>  #define DEV_ADDR_TABLE_LOC(start, idx)	((start) + ((idx) << 2))
> +#define DEV_ADDR_TABLE_GET_DYNAMIC_ADDR(x) FIELD_GET(DEV_ADDR_TABLE_DYNAMIC_MASK, x)
>
>  #define I3C_BUS_SDR1_SCL_RATE		8000000
>  #define I3C_BUS_SDR2_SCL_RATE		6000000
> @@ -264,6 +269,14 @@ struct dw_i3c_drvdata {
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
> @@ -1236,11 +1249,19 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
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
> @@ -1253,11 +1274,11 @@ static void dw_i3c_master_set_sir_enabled(struct dw_i3c_master *master,
>
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
