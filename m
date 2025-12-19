Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5899CD78770
	for <linux-i3c@archiver.kernel.org>; Fri, 19 Dec 2025 17:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3yJ51yywq55lb4fs0L788NkiMAmzJHRh4HTKzZlhgY=; b=gc/IOQuuixLibU
	IrCt2iN6ezafl0f4aZnWfo0zdXGOSkJU6x9s839934b9XFsM4N3HVedOFqLB6Z0fhnc5lO+57HHPo
	nmGQYUv8g3m6qy5FaF0bO6/Ohn/OtjZdLVFBJeJZJo25BpbauHayXBwDA0gcGsJFd/fVhTRBGF5q0
	QhUPvWP0J4g2yla+Usxvr6xK4gfqZb258lBbZJyjHXgsbeHY++29QkaNTJ2vyTqdFwBTSL6t7VHIA
	a9zaTcBi3Tk+IyNMu4kU2EKohfYBL3trPWSv0PnvhXKIAhAVi9k3tdFt4JDpmdnUBjRW78RO/TWiA
	RZyKfulC0ApdDo4WDqrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWe6C-0000000AhZU-0Nvn;
	Fri, 19 Dec 2025 17:17:04 +0000
Received: from mail-norwayeastazon11013014.outbound.protection.outlook.com ([40.107.159.14] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWe69-0000000AhYP-2Txk
	for linux-i3c@lists.infradead.org;
	Fri, 19 Dec 2025 17:17:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tG3L70BYr2YvBdw7BV1PjsqP74fo9SM0F2AacpzywXPr6mrJKX5ixpBLhDrjfJvgdlf3VDP+opqZY08gG+OK/8DvG5sTa2O/Qb8d8G2Ys2ke/1KxU/2iklYoJiJ+pyUjitQoW1ylDzQmSSu9mIs/Mi0sbhuXJnkkhKzENSym0D9W/LXej7dn54az3pomN0rQZmOznJWwVuk6tq0H78PFWFY4IofT1VD2na3Aei7oOtOJbRvUXjCNxRP8UdLi8KC/mCv/3pwZLReb8j1BMxDboPpipZ7NP0l3yjeFrt+Gcr35qS+ALfsgWpazSmWciIvukgTXylsEtht0111L5mqxWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ITfgWZWqCTAbbNuMQVu1VQ0vc4gXmuH9y5+GP3AKdJU=;
 b=E2L3f6XUnhhfFocH3Lgu8KUQtalLQhSswoJsY2p906lCWEWmO+KbIri1awePHKDVybe1g6nrptx8e2ucjh4k4B3DW1ctyH8W+uwBMYNrDi1yqi8V1We9Qw7eOtisK7thaC+V8Sbq+9W0wpyXTOVdokpQYh4BiOua6PPeMWpgMyiLzGJCgxhiQB+7B/TbVKugl9P4FaiJ5ThPBT9hN0Z08rcIe/haRHKSCuXPGz3bQwcBlal6H0af2O/l/dtLTi89oNnskEV3f8zjxCdTPzQEjiThf3vtynqNMV4zKzF9XgjH7fzuVgwD+lvUaO9gPj6qSv3EBWPv6jfHCZ7+kUQMlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ITfgWZWqCTAbbNuMQVu1VQ0vc4gXmuH9y5+GP3AKdJU=;
 b=JWv+BsVPfztMg2XTcgI2N8vCldxiFjlLOCmSw74Wywv2UwLYcwHKDHnWOvDLXsz9RFIX6TYmOnhdysC3C2ETkebS4FdjfWM41Y7GwhvE3Dcjhvo69BRV9S7tKgINH4L4sHkfEHGhMdR5Gf3CnPYpS78fJL442Dd0syikcV2Xa3ArzOTA2WYldmpgnR3P6Mpl+EKzXBHpJHin2VeMdUgFanBKV6jsATa2I9b5CbpR3v13qpxqbnmbf7X75/jJOQaGuw0Wey0gTDUUsH2D2wPms3BXDtW8/R6efS30riMgF5FswD0a6z0iqi6UqoNLXPyuwSYM/Rcg3knPsMd6y5Ljow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS5PR04MB11346.eurprd04.prod.outlook.com (2603:10a6:20b:6c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 17:16:56 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 17:16:56 +0000
Date: Fri, 19 Dec 2025 12:16:49 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aniket <aniketmaurya@google.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 16/17] i3c: mipi-i3c-hci: Add optional Runtime PM support
Message-ID: <aUWIgXzrni0o4rWS@lizhi-Precision-Tower-5810>
References: <20251219144534.84391-1-adrian.hunter@intel.com>
 <20251219144534.84391-17-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251219144534.84391-17-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR13CA0234.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::29) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS5PR04MB11346:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a465b47-bdc7-45b0-0bb0-08de3f226973
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|19092799006|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xeThFZvUzOx54AUEFQElkleSLAy0HszGVzReIT+PCPEVg9L6JCKQWvav+fhJ?=
 =?us-ascii?Q?rSiIVFXQPRK2bivNcY+lp1ITtQjXIhUoCPwu+ZEnvtvSC+wK03zV4J0EmXcK?=
 =?us-ascii?Q?IJJU+wnPL6zijsZIIRrTRW2JTzd97+FVopSJHnWpB1DpP2aAizsSICdukuf0?=
 =?us-ascii?Q?YN25sLDo1xnol8bf1qfc0qfsBMZ7PJnOcA2B+t2VTPDkwidOFShLwO/M4MAE?=
 =?us-ascii?Q?/LMzGlmyzD8ZlOotUFDVyDamRDHjLmI9LjFH5vcNPFbm9+KH86xZgGvzlm7i?=
 =?us-ascii?Q?EmxUpBA96CCl6xpDmHZpsDiliKMbR30U7kziY1+ltqSNkpa6HrsTfMU1eBY6?=
 =?us-ascii?Q?e8WUNOFzZFEFXqTPrgwykAvp2nCYj8yPHmiGzfOwThZkN7x9WD02IL+W02Wl?=
 =?us-ascii?Q?z6Uym8n0atAyc04RqQvY4+ASJnLGQrNsQwTLfwMMETBn+uV2fY6czxvWK9tF?=
 =?us-ascii?Q?h/yTPvHmWD0DDhc//D9FbFHJQ2mWxlo2BqQHoNL0bNClBz56jv2/h9uTNN3+?=
 =?us-ascii?Q?1tDqg4407gAg7IqVcKd2AgcIC/+9H2y+wf60Mxe4A7rEpTG8nNVUZUb1TfZU?=
 =?us-ascii?Q?zU5ufKG8b5Zc3jn3JW9DHlLfVwZXKzqHl12Je0Y7klDwivyTRtW7jyfCFbcy?=
 =?us-ascii?Q?EFTIzX9Y5gGW5CidRntN58LWouVzOxBNngDnLyDpwrIAdxDm15Z1ckGbhzSC?=
 =?us-ascii?Q?EPWPJc4H2TI478pynBfRZnhDjneE9E3QjmnI8x3uDJ/HOPcSeSERiB1/2Ji2?=
 =?us-ascii?Q?9GLC0jvXJguzeH8cnWapoA+fww/yZPByYKuhNmgjqlDSbqMqRlfF/wbZhxKI?=
 =?us-ascii?Q?5tljPWjrv2xtzeizEIDTw47GIiZ4cpBG/rGp16msUhUHektwk0Qdt7hJu3sv?=
 =?us-ascii?Q?0wwwUne5lKyt3VQIUIpKXq0L8GpLD5Z00Weg0Rro540f49REg2w9YrBUuA3I?=
 =?us-ascii?Q?BYVLXgBN69VzLu8tWlI5mDfnI/BvAtl7wQawrkpfsqw7pGOzQeANODo/9kIj?=
 =?us-ascii?Q?EmrFFvwtcv8Vt7ICvAqCE1KoVwgBgNJgmZUx3GBL9MUpAmHpQz5Onw2QS3TZ?=
 =?us-ascii?Q?CSsER/KMCoP8jqkc0XGsF3aHvFpq+GnSyMow1I+MAsOAq0MavV1YKzMZZ82B?=
 =?us-ascii?Q?6DzLdd/efhVxKoOagwpANoULn2DOSYrKK7YtmevLJu9hKwJZgn+n5QekIYTP?=
 =?us-ascii?Q?gRqv2HdL4hJKmeoNTpEOI6uO0r/3Ez8bH+DbgA9OzPD67Hj4oOPjJYXIU1rX?=
 =?us-ascii?Q?9Wn/tfwreDX9/leFasr8/FzacvGX1el1DhAxbvb0gG2DH/CgWWs7Zv80+uJ2?=
 =?us-ascii?Q?NgBk2q0xHl1WQrZqH+z8O96cMQa2a9xdLPsxEkbpc4Kcmzgomkgu2/LZju6m?=
 =?us-ascii?Q?HJR4kEcovmjTt3Z+rYnXLjYZoeIGAVG4bXsS9ISJ+avdEklJ7KE2JPjDLioa?=
 =?us-ascii?Q?6ZIB8CVpRXP2q/GL6sTk2lMNLlwHu2HBXxUh/cXLRujowU2uPFJbGYAJpKeL?=
 =?us-ascii?Q?E8mJi2nx56QFHhntpm5AJSE6QCxQiddj4h2D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(19092799006)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LEIzWlf/9g8vItA+OsTuYbHRa75p7xFoFi2POcJGypNIb/vS5+HeNqHjsuuU?=
 =?us-ascii?Q?x9sKyD7xwARX+H2X8h/QS61tPpTtLUhqzm2QmsNeuNs3eNmC4ZKljJS2PaYg?=
 =?us-ascii?Q?RUL0UxCD1BWu9w/Bh5jWdTriGmynVjydfEb9ciH1uiHy5/u0PRkfAQImAQz3?=
 =?us-ascii?Q?WLAih7w3IU4ofoSLxaUD0V5WqREiDhp2XoMMByAoUfUMjtHkG/pOx2tNvDF6?=
 =?us-ascii?Q?thn7MHDctTb8MkESLcILU+wM8s9Dh7HBFgMwdqIU0+5SMpJ7UPDqzJTCj7Fs?=
 =?us-ascii?Q?KgDppSGMEhSBmeFLxyN1S+5dBNChxM1mC87xG26me/GVGaHK3tUwzSnYloMD?=
 =?us-ascii?Q?asnGO8kihiKFMfGf9KhHEUZ2Zi943ynSiFrT86z45rLys08e2paJo4gkQ90d?=
 =?us-ascii?Q?B+FsOIjFIz4vL/nW2I228gMcz7G8JgGYBT+BjMbgNafECgKrh5PtkJkIvMCP?=
 =?us-ascii?Q?CBQlKGpM91bRSlpnCOkMBnj10Wb1f2NW414xrTva/1TdBbo3BA7z1OAvGQiv?=
 =?us-ascii?Q?sevbvfQfXGmmDbOY96duPC/m7OlGkxAar8tFv0Yi2K5VvjI0p1Mo+NZ8avrV?=
 =?us-ascii?Q?uEEeRPKIF9U+Ugb+k93e1wA8Hf6o2My4c6NVEYKqkZuZ3gDknYGj/NxsSPNY?=
 =?us-ascii?Q?PN7z1kROLYb4dpfhlg/0hGtbfS57i3wds71tq99ItBS184MIUuIgO6hKi71E?=
 =?us-ascii?Q?kGBjeaheOeLKplGelThGRhI8eCGjOUV82En5yjxVcHF1ki+9T+JIHr3WWAuv?=
 =?us-ascii?Q?nDeeLjR7gVrGF/794+WFEta5FrmsTCZoX2+NfOThEuuU0XRPZp0fqPrYC3o6?=
 =?us-ascii?Q?9ZnncsvIBzvCqrczTndvkmTdSzK7zCVl31GAsFLfFb5LeUBZnuyiC3iAuJIF?=
 =?us-ascii?Q?ftwmDcfAAOoWkPXnNItXsNFWzTgRsdxz0PMfAwLRmBL6QpVpdLQ1s8I0x5fH?=
 =?us-ascii?Q?g9x3wOI9eCeHZFdvMH4dOT4HZ7p2SWKS3v4JyUGOmQZ0ldMfywXgQPWmRMVx?=
 =?us-ascii?Q?darxxmr7J+WJDdfBbjG2c5GlNCSmoc5ma+AutxWJlBp1Oo4yh7uFdeL6NeAJ?=
 =?us-ascii?Q?z7Btv6a59q7uo6ldCLeSd6LXXPVr84cWAAEC06Aq2JznoLeiswg3WffnK4fR?=
 =?us-ascii?Q?LA1W1E3mT/c9n9eMJiPeO8JqDirKf5PUbJ9k8/h/fpqnAc5NVQDrTryTwg2o?=
 =?us-ascii?Q?k35QxFx8yjBM3CICSCzk06C0/zR/DhztNe6SZNw4qigcOj4xCZDQaEjH8TY6?=
 =?us-ascii?Q?mM+lMePuRxBw62H4E83Iljaru9u0df+uOpU7tUOZd9RhYXvR9gFELgkZFUSk?=
 =?us-ascii?Q?CGU4HBL36D+Tq8kCHJndx/RONlNAa24b2qAit/jTXbXe3heASqBJ+f1EU8M8?=
 =?us-ascii?Q?AH4aF1oz3gS2j/zDjhsFa/CADV2JQVCyLxFm2QTg0iCxkzVX9Ze0+oNdRtpr?=
 =?us-ascii?Q?bNgs9WigXfuMWDxp5/Y/zU5Tf40g4ILBflA8mANydKkTxm+LiVa2mDEFBO0a?=
 =?us-ascii?Q?nQEXp0u5IVBTQ5KhqhDflOSHxxL99GVSUqyFD5qVufOtWucmhv/hf+vN4wZA?=
 =?us-ascii?Q?RYftY/g9PztoKk4jIxTSatfiQQ274WXaeINyWKw6N6h7X9EcQh4CCjYz+CzP?=
 =?us-ascii?Q?FT5GV/TfexD71AAyZrQdo8XAR65BgJdSGez0oIfaicdklYvRcEQO5peHO6FB?=
 =?us-ascii?Q?IqOA35AsH9N+vb51mMrHrhz3rOmTblkLNCOynjEu43T7dYQW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a465b47-bdc7-45b0-0bb0-08de3f226973
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 17:16:56.5387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XEOl42hXsfibnFHhX11uwEr0pF8APXvfA439mqzEjwI9VjsU/L8vneK+5NLpHbm9pwJBJfKxuzgX8/67503pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11346
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_091701_636482_F016AF6C 
X-CRM114-Status: GOOD (  32.30  )
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

On Fri, Dec 19, 2025 at 04:45:33PM +0200, Adrian Hunter wrote:
> Implement optional Runtime PM support for the MIPI I3C HCI driver.
> Introduce runtime suspend and resume callbacks to manage bus state and
> restore hardware configuration after resume.  Optionally enable autosuspend
> with a default delay of 1 second, and add helper functions to control
> Runtime PM during probe and remove.
>
> Read quirks from i3c_hci_driver_ids[] and set new quirk
> HCI_QUIRK_RPM_ALLOWED for intel-lpss-i3c devices to enable runtime PM for
> them.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c | 96 +++++++++++++++++++++++++-
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  2 +
>  2 files changed, 96 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 3b0609cb7da7..9a8d34ae4a66 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -16,6 +16,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_data/mipi-i3c-hci.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>
>  #include "hci.h"
>  #include "ext_caps.h"
> @@ -176,6 +177,7 @@ void i3c_hci_sync_irq_inactive(struct i3c_hci *hci)
>  	int irq = platform_get_irq(pdev, 0);
>
>  	reg_write(INTR_SIGNAL_ENABLE, 0x0);
> +	hci->irq_inactive = true;
>  	synchronize_irq(irq);
>  }
>
> @@ -558,6 +560,14 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
>  	irqreturn_t result = IRQ_NONE;
>  	u32 val;
>
> +	/*
> +	 * The IRQ can be shared, so the handler may be called when the IRQ is
> +	 * due to a different device. That could happen when runtime suspended,
> +	 * so exit immediately if IRQs are not expected for this device.
> +	 */
> +	if (hci->irq_inactive)
> +		return IRQ_NONE;
> +
>  	val = reg_read(INTR_STATUS);
>  	reg_write(INTR_STATUS, val);
>  	dev_dbg(&hci->master.dev, "INTR_STATUS %#x", val);
> @@ -613,6 +623,70 @@ static int i3c_hci_software_reset(struct i3c_hci *hci)
>  	return 0;
>  }
>
> +static int i3c_hci_runtime_suspend(struct device *dev)
> +{
> +	struct i3c_hci *hci = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = i3c_hci_bus_disable(hci);
> +	if (ret)
> +		return ret;
> +
> +	hci->io->suspend(hci);
> +
> +	return 0;
> +}
> +
> +static int i3c_hci_runtime_resume(struct device *dev)
> +{
> +	struct i3c_hci *hci = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = i3c_hci_software_reset(hci);
> +	if (ret)
> +		return -EIO;
> +
> +	reg_write(INTR_SIGNAL_ENABLE, 0x0);
> +	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
> +
> +	reg_clear(HC_CONTROL, HC_CONTROL_PIO_MODE);
> +
> +	reg_write(MASTER_DEVICE_ADDR,
> +		  MASTER_DYNAMIC_ADDR(hci->master.this->info.dyn_addr) |
> +		  MASTER_DYNAMIC_ADDR_VALID);
> +

Is it possible move these register write to one of help function?

> +	mipi_i3c_hci_dat_v1.restore(hci);
> +
> +	hci->irq_inactive = false;
> +
> +	hci->io->resume(hci);
> +
> +	reg_set(HC_CONTROL, HC_CONTROL_BUS_ENABLE);
> +
> +	return 0;
> +}
> +
> +#define DEFAULT_AUTOSUSPEND_DELAY_MS 1000
> +
> +static void i3c_hci_rpm_enable(struct device *dev)
> +{
> +	struct i3c_hci *hci = dev_get_drvdata(dev);
> +
> +	pm_runtime_set_autosuspend_delay(dev, DEFAULT_AUTOSUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);

use devm_pm_runtime_enable() can simple some code

> +
> +	hci->master.rpm_allowed = true;
> +}
> +
> +static void i3c_hci_rpm_disable(struct device *dev)
> +{
> +	pm_runtime_disable(dev);
> +	pm_runtime_set_suspended(dev);
> +	pm_runtime_dont_use_autosuspend(dev);
> +}
> +
>  static int i3c_hci_init(struct i3c_hci *hci)
>  {
>  	bool size_in_dwords, mode_selector;
> @@ -806,6 +880,8 @@ static int i3c_hci_probe(struct platform_device *pdev)
>  	hci->master.dev.init_name = dev_name(&pdev->dev);
>
>  	hci->quirks = (unsigned long)device_get_match_data(&pdev->dev);
> +	if (!hci->quirks && platform_get_device_id(pdev))
> +		hci->quirks = platform_get_device_id(pdev)->driver_data;
>
>  	ret = i3c_hci_init(hci);
>  	if (ret)
> @@ -817,12 +893,20 @@ static int i3c_hci_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>
> +	if (hci->quirks & HCI_QUIRK_RPM_ALLOWED)
> +		i3c_hci_rpm_enable(&pdev->dev);
> +
>  	ret = i3c_master_register(&hci->master, &pdev->dev,
>  				  &i3c_hci_ops, false);
>  	if (ret)
> -		return ret;
> +		goto err_rpm_disable;
>
>  	return 0;
> +
> +err_rpm_disable:
> +	if (hci->quirks & HCI_QUIRK_RPM_ALLOWED)
> +		i3c_hci_rpm_disable(&pdev->dev);
> +	return ret;
>  }
>
>  static void i3c_hci_remove(struct platform_device *pdev)
> @@ -830,6 +914,9 @@ static void i3c_hci_remove(struct platform_device *pdev)
>  	struct i3c_hci *hci = platform_get_drvdata(pdev);
>
>  	i3c_master_unregister(&hci->master);
> +
> +	if (hci->quirks & HCI_QUIRK_RPM_ALLOWED)
> +		i3c_hci_rpm_disable(&pdev->dev);
>  }
>
>  static const __maybe_unused struct of_device_id i3c_hci_of_match[] = {
> @@ -845,11 +932,15 @@ static const struct acpi_device_id i3c_hci_acpi_match[] = {
>  MODULE_DEVICE_TABLE(acpi, i3c_hci_acpi_match);
>
>  static const struct platform_device_id i3c_hci_driver_ids[] = {
> -	{ .name = "intel-lpss-i3c" },
> +	{ .name = "intel-lpss-i3c", HCI_QUIRK_RPM_ALLOWED },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(platform, i3c_hci_driver_ids);
>
> +static const struct dev_pm_ops i3c_hci_pm_ops = {
> +	SET_RUNTIME_PM_OPS(i3c_hci_runtime_suspend, i3c_hci_runtime_resume, NULL)

new macro RUNTIME_PM_OPS

Frank
> +};
> +
>  static struct platform_driver i3c_hci_driver = {
>  	.probe = i3c_hci_probe,
>  	.remove = i3c_hci_remove,
> @@ -858,6 +949,7 @@ static struct platform_driver i3c_hci_driver = {
>  		.name = "mipi-i3c-hci",
>  		.of_match_table = of_match_ptr(i3c_hci_of_match),
>  		.acpi_match_table = i3c_hci_acpi_match,
> +		.pm = pm_ptr(&i3c_hci_pm_ops),
>  	},
>  };
>  module_platform_driver(i3c_hci_driver);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
> index 38f927685d3b..6339adf4b67a 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
> @@ -51,6 +51,7 @@ struct i3c_hci {
>  	void *io_data;
>  	const struct hci_cmd_ops *cmd;
>  	atomic_t next_cmd_tid;
> +	bool irq_inactive;
>  	u32 caps;
>  	unsigned int quirks;
>  	unsigned int DAT_entries;
> @@ -143,6 +144,7 @@ struct i3c_hci_dev_data {
>  #define HCI_QUIRK_PIO_MODE	BIT(2)  /* Set PIO mode for AMD platforms */
>  #define HCI_QUIRK_OD_PP_TIMING		BIT(3)  /* Set OD and PP timings for AMD platforms */
>  #define HCI_QUIRK_RESP_BUF_THLD		BIT(4)  /* Set resp buf thld to 0 for AMD platforms */
> +#define HCI_QUIRK_RPM_ALLOWED		BIT(5)  /* Runtime PM allowed */
>
>  /* global functions */
>  void mipi_i3c_hci_resume(struct i3c_hci *hci);
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
