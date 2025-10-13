Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6ABCCD185
	for <linux-i3c@archiver.kernel.org>; Mon, 13 Oct 2025 20:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9wmX5Yod+t0VLinEXpwTFTdNLRZU8kzqWBdc/Wng+o=; b=Ns4M5pgFNZPQjO
	EhPnx0dp8eJwEUOboDmBSRuzca4R+A37iPZ847T0hfKYTfp2jCA/ySkmVCyzdTpd7LvyRR0nwDtFJ
	2eSyMQ2s0ezwIZSmmzefHnx3w02wa7RLZsHTU3fF4xOWvpH6aIKGC5/zZ1mQNZe0ouTTOvfJb9/Hg
	Z95O2Do9FhMcNEHLo1yoFXrkbblrNh7yBTphMec+dZqkr43LQn1bF+P3Ps3CHkSNBhLolNfI6PhOy
	juhr6HuPy1kODiV/m8vCtB3BUNofOYKp0RBx8NjP5dLS6h0I9ol4tqdfGbYdEWyobcKtZrLEnMIWz
	CKxwxd9jAhlvqJTgea7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8P0q-0000000ELvL-1Wfh;
	Mon, 13 Oct 2025 20:19:20 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8P0n-0000000ELtd-0gKS
	for linux-i3c@lists.infradead.org;
	Mon, 13 Oct 2025 20:19:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecpsw97HBJTtkjeCJziqXb1Z5TdvTAW8h9TTd072bSrqyY4gTTOloNIA5H56D5AG7uTEHrc6rw5WDe29O/CsXc0FeOIWepeVEnNqgDacuxdFDBY83n5mrWC7PvTstEv75ToJzaSv4FxrJoLImtzg9SNjjkNTG/6zSBsBdF+osHquTovZNfkd4RuHucTFZlEO9qDPyV5OwTzjIxzFiNJgU0fIRIl9ewWkZ2zyEXrHHTbBsKte0PitYNPlhjlLQxCqQGmxGeuMbQi9aFzQFqZOgYmDfyswPymiHV3Zl80S0Sd44adi2wa0yGFaGT0Vb3wHYr9wFAdAyrEHl8Wn0pbg8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGe6mR/1dqPx+8hS8hPTa1N/6sf6KxEFFbrTpvmNVJ4=;
 b=ZUeuxZ5fDrayx8CmZsBFu7nqQgIzg4/xoh9ae6PmWfaVQjtZtI34+FuQYTSvSVLFuEadaBr/ylwxE/3L7+cvn4dmlDA1LJs6fTcEOHKHke9sjJpeaoCPLqrfzgwP0MuW6o7v0wIiKruJ3IgOcYW5woj/2BZwVqr3unYMbEy6D9xF8WG/tcxTDufPTHTVPbqRAyPdnKMLKb/baOGJZ1mzUUm0LW428OgEUuCFZs8cLQZMpMcEok+QQVR9tITcsqKw6N7aNJ1XZJfBUQK0AS17NQwZHfdDVgrlXvILNyp0ozB5LwGn7tQsAiDyQxPp2jkK7hugQSUYr6W7NNrqG3RRUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGe6mR/1dqPx+8hS8hPTa1N/6sf6KxEFFbrTpvmNVJ4=;
 b=mgZqybQ+eCz9PutIABRgRkXptophQGglbqeTldvRcqP2SUaWT/UtyAPNRSru/GB3kvkX2CmEQPTCcBjfqJZ5saguz4qtMa6xcQoCmJ2bbLt/dtSt4Eix6boGARwcfLoski9Kj86Kc+6anP5l0IyIyyFbLDoWjX0slmIsD++yzvmFVkgWeNS9IWMYAsRuOzl6hsbBcdHpVMkLhAKtSuEuu2lmYxuZOG8ZFK2AvedVp86UcEEZf5LmRsgaYZ9e+VID2fr7H9jqKCoGmFLF6Xdzi3vvL/8FpCjSaxbxd+cDELN++WSBptnlYfXgNRIF/5jo/ZYLosBD05Enu1cc4aBCmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GVXPR04MB10684.eurprd04.prod.outlook.com (2603:10a6:150:218::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Mon, 13 Oct
 2025 20:19:08 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 20:19:08 +0000
Date: Mon, 13 Oct 2025 16:19:00 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shuhao Fu <sfual@cse.ust.hk>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: fix refcount inconsistency in i3c_master_register
Message-ID: <aO1etATnPSklqdua@lizhi-Precision-Tower-5810>
References: <aOYSTX5EA_nRoIY_@osx.local>
 <aOfgB6UpBha+pvqa@lizhi-Precision-Tower-5810>
 <aOio4HtjjfXclSW1@osx.local>
Content-Disposition: inline
In-Reply-To: <aOio4HtjjfXclSW1@osx.local>
X-ClientProxiedBy: SJ0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::18) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GVXPR04MB10684:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c6af84b-f1c5-4173-6405-08de0a95c38d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|366016|1800799024|38350700014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0uP5rmmLGGDpxpbHt0yVrn5smcTmddx/Ju8U94Zk0l6XhCkUvIzAJH7WO80j?=
 =?us-ascii?Q?M/n7M00M4HS5LLsXXrFJCbLzi8fp9l48SBpcqJwiByuLoF+s+oagM90PVKVz?=
 =?us-ascii?Q?Wkvw4ml1QQXcorkBx0/pCmNBez5iqbe1jT95jNyGc4+vfQm7f8H04PWw0esd?=
 =?us-ascii?Q?9/MiPO6hOACUY04yWvc0Lcjobrehp0ubSQaFacYOL9+GEoN2+B0EmEwo3QXV?=
 =?us-ascii?Q?IuUJjBC6lxOIiF2VHH4+vfJVyWc0CKopG1YLcJY9KXYscCcY+Ed51SYjOmE4?=
 =?us-ascii?Q?h4hcqA+jbyQSLwXL5esveow2/G/fD6e2DEUdoH5M7+RPOIpr9hk4ixmzHEF2?=
 =?us-ascii?Q?ZXDMAuWjKRDXbLUWU4NkpyT8BrbeJy8OOX36aJBo3n/xYYKNLtQZLomKpCh5?=
 =?us-ascii?Q?TgjGWJAI9fLd79T8DdynoxwrYMw8OaGGqC4YCXcFo3zUSz54mbpwWOUvpFsy?=
 =?us-ascii?Q?YlTmHMj+OOiv33DEVfOhhhrc4uMtVhUwFbg+sZraVohw8wvL11aE2j2yOVVy?=
 =?us-ascii?Q?sebeI4R694moTM1LB+K3wYeVTdoQyyjlCeDQQxuPTaymoBYnW9H168xh784T?=
 =?us-ascii?Q?l9T3rI32cVCeJdkBedbt+Ey613GNlbfD7r32ptaYpf/4aQx7mJJ5/5TKSxPP?=
 =?us-ascii?Q?QncZH/NdgfnU7UchX4zdn7vl5hQoPrZWyYYrE9b3yISsBQ4T/nm5qnuUinXh?=
 =?us-ascii?Q?6SFXwoJfzP+LluEgI5KsxuZd33CZ3gIa1K6VxnoO4DZ/B81STdxzfj11+Vsn?=
 =?us-ascii?Q?6FLEJ7PeO3Fkchn0RukczMxijRuxR9POM+Ivxp2cO6b0WBH4WKP3mj99//nj?=
 =?us-ascii?Q?lkgfR7vmApFjR/bRkgeMpoeaXvP1sUfHvxkAt8pBzgzFOVzE29Eh5j40xi6Q?=
 =?us-ascii?Q?GSRQ5vWHEpXu0Wy2rY2JsHf1lbKKD4rEj36K7gaEnMUqzrVAPZcluvP4LPxw?=
 =?us-ascii?Q?EYk/ke1hpqv4DmKARh3XKDjw0uv1EUxsCGAnAM3J0RJe0B5OAJHHE+XfwT7p?=
 =?us-ascii?Q?MJ5e6/c1HK7cNE95IzSGaGWzwxIpcNSbl7NhiTuxR2uWsLfn9dHVeKhAE92W?=
 =?us-ascii?Q?AqB5iZ3L2RWZhNmB7OCJKOB5Po2bSTSc3EQtyq4fhs8bj4Da/uHFavZdePQP?=
 =?us-ascii?Q?N8nBkwb5ndQx2TLjQ8fMJvcrJj+oX1zI3SalKNtsldvbf7wYOceDb8f6P3zI?=
 =?us-ascii?Q?T1Qja3rNmvCinc3M9etFS4cLDM1SybK3DUOWpJ6mLep8XkFxZjZuRP2ZJMi+?=
 =?us-ascii?Q?oLKWAByW6MhB0DD9pwCk+MxS5pFiyyhK0piLJYpCXWreLWZlp2swUswkcGMa?=
 =?us-ascii?Q?FISkMkX2AhgstG9dIs0R5Dbuk+wDj7HNgipK4oO+/9z3SYjSvlrcpdFetrV+?=
 =?us-ascii?Q?HGpP+nxI/1yDp4RUaMsxQAZGJk0CSPVmgFNqWJQqvGJAGeK2DVVjINmWq5XA?=
 =?us-ascii?Q?MC1p2sSjaABYy0zE44NyOeHRiwxUaPhGTbWAAybSNUBJQyricrlA0svmqbNu?=
 =?us-ascii?Q?L4WrzcSGVeG5pkYwNxgKeyz7kcpLa3LE/jtw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(366016)(1800799024)(38350700014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NQhMKJGWnt435gvyLJcvXYpQIgIY/nDNxkxO0XT6P3MuicAOXa7ImonPlaCv?=
 =?us-ascii?Q?qWaqXrf/WLEcvmFrUpQllIOAd1GiBKRcXxT/xXyxJbXcMlHqh6VbN5zd/AJV?=
 =?us-ascii?Q?KPuNGfGGBOBSkV/MzWKofyQziQn4mIfC/R+Ko/kwXKHBEuLR528Wfn2TL9hb?=
 =?us-ascii?Q?2s9lQc3dYPQfmSSCluj0z24ByiLYhS76Pa47g/AeP/0tQ+eDkIsTbAuULZQY?=
 =?us-ascii?Q?AwQ8Qn/h4pKCTq+aZE+gq36arKrJpYx0BAY5K7iXNaRCcxCiFlyJUUk1vkYR?=
 =?us-ascii?Q?A0lL3MVgbzUEfBBP7lSGeZTqB8UtxFNZCujYF0JNRTvN2VZZUmyh+/ei5yqz?=
 =?us-ascii?Q?YYN206xIvtwLvPdSjq8gHEdXfyB1XKbYwVb2KCdQQLAGMpom+w7Ryl5aMkLb?=
 =?us-ascii?Q?p97x/n4pi4loji+vNzVMHM9fehyUa15jKxSLFf96ZG9OWnQprKVCu1MIOGIh?=
 =?us-ascii?Q?hyHGNnPXu5vez3CVJPoWlrJwGbYVfL+Qutz9Zl22N4Rdh4NHDeid3x8g6xGi?=
 =?us-ascii?Q?yB1CLc5J6IbBnmk5S16NdUGUTrhlsQU2A/MjMmR+Ux1QrUGzFSzQ0dzwX8/U?=
 =?us-ascii?Q?4DPoglLH9I8y0VRmiChUATTF/1vxZgQjtK/5u4vuW4iSFVtWqA42cfnKa1xq?=
 =?us-ascii?Q?OdoWrAJhcDDl8AuAgmEjddi7YnW6riyDv99PtNfXw9kqOizvMjxWs8QaKT0N?=
 =?us-ascii?Q?56iXwO/YbKA83MDS1N/+SXOEFT/hCgtiHSvSt9pmIOfz98a8pavork3t3Tj3?=
 =?us-ascii?Q?BRTqobQF+XTNhHl42M2t63GcBXuJEJAh6QXiPhgpU4l5sGZXLBSVc3akkCbW?=
 =?us-ascii?Q?ck73NXM/KPMDp5EhMT9qffElLde96jzjqllIJu7ZbFaRfQNrD7/1GIfVgXhA?=
 =?us-ascii?Q?AQXmjDgLU92d8KwWNqFeL39YJE1vmOOwzmFiwntT+l5+3xpXX8xjAAQzkVqC?=
 =?us-ascii?Q?igQSjSPFFbRTNpB34KrwVV1y5GTu0TMdQR/7gXAxNdW0GL40UkBuEsuN3eL7?=
 =?us-ascii?Q?SzPCymAj3ksdyUTjYewRnpEpr6aAoWuombTT679Y8UVOsgxQu5iVhagQNrEt?=
 =?us-ascii?Q?mYi6ocoeOqnePkcXAi7zGwxyUsdsy1GV68bGGQHurPdTmthzAoCRDh6wPDhv?=
 =?us-ascii?Q?Rit3901HwclN3O6lmW8QK53GasWPlDuyAIcHhYGYHlpZtriQ7pxL264+8IRM?=
 =?us-ascii?Q?J4q5WeQWI85XulaughFrbYNu9FoVvQ6ssY1KvkmO/3j9ZySVGKZ5H4cZXPtQ?=
 =?us-ascii?Q?G1Q01qQQqLSJuWY5fOzvqxFtrqLzpPLylzB8gckrJrZ8wWE1ys0n0v+IuUC/?=
 =?us-ascii?Q?sDHMeIArOFkwiSYy124espwDNoAxoICREjpI546ewD+LJf4Y7Z60EqDS9d6p?=
 =?us-ascii?Q?DmeR6PXL00zf6SEkR3IKoOA2VegJ72Wgkvg6wULpx++IZJRMOoEue4qWg5hw?=
 =?us-ascii?Q?unOMc8gb+EPFP6DVqBNMGm4LgO7/DaYj/QrpVCVBDwNKFkuvuVT+VRP00yw2?=
 =?us-ascii?Q?vIphvStgGK/ajR8D0vIGsa/KOiLD+J1LWMn7uewgpzkPQzaDwcPWRGbFix0q?=
 =?us-ascii?Q?vRi544pRZPB2ls4BWcWQ2WrMJIvGNMQlvE9TBaGC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c6af84b-f1c5-4173-6405-08de0a95c38d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 20:19:08.3557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d1scxoPlSwE3tcDYF5zM5KwEuu8Fa9bfb9QfLcwkX7V9KOczMBNPwWgehNVIrNd/3/ayFAJNSpDzxUxqJYCA0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10684
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_131917_260417_35C0C580 
X-CRM114-Status: GOOD (  25.31  )
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

On Fri, Oct 10, 2025 at 02:34:08PM +0800, Shuhao Fu wrote:
> On Thu, Oct 09, 2025 at 12:17:11PM -0400, Frank Li wrote:
> > On Wed, Oct 08, 2025 at 03:27:09PM +0800, Shuhao Fu wrote:
> > > In `i3c_master_register`, a possible refcount inconsistency has been
> > > identified, causing possible resource leak.
> > >
> > > Function `of_node_get` increases the refcount of `parent->of_node`. If
> > > function `i3c_bus_init` fails, the function returns immediately without
> > > a corresponding decrease, resulting in an inconsistent refcounter.
> > >
> > > In this patch, an extra goto label is added to ensure the balance of
> > > refcount when `i3c_bus_init` fails.
> > >
> > > Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> > > Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
> > > ---
> > >  drivers/i3c/master.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > index d946db75d..9f4fe98d2 100644
> > > --- a/drivers/i3c/master.c
> > > +++ b/drivers/i3c/master.c
> > > @@ -2885,7 +2885,7 @@ int i3c_master_register(struct i3c_master_controller *master,
> > >
> > >  	ret = i3c_bus_init(i3cbus, master->dev.of_node);
> > >  	if (ret)
> > > -		return ret;
> > > +		goto err_put_of_node;
> >
> > I think it'd better to set release function for master dev to release
> > of_node because of_node_put() also missed at i3c_master_unregister()
> >
> > you can refer drivers/base/platform.c
> >
> > Frank
>
> Do you mean that we should do `of_node_release` in
> `platform_device_release`, instead of respecting the refcounting via
> `of_node_put`?

Sorry, I checked code again.

static void i3c_masterdev_release(struct device *dev)
{
        ...
        of_node_put(dev->of_node);
}

i3c_master_register()
{
	...
	master->dev.release = i3c_masterdev_release;
	...
};

Suppose of_node_put() will be auto called when put_device(&master->dev);

Do you really meet the problem or just static anaysis?

Frank
>
> >
> > >
> > >  	device_initialize(&master->dev);
> > >  	dev_set_name(&master->dev, "i3c-%d", i3cbus->id);
> > > @@ -2973,6 +2973,9 @@ int i3c_master_register(struct i3c_master_controller *master,
> > >  err_put_dev:
> > >  	put_device(&master->dev);
> > >
> > > +err_put_of_node:
> > > +	of_node_put(master->dev.of_node);
> > > +
> > >  	return ret;
> > >  }
> > >  EXPORT_SYMBOL_GPL(i3c_master_register);
> > > --
> > > 2.39.5 (Apple Git-154)
> > >
> > >
> > > --
> > > linux-i3c mailing list
> > > linux-i3c@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-i3c
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
