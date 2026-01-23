Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED53D72342
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Jan 2026 07:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vvZhCYiqSvz9CyQC4rsqP/Al7H5JwELYPWytKPjf/T8=; b=g5sX6yJx3p7X8t
	NzSRZklqZgGyvVe6rLbzYTrmz4VP19vCksTPKZqngtxMXVB2Fv0dT5cNll/PAu/b6BwFfxRZDfy7S
	xYTfvRtb59g3ZweVpsQ55e+SW3iQ6x2MvjLTGqHWS1pUuf8tW1UgXWAPvS6dK1gUSa0mQ9262j36s
	fNTR/y95iMqdTKs1u/GfqKs46XYr1EZGz0j3OiXeZHCf1qTr7vTCjZksLsytPE/nMR5qjhwBZIrQs
	m+7nq8jLjut3rRFCEdE6WFawY+zu1/NkRp7nnGy9ro6KAWJUTVX2Xyzb3H1yfiHzKNWXO5QFHnUNJ
	5qGIeVtg38FijvARWI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBkJ-00000008NmN-3Wfw;
	Fri, 23 Jan 2026 07:38:21 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBkG-00000008Nlb-3YMQ
	for linux-i3c@lists.infradead.org;
	Fri, 23 Jan 2026 07:38:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xO4GHwRMW2Ch00tJMw7J2TbgacHO40Ai6vf6wUni0YG0SEKgiacx1ceW/uYnpR/g6RNRZHN8J3EQSG4kWTbZIEiX6a5PTtVygMvu76op5OKkjym4Jp6cgDlWdeUixWx4qcKIXx2z/MeCMkyOsMqDWDaAOzT8cxZFqG6/fS29ZbV0CGThhVmOcm2RAgKX+1Jnimz47//W9VR4BBBSEpptnz6GPHqKSxZyZJJ0FBuaJSPPucui8cAYe9xqkWLsrvTF3S6jTv6Tm9kj1cXvRY6MIH5tCNQvJjl6kbRziS7NbUHjKO3kf1g7K6DbsGaKDjHHu2Jx58kK8AML+H3vujTc0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxsC3Adn2n0ZSrRZp8e9ZmoCGUuNtuknxlyWt7ZwM5s=;
 b=NysRwS2RiUz0S1Vb91a0JG9X0O6EHc5weva9C8OM2nZNAlR9ytQIhRLxKbn+xGPuLLp5CQgV5BFP7ycC84FY6lIvx1+2w69SHc1D2YUoJk7qD2PLjbD/k8EJbNc8b00a3VMuq4i8YauFHrQCxYh7L8kBQxpydKvY5HLM/nJmlM0tXwfdjuepRUeMnELib6ELOC/VfpqjxFWpbiY4v62yVJvStK5N1AZUP3w/baQn1uUb4Go9TKvaFSSkRN/Q4k4Mo+zsLcKjnNBSN029KPA5vmXP+2SIjuj1YQHM5Diy1w0bk7qJvE7Q72i/YUf92uZ8OaK7A0ZSVZyLyUnuY5Kd3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxsC3Adn2n0ZSrRZp8e9ZmoCGUuNtuknxlyWt7ZwM5s=;
 b=qznKmp3RTQk97swrkJbzfuvCto8fliKimBt2sfqqt3ejSzjQDTw+hlnHhbWzbwsAl69QigC3r8u7HLXO2qMJak4319cX0+5qYvkLckj2iq2onGBbTKiGpS3azu2uyfM99DrYwlDo2eCTV8L5qnHyLoxpKBGlzcE5tdfw+IWGEFuNFwZp6xrHahGR1HYeHNNLp4LcdQmBzH3oq2rSArvs9yNI4/BJZ6yVuUBr3irjDWp2qhTgMhCP6cwR35VQOGOHJWHDI9456MTwDQgJtlcKxTColGKuvU5IZwWj2/KtMsSwC6WoK+jd9JQuZb6rx90NavlqfuReurhEr8Sv3WY6UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 SJ2PR03MB7380.namprd03.prod.outlook.com (2603:10b6:a03:567::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Fri, 23 Jan 2026 07:38:12 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 07:38:11 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v2 0/2] i3c: dw-i3c-master: scoped spinlock guards and SIR reject fix
Date: Fri, 23 Jan 2026 15:35:10 +0800
Message-ID: <cover.1769151395.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
X-ClientProxiedBy: KL1PR01CA0140.apcprd01.prod.exchangelabs.com
 (2603:1096:820:4::32) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|SJ2PR03MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c373803-6d2e-461c-8924-08de5a525c3d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ylku/iRzamqR8LDZowviq4ts8uoQZi2XpH9ljN8e7mMHnUJW2iF+GqTK/XuY?=
 =?us-ascii?Q?uzsAjIChgsgJgWelhoY14N5ntUi49USNfEBJIqVmCufhBdFoM4zBHcHqHfw8?=
 =?us-ascii?Q?ExVkTn1C5j9uWvAM3wnqqbtTSTs1JfR0GhKYbPbjVpRpbaMzrAP2IDEJIgRB?=
 =?us-ascii?Q?8fTu1P/fejAPfeP6ZPbVl9ZDU60N1a06XwVfE4BuoRtX8AdcqO8wuSa//Xtq?=
 =?us-ascii?Q?1qfSJ9fFM0sORHvipaV9oQpS9PryN8zMiUsgrpANBeuQxG1foFHFugsV36P5?=
 =?us-ascii?Q?gBlnqFgN6c0VQtfTNtNISgVIXIQR6pAQg+Kg0kw7Nw6s7o3CmDyh+vHZ4X8m?=
 =?us-ascii?Q?PpwzL13NSGmD70DjWgGHOqxv13k7z06cH19kOa9u8qvoNuOhARIcBAwkFAIt?=
 =?us-ascii?Q?bUO2EEaP1L2ztP/RYZJ1SX/r6KXwVmfxDM2YU0CdF4D9Kljs4tGmtn//gcV3?=
 =?us-ascii?Q?kcSWe4n44JaujjpGo5sUoACL+iAf84iahplZ7e0Vc0cgePlkICMLRQRpRB+g?=
 =?us-ascii?Q?wsTHdYOZlkNDIV6rgNBNI/UjbGVCdmm8LGD9S2RJX603A3bKxFHujH345n/v?=
 =?us-ascii?Q?YfIJ1S0k0lM1l0K+swZ7b5uMH8pVOqSnQ4BvwxiuJHJvzi5pR83trrWoTzg5?=
 =?us-ascii?Q?BvWbf4quN34lVq5lz6lfyGf+0zHPJ1kQOFeJUkCQzpP3rDPSnkztYRU5oD2j?=
 =?us-ascii?Q?OnvGOTwFryK4udf+eKsfQT4YgPIEBM8iKCIPpUUN+hkXzS0DB3F4wLu7jJ/N?=
 =?us-ascii?Q?cTwSk7u8/sXq30knQclt62+zLV7djizfSsLtofGJNIiWnUvUBvpddu9VQde0?=
 =?us-ascii?Q?OwqItgmfC56wQVScK9i9cHdB2GIgidtVVDRWzdOzsArxMbMB3/6LZqLruK+1?=
 =?us-ascii?Q?Zpyehv14MEn3Cs4SYYbGAN773F7l+vPCw5tBlaP5UQjRRH3BkR3Dg45QouMd?=
 =?us-ascii?Q?tXZFq3WLKEdxAIkG3Wvl0r1Gt+XbGTNbNZCiucsdNRaaY+Bf1PgvOrbNaAYm?=
 =?us-ascii?Q?h8vHh8O+2dHWKriQt5ci0ee8Q08i7zWTMHzCbEi30jsKbRREjVzqkVrubM1T?=
 =?us-ascii?Q?t7W2iXsSDhFji6m/fC3WBDbGW+ZDxqwlcHKYO5GQpKd/KfzbTGfoXryZXBhi?=
 =?us-ascii?Q?T0qC9L+MZUopJSxjKWwJI1ohmH7kJ/ahbh/oxpXT6OgcsK4Xu1LuT6XJPilZ?=
 =?us-ascii?Q?8lk3of2twFAGAwUz6W7dlApsNxyFhM363QjerLzH7HY9xVAp8EQgSzDrPsDr?=
 =?us-ascii?Q?KFns3VXpnypRQigVCEX6QRYqAsWT0TfjYRokNE6EMG7fZbJ+HgHR3/YbID9x?=
 =?us-ascii?Q?fQYT3/qHxpmEV8hgDUNm3CoGSA8I4Q3u8lNQzcEc+WcAPTuPKflIrNz8LSBQ?=
 =?us-ascii?Q?/UW/dBpOMmOSAecfBIM/16W0xYrO4wEfbNWs1ePzuEW65yglFZuLHAwcFHU8?=
 =?us-ascii?Q?g//m6Kg7OZl7BU/tagUOJ382//+pjJxGPbofogdeCx/3E4xkZzbynKs+xUq8?=
 =?us-ascii?Q?h6t6nun43Ou2DD/Rue+Ry6402jFbzodjoNttzQKYajO9BogoSCjRK4kjwbRW?=
 =?us-ascii?Q?iU2nGQT5fLp0k6tFtLo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QOTJ8uej8ZRxHX9Xk0zNk0jgjDyCMn7AT3xWNLahdRdzkm3rbgvIC8l55f9g?=
 =?us-ascii?Q?4uFHgYGeJhES1ieSUM362Du+FHwmtTzEt46qJbMD/4AsngYwf/Xbpqdn7Tlg?=
 =?us-ascii?Q?SUvUUot5qOlXpCpIq5yqZWTJ5Gyta5SJV7G5p9GRXx/u0ipJcBmc/CZWd3Gt?=
 =?us-ascii?Q?kz6vsTbC84XWaE+bcbee85JTs2Vk3vARUw3Bxz4XdBRdGESvV9EhIVqj+L7K?=
 =?us-ascii?Q?OYwr9jTqEngJF6y/9jcsY+ex5y+a9jxcieOUWh/A0q7abj09KkfqTWCccK2Y?=
 =?us-ascii?Q?px1ecAb3BuME5PDjFy9QQXUme8oyg4mWSG+kDZRsjWcFYGYp/nCov1YGe9WP?=
 =?us-ascii?Q?AT5DMP5P50kPB3EBpzRTO/mcoCU6UheER1AyIGzroUTsGAZaEAvSc1lJMLFB?=
 =?us-ascii?Q?g0JU9+JOResvCkcJ7fdbhFYgI/+i0U007mcLjzWrDWdtStS2oEoR0MS+AwAL?=
 =?us-ascii?Q?qIAzu801McxKtMh4sq2SXjsRM21EnBZtBZwvnIAaRypWxggjRzEu6Xf3QB9H?=
 =?us-ascii?Q?fBcE/TceGorzVETTbK25zJ0/tYR32tkc12jSO+uazy6UctQCuKF/022eyC1m?=
 =?us-ascii?Q?z3jF1tWn/s9Y3rFHhNhA+sHPhusEln9wE0/vErO+3wdDdorLEikZiVVpMvEb?=
 =?us-ascii?Q?TongPwv2nLRO7oRRHTAtdXUvLwBbXIuhaZlGJKvo71Otq7E8HdOIo2dxubEU?=
 =?us-ascii?Q?6LR3g651R78XUNLzJrJpLnQtjc2MCEBgsmi+m4AuvLv+9a9N12UfsmU60+V0?=
 =?us-ascii?Q?1D40SqiK8EBKyK8mFoezu9SQcBbIXFccQmOZs5ZsG3x+iUCt0NzbzgHRIGRc?=
 =?us-ascii?Q?dv8o8O8TRc//aDYc7WDbLxoYN1zTj8eUfwk5lEnN+sGU27ZT7moVBWliSXHP?=
 =?us-ascii?Q?LltvsXcypxr/0vwLKXrBSdA8KO0uYMJyhe/nuLMpCcV+M8FBOSutyiAAQf7R?=
 =?us-ascii?Q?ZqWBim3Rbu+zMlNV4qlb+KM4oD3f/FYyGOgExQi9Pbj2ldJpGlim+jX+cUCw?=
 =?us-ascii?Q?AxmPAfcks125GeWQYR28j1K+BgZVCQkhrVE2YYfAF0T1Kq7Fsf6ORsQQ0YL3?=
 =?us-ascii?Q?vT0VXdSGaRDSe3T7/kO6PssTWTP/UQy4cEZBctsegV5Jq9fM0J8xunH6j+ZU?=
 =?us-ascii?Q?YVNr3YnD3okOeOiIsAvN2GxbfMsaT46EBepta47LH3qVLp22E2/n2EtwBtEp?=
 =?us-ascii?Q?0MowoLF16hHUDHRgVtKX7WOgNXHjGNec3/oypEKytCLQaiK+h8YAGdMw57Dc?=
 =?us-ascii?Q?sNB3AnE32hgCAHXh4Soo1TgPmay+xpoc1U/ZAJsiW36vYJHEUyVjRD2zvJZy?=
 =?us-ascii?Q?lQ3Id0er4xKrxJXPKsz+ulkStu4ZDTdOa+7TN1+K3HXHDbMqB5NbVXCkrsul?=
 =?us-ascii?Q?dk6tIauEehS8SssIDetwA5mUnPLPtn6eUN1NGq7TfBZC9FsGIkNHJPxBAh3N?=
 =?us-ascii?Q?kAR4kZb9qXqB4azQIdcMq0WGEHPjQxXpAQSHgXrxmaxRCh8zp1GbwKPJ8JQD?=
 =?us-ascii?Q?R1Ff0nP3K2dtfGsbk+MUg1QI30JC2kxl02YW3Ku2nm0atzcOmasknwwhabYv?=
 =?us-ascii?Q?/RzKeTWmMGhAc5onSRrWqspkxuShEl7KPMOB9qq04BSGRYlGoK/e4mq0ZdJt?=
 =?us-ascii?Q?XiNqPhiPx1kbLVPAPnr3VFlFINWgv2aV0e4h8LRmp2SFXDA0LmrEOMfx5EtA?=
 =?us-ascii?Q?K3ZgL4XXdEv9zgAhvI6H2sK97c+wjYwfMfnOy0gyPBXhO/KPj0dE/+qo2c+2?=
 =?us-ascii?Q?DRgDTa59AWHdRswjjVKfCJS/39eWMuo=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c373803-6d2e-461c-8924-08de5a525c3d
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 07:38:11.8339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTDm4vYuSB4RKabR92D3UbE+au12m2Eo+f3BVgQO2/xmcxdYGBV8JsZM/XjBsQWJe1x8AS/9pUdXneJu9/iLOGRA6+ctZvEle4E7LiDXQSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7380
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_233816_901095_07AFE187 
X-CRM114-Status: UNSURE (   7.43  )
X-CRM114-Notice: Please train this message.
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

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

This patchset replaces open-coded spin_lock_irqsave()/spin_unlock_irqrestore()
pairs with scoped spinlock guards to reduce boilerplate and ensure correct
lock release on scope exit.

In a subsequent patch it fixes the SIR reject bit mapping used for IBI
handling. The IBI_SIR_REQ_REJECT register is indexed by a folded form of
the 7-bit dynamic address, but the driver currently uses the device table
index. This can result in IBIs being rejected or accepted for the wrong
device. The patch derives the bit index directly from the dynamic address
as defined by the controller.

---
changelog
v1->v2:
- Add implementation to use scoped spinlock guards to ensure correct lock release.
- Update remove DYN_ADDR_HI_BITS macro definition and update MASK to use index directly.
---

Adrian Ng Ho Yin (2):
  i3c: dw-i3c-master: convert spinlock usage to scoped guards
  i3c: dw-i3c-master: fix SIR reject bit mapping for dynamic addresses

 drivers/i3c/master/dw-i3c-master.c | 57 ++++++++++++++++--------------
 1 file changed, 30 insertions(+), 27 deletions(-)

-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
