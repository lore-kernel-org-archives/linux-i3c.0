Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895D1C531DC
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 16:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z6cRzo5sNX1o4P9kh2KyT8OwLg71VnUtK1YHvynTthY=; b=JuUQXKuu/eXKxA
	AKpe+xpXCHuZVLiPofN4kdK/v6ZNC+e+h6UMxhJJxCCjL7ORMnIKyqY8q7s4gPrX9cbotxSaWzxWk
	0aA0CD+Vdy2VQOqJbJE0ZU7tBcRaPUgASNMh7mIIGDD9LE5au8zR2RWarPY8uBVnbLTAWljHJMwtA
	UBNvJtcLBphYWfmfiWjtvcdTOfOY39OQ10UmzmEABKK8qSqejIbMCn9USv683to43sguLBsY60GZ2
	Zo2dBn1AC30QvrK59tO8ca/TQ08u+qUYdDwc6kQe7dXokTGntOV2R9wjBR/uc2P0DjA34+9/9TWqB
	9fTa80vdm7AqrTMTOS/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shXYm-000000002QX-3uZU;
	Fri, 23 Aug 2024 16:54:48 +0000
Received: from mail-am6eur05on2060b.outbound.protection.outlook.com ([2a01:111:f403:2612::60b] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shXXN-000000001zJ-1Wk4
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 16:53:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FmYiLy5VVP5xn1qbj/2Kkp+6YaaxcewUG2C7K79rRLIOlpfqvDK7V6Ho68BfkkNrpTl0QDjfcrZNKwzJlBg68N5N1A3Qi02/ytOM0qZl0m7QKGu7shxYq2wiVIs/RsaVvPaxnWWqXqFu2GypyjVwPn4ezi/J1LnB6lhmTdI9nr8uGRULk89hEJecLDS1SeWFr6euqldpNT/wNobK2Kb8AwzG1b1aqRbMm20H3rMKJb04yx1HtaV9v0csIkTsCEsFPNP+B/feiNmkGAkGPlyTdu3+uZArfnZOirqarTa/xHyB0SKRpGC6wIlSqYXLAtZUYEJbnytE2dwXc97bCSzi3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iv/KU7R+Odg8DZQ6VTZ30nAdDP2Y4+Mz5Rkz9nwvpG4=;
 b=iIqrAp9ongLWdhvOcP0Brh4GWqsBwD9veiJT2/dMTLBOiw6OwsDCja+XS0eKeULtJ6t3Cic2Wk8vlBehemolnFW0jCUXGbXdZgrdYeyNTjWrFude9bNrvsQrpZ0CjWwDq+E2jazmcvD1TfwALin8I62a3FcGBxd9rwAIs27zPluLsvsYSZbLUNzysGHy4wif6Bi6ieNunkJF1x6bx3wdYKsllPG1XaCuT2EpXsDQVXZ4kSl1AZMbrHHUO3ji5R8okM39481lo69U4Yh3euWnn+KPsuNHlCQQK//VGIQOqYtT9+Y4iVB5C421BcaWh83wM2+459siaGwAVcNLScX+0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iv/KU7R+Odg8DZQ6VTZ30nAdDP2Y4+Mz5Rkz9nwvpG4=;
 b=KYvmJyY/2xf7dBhLWJVIQhpyTP0bRXkeuvuqe+8UoM8F4hh7Ot+9FyUl01GcX7bWKK9jrgSSksPJXVQ+I5WeNW4aUkL1kbYx0WKpgSQGYQlk72OCpEIFAitvmJNX5xlcaATnNdUT3iVVjNC4olKx+QWuUiDAoalrywVkB0zv6SzQmarjpkFNlXD8/p8bqWYG9D9RpKH84JOyt14wjru0MhFgjiLzaOUlEUbS9ykQ1wA64kGBJzCU/BM8st5SIzM4gh7ra3Mz08jbPofuEDsUn5FYSHvI3GZPoCe3o/psJViemyHVWgE8Sh8K013wIzMQs6/wKpwle6wXcFbNq5uOMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8884.eurprd04.prod.outlook.com (2603:10a6:20b:42f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Fri, 23 Aug
 2024 16:53:15 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.019; Fri, 23 Aug 2024
 16:53:15 +0000
Date: Fri, 23 Aug 2024 12:53:06 -0400
From: Frank Li <Frank.li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Parshuram Thombare <pthombar@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Conor Culhane <conor.culhane@silvaco.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v3 09/11] i3c: master: svc: use spinlock_saveirq at
 svc_i3c_master_ibi_work()
Message-ID: <Zsi+ckEN/5Lt4fOS@lizhi-Precision-Tower-5810>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
 <20240819-i3c_fix-v3-9-7d69f7b0a05e@nxp.com>
 <20240823181927.7a003c36@xps-13>
Content-Disposition: inline
In-Reply-To: <20240823181927.7a003c36@xps-13>
X-ClientProxiedBy: SJ0PR13CA0183.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: c78456d2-bec1-4213-be4f-08dcc3941501
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?JprYkRfx9LtbMlHWgP2qtS+/54S+CwYwwYEA1A0K2DWpHm+F3q0LwFn1u/?=
 =?iso-8859-1?Q?76kc5u50SIHP61hLteyBQQwEPiRspTsvSKMS0MGY8Li9DnyRRZGuHlCWDB?=
 =?iso-8859-1?Q?ogIAnqBG/qC9x7YYBzlNPiuA1Qqf/p6eUEJc0sK9vaz2BmDN8EeEinpa8p?=
 =?iso-8859-1?Q?hOvIn73RHMLETqHPqeOQkkgD9wxYFQ0Hi/B2SoWZOO9dKYbHGwTgJrsEQB?=
 =?iso-8859-1?Q?g1wQfjvJUHLLtYbsOrcWXUzjI5KaiNAV1jrUoKvBAf7bRT1nt5F46pnVT6?=
 =?iso-8859-1?Q?cRlFmgrjbT3m81NlSfovgT7LjWWnzY02+KJVNJ7QP808HPTwTCOd1VtjWR?=
 =?iso-8859-1?Q?y+Al6ytxKcV4mv7d/IplJWs3QxsMiUS87DOQd/l1HKkoYq6Ip3l8IXcGPI?=
 =?iso-8859-1?Q?yPqXi4J9ksbWq4TTDcU3HoBnPVcpSrLi+ywJKd6xAl1cv4nyi4HpxS7zki?=
 =?iso-8859-1?Q?zpHfhp04CVGGeq8N2xyPGrD9T5C+mvpuVoLmNHAqm3ElDj/A4nzcz4JfpZ?=
 =?iso-8859-1?Q?sUktFs1Oq/7O2aCK8hhnXZNSN8KyoBJq+HH+jFmw3ZIaVpGx0awMBlYo8h?=
 =?iso-8859-1?Q?0byTMathwNoWYB2b/It1NNYsp/3oGE6pBRNIe03lETWzohFEnajWuq3pic?=
 =?iso-8859-1?Q?2pNJkAhmO5gwKqsh7jEuSuJFE9sGobif9V6Agrk5P/KR56Kng51Gy6sdo1?=
 =?iso-8859-1?Q?VEW6r+Bep3IVyGle6Kj7sUb77nJZp8XPggbd3B6gWdrUoF/0S0nJrYMWPT?=
 =?iso-8859-1?Q?QHhOl5y9lAd0A6kB+PTvnMXXV6u0xOUsSfDkyHrsghLiYQq72eOjEq7xIr?=
 =?iso-8859-1?Q?NebNazCdUWGECTkuwVqy6iykRrClIrHpaWDiAXsKwsN51k/zW6QvWTcOve?=
 =?iso-8859-1?Q?whcQevVfx5KHzhvsi90kEifGFCZ6SK+ODHAbZr7Cih+9/8aaXcnsdsmqoP?=
 =?iso-8859-1?Q?+08FSvKkGBuYw3rtBA/O7LZBoNWcb3t+Ffwl1gfeLQkzhA3GkU+qoikxEp?=
 =?iso-8859-1?Q?saJtzVObO+mqSTB0nMolHqnWTiCEaOszV+FuKpVHEZblCc4bkHt11oSXxK?=
 =?iso-8859-1?Q?nMEAvFcaHicwoTOTFdoO49QZlEMh+2GCjRv4b97QjmQVuSEcwyF6vuNOsF?=
 =?iso-8859-1?Q?IlkCLWAbIvjyTHdxQ+6vD7BON9ZwWJhLEPYFFJPirSeOH74LSpNPMgomR3?=
 =?iso-8859-1?Q?yjUpJ55EDCVUhkw5fAjrzRRrKe+DpdGUcguHWyplqoloXiZUCzXGe0Wb38?=
 =?iso-8859-1?Q?oknQw2reZwxonDsTazBl6rqgey3HetLLKGLLZSSDH/IkHJKlJKLB4AbbqF?=
 =?iso-8859-1?Q?w/u/kyZ/pcZECTZucUb8/7O51F3fVQO9Jd0qwY9+eFvpXNWjZ9HZC0tv7r?=
 =?iso-8859-1?Q?+UUmFGMNnWbN0K0vN8nSi7KJ+W86N3UK0ONhDHTG2/K+CI67N7gomHptJ7?=
 =?iso-8859-1?Q?igYubRmftPUgYYARzLKImfX48K2fSRQUpVwJsw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Muw8BjFpSe0ohVYNS+Ke1Q0waBsK3K+NvlY7L7gx3Ir1imMOci/2gc/aun?=
 =?iso-8859-1?Q?VGviPNuSDPWl+VBMqhBkLB1JL+ZpLFfj0k11yERcS4MRJQCRaH90mhCaCO?=
 =?iso-8859-1?Q?Rbs3vN9ZNRaE9ZtVmsvyqRu7ZZm09j5GHX9ice1Jo7EQ/A8VibOGtn4S2G?=
 =?iso-8859-1?Q?xnzTbNVXI5mNM6kQ+eHjVtTFB1mtbO73qhU8Tgi0pJ96uAb9tBdyRexyoo?=
 =?iso-8859-1?Q?Q1YwMWGPFXogUFQzJhULZdwZBD8o93fjfabKB43j7B9UppFzQ6AJMBYjlY?=
 =?iso-8859-1?Q?V2OuApeeCeSFs7H0hwtpvNeCSD/9yhIBVyeXij0eWRa7okmfdljl1Yskhp?=
 =?iso-8859-1?Q?sjjiowBy+WUE+eSV5DOZrF4ixO52EgBJk1Kf5HgxBpNJy+U7g8q6M7UZGe?=
 =?iso-8859-1?Q?jtFZ/J15Gx/AsFcwJdE0xw7tNBh0YJS2rLKG7NvFkH103iru/c9NAgy2+8?=
 =?iso-8859-1?Q?e20bnJ14fCHDnhaLjisySXzfTdDZP3R6hMixADTCuS6+oZDcjkKC4ehziP?=
 =?iso-8859-1?Q?0oqk6fZOAb1+I136UXFUJjgtMdp+BTY7yMv1O8bH8xPfBjdnsR8EVeRnr9?=
 =?iso-8859-1?Q?7DYpWDcqwarV9ksVGPRsTzM+DPq8lSUf2+a9zMKYrzT+MKLeW2ZkCBJIPI?=
 =?iso-8859-1?Q?nYk9WNmnB9yaCufzAU/6ALDNOcvru4aUEqla7/y/+/aFecTC+hr8IftBP+?=
 =?iso-8859-1?Q?UZPahNrn4jO50lHYP4yx0dqcvNPnmdnrJMALsEKTvKO/qetRyVRI1icgAN?=
 =?iso-8859-1?Q?+JsFccG9sTYMSnRdFPCKbCEj8OKSmdh37mZoD6Hcu4ht2zOUd+pefPDt87?=
 =?iso-8859-1?Q?dA2cOHh9ebPeKaXEAOt/0d87tkoGNkjxvTCFUniNsVMGrKSDdzY/ORH8Nb?=
 =?iso-8859-1?Q?hl+zBfDNDFrM2agxAi1/+quplZ+wl9XtDCf8TixsOmCxfX0ZbsxbXp0FHv?=
 =?iso-8859-1?Q?YhAMFY7oJzjaezl1/TjQvSh2QGYdBwB24oHv86mWKEqAHh8pI5G7uo51Mv?=
 =?iso-8859-1?Q?uFD7ptCK7+3e8dNwVgNvoFddCcv38lNZYH2z/2v7LGlIvUe66WpoIn5kte?=
 =?iso-8859-1?Q?KDJEl38bxqkACTPwUetQzc9uwa+n5JSVwkTwCNZbjOwG5+MVftGH3xTTE3?=
 =?iso-8859-1?Q?Pq7BeV3WSjttol44R37oogqf4CuBtKvgNEc73Tu2OrVYvhmQczcnBRdXeF?=
 =?iso-8859-1?Q?UIZmppKMGNhBlDX98Onrw5P5e3Lrruha5AAfnbfWf/bnVY/WxT9THfALhr?=
 =?iso-8859-1?Q?JfZsdeJxIRKFZor26Iy8rR2f7B9Ar0pSK57XxkkmcMMRXtpb/jZd+yWX2/?=
 =?iso-8859-1?Q?YbZ1PET5zCgy5X8Aefa0VZJQTDFFE2a7XPIf5UhZPO0jOjAFYzmIqj+0if?=
 =?iso-8859-1?Q?E1Nxb3JaG8GZ4jFNkcAZahDDLjO85vCtm7wevDBZr0PpGsWZo9B56Li4+r?=
 =?iso-8859-1?Q?99cjiWJ4vvWptsTyfaOl21Amv7Dhzh02MoXFGfCDPZmI2Hlo9QHJI1EyU0?=
 =?iso-8859-1?Q?qi7nz268hCoFHImIwe9xJpa/lbiX0nHeE1GI7uEYtYI3E3C2Tn2fwofOqB?=
 =?iso-8859-1?Q?p/OuNBmdTScMcrAglVkCXiO3mMQ5OLBr5h663T0W5luEJd786DvesHQq4I?=
 =?iso-8859-1?Q?y6VfCwI/5GHG9mw1ExYzDeJ9Os425t44QF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c78456d2-bec1-4213-be4f-08dcc3941501
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 16:53:15.6135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: btXpVWV4iyuAu8tyIE9qRaozeJMVy1gl9d8h+0arANJryb/9jjCJpmGb7iEA0jTu/pKk+bejBVk8lq7ygRFPoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8884
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_095321_432709_7490C619 
X-CRM114-Status: GOOD (  28.27  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Fri, Aug 23, 2024 at 06:19:27PM +0200, Miquel Raynal wrote:
> Hi Frank,
>
> Frank.Li@nxp.com wrote on Mon, 19 Aug 2024 12:02:03 -0400:
>
> > According to I3C spec ver 1.1, 09-Jun-2021, section 5.1.2.5:
> >
> > The I3C Controller shall hold SCL Low while the Bus is in I3C/I2C Trans=
fer,
>
> 				    low				    transfer
>
> > ACK/NACK Phase. But maximum stall time is 100us. We have to disable irq=
 and
>
> and/or (I'm not sure)				the IRQs
>
> > schedule during whole I3C transaction, otherwise, I3C bus timeout will
>
> prevnet scheduling during the whole 		the      may
> timeout.
>
> > happen if any irq or schedule happen during transaction.
> >
> > Replace mutex with spinlock_saveirq() to make sure finish whole i3c
>
> 			wrong name	to avoid stalling SCL...
>
> > transaction without stall SCL more than 100us.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> Yes, 100us is low, and that's why I initially did my best to enforce
> auto ack/nack. We cannot make sure this limit will not be crossed, and
> when it's the case, we need to handle the consequences.

Only IBI use auto ack/nack. hardware can't handle it for HJ and CR, which
have to manually send out.


>
> > ---
> >  drivers/i3c/master/svc-i3c-master.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/s=
vc-i3c-master.c
> > index 161ccd824443b..fbb6cef405577 100644
> > --- a/drivers/i3c/master/svc-i3c-master.c
> > +++ b/drivers/i3c/master/svc-i3c-master.c
> > @@ -432,7 +432,16 @@ static void svc_i3c_master_ibi_work(struct work_st=
ruct *work)
> >  	u32 status, val;
> >  	int ret;
> >
> > -	mutex_lock(&master->lock);
>
> Don't you still need this lock for other concurrency reasons?
>
> > +	/*
> > +	 * According to I3C spec ver 1.1, 09-Jun-2021, section 5.1.2.5:
> > +	 *
> > +	 * The I3C Controller shall hold SCL Low while the Bus is in I3C/I2C =
Transfer, ACK/NACK
> > +	 * Phase. But maximum stall time is 100us. We have to disable irq and=
 schedule during whole
> > +	 * I3C transaction, otherwise, I3C bus timeout will happen if any irq=
 or schedule happen
> > +	 * between transaction..
> > +	 */
> > +	guard(spinlock_irqsave)(&master->xferqueue.lock);
> > +
> >  	/*
> >  	 * IBIWON may be set before SVC_I3C_MCTRL_REQUEST_AUTO_IBI, causing
> >  	 * readl_relaxed_poll_timeout() to return immediately. Consequently,
> > @@ -452,7 +461,7 @@ static void svc_i3c_master_ibi_work(struct work_str=
uct *work)
> >  	       master->regs + SVC_I3C_MCTRL);
> >
> >  	/* Wait for IBIWON, should take approximately 100us */
> > -	ret =3D readl_relaxed_poll_timeout(master->regs + SVC_I3C_MSTATUS, va=
l,
> > +	ret =3D readl_relaxed_poll_timeout_atomic(master->regs + SVC_I3C_MSTA=
TUS, val,
> >  					 SVC_I3C_MSTATUS_IBIWON(val), 0, 1000);
>
> This means you lock one CPU for 100us doing nothing every time you send
> a frame, that's not possible. Actually the delay was already very small
> (could have been set to ~10 maybe) but this is not possible.

It happen only at error case. Most time should wait for only 9th SCL.
I think original comment is wrong.

Hardware set IBIWON at 8th SCL.

Frank

>
> >  	if (ret) {
> >  		dev_err(master->dev, "Timeout when polling for IBIWON\n");
> > @@ -525,7 +534,6 @@ static void svc_i3c_master_ibi_work(struct work_str=
uct *work)
> >
> >  reenable_ibis:
> >  	svc_i3c_master_enable_interrupts(master, SVC_I3C_MINT_SLVSTART);
> > -	mutex_unlock(&master->lock);
> >  }
> >
> >  static irqreturn_t svc_i3c_master_irq_handler(int irq, void *dev_id)
> >
>
>
> Thanks,
> Miqu=E8l

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
