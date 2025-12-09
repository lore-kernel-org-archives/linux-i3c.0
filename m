Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885E7D3B983
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Dec 2025 16:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oj4ObBqImVyA3LIi0TkFP9ZUu+0NOR0pnxx2PxAene8=; b=4pi7c2oX0o+yCM
	b2toUbZqypAMQ28LvQJL8ZmpJgJKlw94Dxs6eSLtQVjVAWdxXkFLzj/WNoJzT70JzXVsFqxd0FuKV
	MCNYFuSTrMpxM0fePxOoorKXlT2qKAmr/RAvXtbW9jIm2U+zaggxIaOQkOPXpDq2dotBF0JB38cV+
	wEaFp9mOGPiCjUPDzfnAsu02HjyH9QmKbwxqSM2A2ey72ggTotJ6250gLy8m1cxnyZ4OHDquqifAP
	yaPS+RQ81gMvIsR/v7cBa1P7yhuulkvqSOeMP1mA3DxQvWz2Oh3lj4uh6n8fvseQR+YTZqRbMnLxK
	4uK1teRGiSQF1g+Cgh/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0ht-0000000EY7Y-1DsL;
	Tue, 09 Dec 2025 16:36:57 +0000
Received: from mail-francecentralazon11013005.outbound.protection.outlook.com ([40.107.162.5] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0hq-0000000EY66-24KP
	for linux-i3c@lists.infradead.org;
	Tue, 09 Dec 2025 16:36:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tg2zvdXYZTRLf8x2zitnOXCuxN51L49OfdufM4J2QYp1TeTp9cZtRWYbhLchZSgKqoHaCyjFY+f5ivQiuK3gbOIsAIaMJ0B08qaVKZtlLuIgNrm4+aNk/d94OTRXI4VhCC3CpZ+p9Z9leEbtYcS2MWUMxTtRwhJk6WeUOSa0Dh97BO5PHrucEuAJVY1fCKRhbh638kjY/P6xFszp6JDTDaoaHEucERruqjx9gy97j9IaCatemafVxvzFlJ4m4tBiudYQ8qZLiLDlndcXZbb8NHJQfWeH8HLM3V6oM1Z4SrP/thgLAy+qAQico5Uwm6XkBu105JpZ8diLSNTjp0juzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOd0jyN9+kJoGnxWFJlX6UKAFikom1FKWf9lqwOiQyk=;
 b=RvqDksSUMrhxIZG5H9clphBwNZO2GIrK3Vd33d9Hkcm+6NtvEBNmTd//6jQnIdyvnC5rOJQVIT8v6KHNrxLnuYuKhGit1CHHjTX2QuImx2M0MsqD/kq55PA+gmgTTKAk/NxzXxDTDh45C4AihhunTEjiOdHm5sYMKHtxu52etVmO+A3GfrH4z7yPjnfZElqXiCuk3Zep2MTElCZEx/lbGRu1J7AxRbiU9/7O2/fylRTQHSEp5wtVgN+N2qDuh05lsGaCS03taRs6fteY9BvYi0KZMFlsOiYgp0tY0EqPNZ563D4Pvvkgo5X4duKGD7T7pL5t/CGOKzN7oBSfTjSdOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOd0jyN9+kJoGnxWFJlX6UKAFikom1FKWf9lqwOiQyk=;
 b=TCh7SBMQuimWIHuLk9FlhLsS3KG6464F7tLDbs/DJ2VJmjAHr/+5wXndkMqnd/tgovqH/OEfMs3zSZmWcUnmfi1uIJ327WgxyZjR5gtzsPuyfpnrF27VXNVHShZI1a+68StvzECChepp/sQr92/2vMy9hteb5A8Ttu4YsMjB6EPX47LLV43wOeIVYb9gY5BWnVztP012B2EFRz6BIJx+XO7133398/nQ/nnpwTyhxYXajIZJDdv9ETqjg435bLOjXueI5RTLXReJXdjdhQEEtaLsmh6vRYJk3AntAHNC9zzCTrygE1NTJvRekI00n3rWo3YCBB4nSHihqRnKKYchBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU4PR04MB11313.eurprd04.prod.outlook.com (2603:10a6:10:5ee::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 16:36:50 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 16:36:50 +0000
Date: Tue, 9 Dec 2025 11:36:44 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 5/7] i3c: mipi-i3c-hci-pci: Define default driver data
Message-ID: <aThQHLHCxp/SU92N@lizhi-Precision-Tower-5810>
References: <20251209115104.124156-1-adrian.hunter@intel.com>
 <20251209115104.124156-6-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251209115104.124156-6-adrian.hunter@intel.com>
X-ClientProxiedBy: PH7P220CA0149.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::19) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU4PR04MB11313:EE_
X-MS-Office365-Filtering-Correlation-Id: 79512b15-7f7f-45e6-be7f-08de374126ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|52116014|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ua3iQ8Cl9NSSy5oe4jcmmrxBp6nmMZbNzODfA0YYasp4CKxruOfrb0Eg0SSb?=
 =?us-ascii?Q?L27rYHqMds8DH1/sgUdY9CV2cZKzc9CZxiSkI12B41JjROz/rCzmoX9/thgz?=
 =?us-ascii?Q?Lf1dHOMasixnV5dNkL/HdZGn1fBkd84P9R1/SDjFCwUlC6dqujIYLkrElpvM?=
 =?us-ascii?Q?GQ/czxUibIRmd6erM8S6yDqWUHHyJ15xLwYfVp/ypV7ASZuIlM1bwjvURCZ4?=
 =?us-ascii?Q?gDHuyswZipLW4rFzVPho/byyjrrnWEEjEd/RT1rktkuL5Ewu/oNigrjjZVgO?=
 =?us-ascii?Q?3mb97VidPFYMhOq20Mekl6vzoAOeUXWXohx+AbEtc3BQNdQT7/m7eB5yowP7?=
 =?us-ascii?Q?2qA1leXiIzfplj3S6NnkUNcXFqbuYQW013pgUNhzHxRaPYUS/AzvEHMeKm00?=
 =?us-ascii?Q?Ns4U+j4M1rAN2+OmzbZVxO7H0HtIqDmB/Rhgsd27XeOa0dl36wBffJbsKQBr?=
 =?us-ascii?Q?wOQwS+d874HOxO9iA9JOeHKlxtSx4pKbwwLYSKfS2KJLMn6s1il1A96xhoLj?=
 =?us-ascii?Q?FwF5hGVK3EFKqLBWW8uZ0GL0f3plGkt3Io3ufjxXz3mtWiyMZLlbN22kdKub?=
 =?us-ascii?Q?llky0E9VlnuuJAMhJ0L4n/Bf/5hN+Um40mjclXKcba1QLAGQcODqGQjDjNH1?=
 =?us-ascii?Q?u/k3yEmmW4+0nNTcMFWo5dTRAWMivIUCnTC+4r8FxNe/5tzP8imZX+7sDefH?=
 =?us-ascii?Q?v5MeUp9CabIPaRtkLC+wVTC5WHbuN/JykEyP0Lh1gMMprme5qt+XGnmSC++z?=
 =?us-ascii?Q?K2H/pGr60wl2t7yedPIQSHl2/a9a5gc5BulIyPjUBHy6pCwk5iO6vBgCXES+?=
 =?us-ascii?Q?+AigsMUn2uA9TWqOztAEZInEuIEjGVOc2IojPRfsoeJs5mIJNam5yhzkDjes?=
 =?us-ascii?Q?HHFMEWvcINHlvHUmbrxcsy0tqZZ+RGB0KbtknTCBFNCrXGmNMClpGlmM0sLJ?=
 =?us-ascii?Q?M/6rWIfekLefbonHBJhVn/J2umhMyl3nh4uLhAq4szsVBem7tzll+A3SGl0n?=
 =?us-ascii?Q?4d/TGOyHhYhj1akTrzTCikudWY9yR38AZTjRXSlH4qinTeecQJJ+MierTyoO?=
 =?us-ascii?Q?Gj0XRF6zEqIE80C5JjtgVkS/mtAPmYQKnZlqNYbMJJGZrhW2EdDf8ozcAvKw?=
 =?us-ascii?Q?FcMbRUAaaJc9SZygkcuznh2wtqi9l7WqIB9E5nbJJjU9GLHxW7HMFxrm2ImJ?=
 =?us-ascii?Q?bqORYAJuOsEFA0ymsIMoJiue7w0d8TkzxQTRZxx3kvJa5IA8oRKGDPpe+eEi?=
 =?us-ascii?Q?1lwv31ToU9VVQGy9YIcwg2a9b0j6412ZI0R7a53vGBUl4zpAt4dFCDoQppXw?=
 =?us-ascii?Q?1ujsZkk2HMQ/M+iznquMBcVa+yJkY7EBSh0e56MGRMUWfdQszEc6dLOVwmQ1?=
 =?us-ascii?Q?eI/jaPYKhqU9zHT/wayANuodlPRwB0RHqG8lMjjN+XHZvfr9p9K/XYlj+mYt?=
 =?us-ascii?Q?FxK0zslzB4WiGuo+P10nST+8jAPQNdkmWE28g8CGOvyNl9c+ZmsFEtfYRi3N?=
 =?us-ascii?Q?Ts5i0EFP0Gnu10/XJZvNO1SwaXzTyPiCldRq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hibWIKMbmiBlIcAbAOyIhAGgF16BFONe5Crtm/Xdo+Ffo9H1T6sW3y9Y9vTc?=
 =?us-ascii?Q?aN5+CIHv8DrN6Z8hImf5drUaY5wMKc/sDApqiC+q4u7bYkhzPRjMpf8bO3ih?=
 =?us-ascii?Q?uIiVQ5OwiBq+VguZAAXxp5YEAj79tFvF5JAseoyb5FJJieZOYvDZUgzwErP6?=
 =?us-ascii?Q?clI1n54MDkiMQHCELOUZdm5easV+O5zhjYo7IwBpRqdItLDBgczLYo9XocEL?=
 =?us-ascii?Q?1hDkaASc9j9ccLPesKkPk0h1su8Unlp9X6IkOJjTRh/jEj6keIyZB7GJEvzC?=
 =?us-ascii?Q?k7GQubAFw2ZBfz/GyH90Q7VO5j91ddkpEkNIqg4KmBnJIDuGUG1bMSpt5oDm?=
 =?us-ascii?Q?RJyaD5crhJbEpY2wtdBcTp1Na4JSrlqU7OR8TtXzHS+/170s2d+7eJwoSWyN?=
 =?us-ascii?Q?DLLJXUEUppYkHCQUzAziCgUcTpMm/zbcjpiZrxN1BOfWWRoM0YavpOwbkXtA?=
 =?us-ascii?Q?UHhUrnEWqzsbaXDlJ3jrRDvPczox2QDoUw57SdmI/SWXlJBarky5XNQqciUs?=
 =?us-ascii?Q?AHiR1DuJssJFXgL/bJ6KLbxXObujYfv7vKn3V1BDtj95INJYWfbtp3rH1mP0?=
 =?us-ascii?Q?5wL+H6L8z9xR3yIu0VdkbTruzRVZGbteiNrntw2m9VDimGnnNtCmTh5+oxqx?=
 =?us-ascii?Q?BaBj1L+7GpmqPB3E7oLsN6ZCA53plvXI4GiXdm9j9WaOBeUDs2HJfXqNF+8E?=
 =?us-ascii?Q?9BwlQBKlt6cqkH2ktpXcJ9OHV/mT3qU61qBEzxQVnPvCqoXsnvHhzn0dj1Gn?=
 =?us-ascii?Q?FdDK5V1HgDum9h4dCfQ8gbTKV1wYDrk4/zTeV4RNh5AFlOEuGHPzzotHXmd0?=
 =?us-ascii?Q?28TEqPLefbXt0rS1mlbFghDwUlY9Exg6NvRO6PORc0SSz+gXtStBlNsGpNz9?=
 =?us-ascii?Q?icFu3DOrxmZpF3mVfS3huFZoTwS+6iByLbBEMAqUzl3GbCpBb48xZFdZhCA7?=
 =?us-ascii?Q?xSeeHf+YUAXNN6+EVLQ50VoQJM1Uoo0zj3wA4ea5yrwt5BN7Z67tsVAkv3Cp?=
 =?us-ascii?Q?X3JT1t4pAgjGlW+lanEUbpooBuvpTf+WLy3uk9P7eniget62VSDJliELxkOj?=
 =?us-ascii?Q?p1ORzvdtg5iNJlwD4X1o5WNoxwcsdv3pFTLReXKYJDci12KgV5Q0ADjFgyYM?=
 =?us-ascii?Q?YwYmXN56ewuY6TWH3RfXS/EbAFGIvUYznDGJbbk+qBZCc1ayUNiQa4QMriX6?=
 =?us-ascii?Q?ewpHLfdtRlzhWgZtAvGkYJ35xZ+L4OyuHkzh71FxsjDwwvxXN8YeMX02z5Wx?=
 =?us-ascii?Q?sdeFBJuqlvp4/5oDEYzRmRajSh2FP6ehEbthpp1fQU7c1FhXuSKHo/N1T8Ab?=
 =?us-ascii?Q?5WDxaPdR3iDm3hempI4I79XsuogMlFcQV0Ku5+6LjlOFsbPx/lssxfagpGiF?=
 =?us-ascii?Q?OiPppsC177Zuo/4obgKf3nVUDpZhtVGIP5TqnzGlBeLeP9IsCHnn6H66/Mfi?=
 =?us-ascii?Q?bhgMq4qN89rjnvC1BUItN4p5sXpvJMZD0joaef0XTXWmBeYTrKUcjE/tDstA?=
 =?us-ascii?Q?mxhU8FriDaRq2NDpMTpOtdy+y0Lv6lIUZqerknEA9zcnBz2Z0TKDRnTqrN9q?=
 =?us-ascii?Q?+bLijUJcriMyHGzKxs8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79512b15-7f7f-45e6-be7f-08de374126ed
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 16:36:50.0822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3gnD44tevGQe7zTYHFwvpJh63CM38UhDHsNoGeP85vkeDH/Lwr/u6lbuzG9fZ6BW8PnzlwBodJgOgh95pdbQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11313
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_083654_539936_5DF3714B 
X-CRM114-Status: GOOD (  19.29  )
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

On Tue, Dec 09, 2025 at 01:51:02PM +0200, Adrian Hunter wrote:
> Define default driver data, to save having to repeatedly check for NULL.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index dc8ede0f8ad8..ccaec5d3d248 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -184,6 +184,9 @@ static const struct mipi_i3c_hci_pci_info intel_info = {
>  	.exit = intel_i3c_exit,
>  };
>
> +static const struct mipi_i3c_hci_pci_info dflt_info = {
> +};
> +
>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  				  const struct pci_device_id *id)
>  {
> @@ -228,8 +231,8 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  	if (ret)
>  		goto err;
>
> -	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data;

I see all devices have driver_data in mipi_i3c_hci_pci_devices()

"
static const struct pci_device_id mipi_i3c_hci_pci_devices[] = {
        /* Wildcat Lake-U */
        { PCI_VDEVICE(INTEL, 0x4d7c), (kernel_ulong_t)&intel_info},
        { PCI_VDEVICE(INTEL, 0x4d6f), (kernel_ulong_t)&intel_info},
        /* Panther Lake-H */
        { PCI_VDEVICE(INTEL, 0xe37c), (kernel_ulong_t)&intel_info},
        { PCI_VDEVICE(INTEL, 0xe36f), (kernel_ulong_t)&intel_info},
        /* Panther Lake-P */
        { PCI_VDEVICE(INTEL, 0xe47c), (kernel_ulong_t)&intel_info},
        { PCI_VDEVICE(INTEL, 0xe46f), (kernel_ulong_t)&intel_info},
        /* Nova Lake-S */
        { PCI_VDEVICE(INTEL, 0x6e2c), (kernel_ulong_t)&intel_info},
        { PCI_VDEVICE(INTEL, 0x6e2d), (kernel_ulong_t)&intel_info},
        { },
};
"

Frank


> -	if (hci->info && hci->info->init) {
> +	hci->info = (const struct mipi_i3c_hci_pci_info *)id->driver_data ?: &dflt_info;
> +	if (hci->info->init) {
>  		ret = hci->info->init(hci);
>  		if (ret)
>  			goto err;
> @@ -244,7 +247,7 @@ static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
>  	return 0;
>
>  err_exit:
> -	if (hci->info && hci->info->exit)
> +	if (hci->info->exit)
>  		hci->info->exit(hci);
>  err:
>  	platform_device_put(hci->pdev);
> @@ -258,7 +261,7 @@ static void mipi_i3c_hci_pci_remove(struct pci_dev *pci)
>  	struct platform_device *pdev = hci->pdev;
>  	int dev_id = pdev->id;
>
> -	if (hci->info && hci->info->exit)
> +	if (hci->info->exit)
>  		hci->info->exit(hci);
>
>  	platform_device_unregister(pdev);
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
