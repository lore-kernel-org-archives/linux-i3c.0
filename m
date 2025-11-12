Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DBCCCFA1A
	for <linux-i3c@archiver.kernel.org>; Wed, 12 Nov 2025 15:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=McKZGVNfokJl4e6/hPLqronyXUEpLj8j8ZtCp329ogY=; b=VLpuxw/6fOc8JV
	4bKCFe/LOV3Vof04G4I5Sj/Dzfzd+M1d17fZ8ALAt7w0/Sj5MYTG32hYicRGQyT7WLvHkwoYLdzK+
	8g+bKMLOlOuQz4p1F5slry9aikGPk7BcJH8hH4pC2ksTgjI6aWUA9zs1JHCaMMdRxWCb9/HqkXkPv
	bKc0ECk+wZ5DQgK5FHWTY7+T7TCLwYXxllovkw4DLQxlIYxvCXsCL14Al6lOgc618Etu6WGd4Fq/q
	INhtVr07GprJIPmYr3wcMtohsg6JnwTgJEUAtr/D2hD4YUb9JKHZc73xC/Z7Zpjn8vKMg//cTg/8/
	ahGNX8trRU+2AgpwYT1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDE0-000000098bU-0iC4;
	Wed, 12 Nov 2025 15:57:36 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDDx-000000098b3-3bnf
	for linux-i3c@lists.infradead.org;
	Wed, 12 Nov 2025 15:57:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GanUl9cBi1mQHWnt+cccSM8Ig2D7vjUikmYfvhIfC3ELkonLPf6FCxujg4vPmWo6+7Imm0JZ4hpkrhzDp7S/DH5pXgx23IQLyCTKuYHeQXAVSiQqwf093qQofE8fY1UGb8rWakN2hpakMaViC+yZrnjzU9reSVAK9Dxf0n1mOY1cE/4cXBj4pkdAPWsRJKNRpTOgHWrHB6skE/f+g0bXN1stMNkxxNM7ZDS/jBwRiM9NKuturW6C9NunWUkUY2fiIrfQ4s4FoYDLXXBa1v+dgZDCG0cdBTlNVzFLM2M3lT8QZ1B4VF0zvIlgi3Y2pmHZ0u08QWYnCfxi+q+ErG1D0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BL2pKbUv54C2UotBGyC4X+1YiS2RN2HAOZl+M9WmYso=;
 b=uC+mIArpmsw2KERxGln5CvjdwI3ooH89W7l7bbKL1slIDVFpdnVQWDDnrJIsH5beBaLZ4uk3wAQ+V6tKqaPyYPJk8pQ/ps3BmBpKp465BRVa9qf4km6hRbPn8p6Si6iK0W2c33z0BELWtYIPD7S91k3hcW3YainnXlgLABtLk9qBb+1jem41OR93WGM0oWeULAfN6khSaOO6wsPCC8ZX2ioOpdNfrLVw35FHueefb2X70/EuGz3jnhaAzou0SOZmhwQMWGLAWF7GLMq+lAXz3zp6fCia2R0gMMjw5u0ZJNRVlk/HXgHGPV6nXrFCA/59irJ21LlIkm3UdXP8EGZU/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BL2pKbUv54C2UotBGyC4X+1YiS2RN2HAOZl+M9WmYso=;
 b=R+U53O3NF6V0ghbRUjYk8eK0ZsCzebrp/Xr7AexMLVPjV1aG61OEGna2A3uAEJsTVcEFElNIp8cjbgsxGumjAS/iMNciE1IitWXwqd5PzHiQXgDA0TqlHURB7HqNHWrhgdMm+LXd+pEITuB3J+X+/NRWQFOaW+o/LcqO/4Dd554gmfgFljhJib+fSksEPXKGeya6V4IgdX6mvmwOjXdkGu5/3XjJ/yM3F1E4HKL4zggZ4sd+zeKQDDLimS5XX+Pr7lN+21Ul4RCzsuczmUKm5K2yalX9Dxv7MBx9jPjc09euj6DR3y8EKfOQIQ/cDIA24h7jMKR0nr59cTWLwwkfUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GV4PR04MB11452.eurprd04.prod.outlook.com (2603:10a6:150:298::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 15:57:26 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 15:57:26 +0000
Date: Wed, 12 Nov 2025 10:57:19 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 03/13] i3c: mipi-i3c-hci-pci: Rename some Intel-related
 identifiers
Message-ID: <aRSuXx00hYqbMzIQ@lizhi-Precision-Tower-5810>
References: <20251112100339.51726-1-adrian.hunter@intel.com>
 <20251112100339.51726-4-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20251112100339.51726-4-adrian.hunter@intel.com>
X-ClientProxiedBy: SJ0PR03CA0342.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::17) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GV4PR04MB11452:EE_
X-MS-Office365-Filtering-Correlation-Id: d108e93e-7c21-41c3-6beb-08de22042cb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iJttrjfh/Vabc3e3jQCC4vAun5aL3RmWGn3ONbDn+1sLk15YmZ0vOL9ax3vP?=
 =?us-ascii?Q?A2NivTgyWyO97hsfZvP1UURVbQviLcD5ZDo6JIGrUQMpx/c2ox1ZPcVhdTGM?=
 =?us-ascii?Q?AwcrfZZyj5vMuJ9sNDXII7qPTLqa613aG/Dxv/BAyR2IBiZ5CYtiWXnIL/XX?=
 =?us-ascii?Q?gg0osXoopuHu/PBuD2+0Ru6DPTtKqMaKVTyew6bZ/CR+x2S+ajv3ZLl1WtFW?=
 =?us-ascii?Q?9ZHWn9ARCHPvB55aXjR2MsU88sE1Icsq8mmA3m0biZm7g80doxoqVh86oKnU?=
 =?us-ascii?Q?W0UMrcuDfsm2mM5Ke+4Gw4GpnaRUofQBwHTGOUdlh9cz08QpJVX5tL+hk1sq?=
 =?us-ascii?Q?hIp5QCiz2+8MZG9WYdo6yHAhFEFZ0PXLT3n0M6xk9BUZyTY3bFZ7KDYWbDdS?=
 =?us-ascii?Q?ASiytAY+GPU4EY9Y+CwJMxkelNCKfnKlsqnmHLAv/wfOK9KNMlEpOP9Ue8tY?=
 =?us-ascii?Q?ShyO5Xq5TaVj5O1ocFouE9JTllHIbZO3Tgx+ceni8oEHR+JIJU8Za3/6zFvM?=
 =?us-ascii?Q?I7sRyBvabpSUM+xaP9nJ71jgV55zFIJZk0h3Pe9bJgHvPfegWgrQuVqvFl1F?=
 =?us-ascii?Q?IOPcb6YdDqTRCQAKetA6+C2YId/Yv1fQXOsPl4twxARxqcw0I8OkwbSnoFDT?=
 =?us-ascii?Q?uLyKvSLayB1iJ26lhbwvT3ABzMzVBPZduTJbuZyGC4EiSo8tYC5ve3XgQ+pj?=
 =?us-ascii?Q?kElftBKzJYm6vgNRaM1ZQVKe8aozOpbmAnUEOiIQOUL0vZET4TEQ0/BQ2H27?=
 =?us-ascii?Q?W1afgZbfCshmRfWxilbfXR1kT8JEUMCYsHddp+S0eaXekoxbFna9yOZDcyMg?=
 =?us-ascii?Q?S1wY0ot1kSwFeSNHd7QzAo0ZuAUVOyijNIZ4KszrIHV7vjBHFv+TiqScJLsU?=
 =?us-ascii?Q?Ah52lxgHePRZ/o2VwYBoxqZEA9t8ooK+3s8VD84rReTJiECI2FLv/9sRzHmW?=
 =?us-ascii?Q?ikwzNr3pjnz/jN6krGft60nZCimt1pkwMjMn6GsZDS/KRRDO63Jj4/8NdJFg?=
 =?us-ascii?Q?PL2QwA9llRPNl3futokWqJcW4fSIcNA+4IedZ3v7AVSwitxghi0qhzJ8HgCh?=
 =?us-ascii?Q?1OR9KJ+W4cWrBD8u2shRUzTzI60Ril4Z83FXONfCBDYtFjCNmOKfJiEN6qHS?=
 =?us-ascii?Q?QwpeMKPPpljRr2X0lMISXqsyTmNVzekTTpN6QDd8Q6oKp/L6VVtlhznidUUb?=
 =?us-ascii?Q?xqi0WPCgEppcuROshmWfkYPP2KmVGfK02QQE7w26XB0xdulJc5t0KhrG9TKj?=
 =?us-ascii?Q?nJd4EivFyskXj2fq3rNHiXQD9ZGzp3DswRQjNMqSvf50Pcgx1c3xouLM+5O+?=
 =?us-ascii?Q?rJFOyGq7KpqSDszRSlJ3ANeFNevmb3gQWoh8MSuqKGfCQH8kFapPp6pEVaqW?=
 =?us-ascii?Q?Cl2oR3fuiVTYPD/u26OFead9SZ0ewZ/GU5+30gefj/AEtb8dn8JaDOoHqYyt?=
 =?us-ascii?Q?VLiZdAVjRKFQXZ9w/HJz4rmWmucUeIMhOBuwmWk9az+xY2FzKs1D8H2Wd2RK?=
 =?us-ascii?Q?68bndkaXpfVwdjllbX4B2Hzaa/aYmWGiM7h4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fa7W+IMJ1BTclqJR/0GFzPAMry6kC1vTLM9oXmKDOs1+kJ/e04YhzlMiLDm5?=
 =?us-ascii?Q?96pXDGNF+Des8u/VfvWZKYmb+h6MMgcXlB44WHOy7XyCT8MtmtSUZ+li11Ep?=
 =?us-ascii?Q?paJwFEUxXnb4W8uu2G9X27SjbC2DlXQ/MuR3nP3rGE9bE+++CM9FUvYcI7eb?=
 =?us-ascii?Q?JHogdpvj0vZ1revn1MXeAaUKf1g6UjBnkvORfV/EFjrnta5zlKNC5QHvpHrP?=
 =?us-ascii?Q?rups3A+F79YsVIUKTMIWbdn9qz95+SRdJMSEnZ5pqURv7hrF8OZ2JbeB/E3E?=
 =?us-ascii?Q?0SJDodTiHT/qKmPj+K4NMFRzJyrue9CzmUqvyDtP+r09iWOm3GwwjbG/wlkC?=
 =?us-ascii?Q?XD6UPle22P9y0XC96Slt5JTqJwoAxtRkcCyEKVLtyKaUXcs/rjkPzQNMZdv+?=
 =?us-ascii?Q?rDuaVPFI7VgJW5bmh62vQpIePVU43WBhDPDxyU26gbtzNy9N/r/xro6ZXHWL?=
 =?us-ascii?Q?kMSiooqzugvbk+68RA85tOBePWYwx3B5Apv0obs8kkkgCQBYaXyy+aVF6jaS?=
 =?us-ascii?Q?AW6K4lu7sBHIpTXbUjtx/5RUDESgEtFVd9ZEW56aQ2H8DvqVrGsImW/lj8Ca?=
 =?us-ascii?Q?i3OJek/1iCprv+kA+3tvEiMf2ZyXG8ljzUgzfPaJ4OlejF0FU3r5ua4tX9LV?=
 =?us-ascii?Q?2xgD9w4XATaCtT+yq1/C+6Hd59yGmYgguhUeoaCdLL1o5FJr98v0DRLzTSJQ?=
 =?us-ascii?Q?hAY8xdLq8IyLIZTs7TEuBwMlOWxOcwMFRXKZBg/nWefdlTCNyyw1/70jKijU?=
 =?us-ascii?Q?cgMT80ADO+Vxf/77Z488MEuFJHqhhazsPjoS0flvmazcNX2OZ636spkz3kWs?=
 =?us-ascii?Q?KaP+duX1qLVj3fShJEhN62gBh8Uga6KecfxnP6NG/QbsYWKazKmSiTmBS0Qy?=
 =?us-ascii?Q?dtqAB7ZzTXQreFEAGBK1m3Sc9LwF/PUUiODOT0690Xx3DALotVZ6za7iO2b2?=
 =?us-ascii?Q?pYqHM3kudfM7ObdTfStAX0mlogeZrjnhIXTfliFgpCCl/EbB1EEWCqTl+cuV?=
 =?us-ascii?Q?6hkDsA3FxNj+ptzVJ9jImVZXP+I4TLG7fxvTR85O1/SMfHM2vrpbPrIv96ng?=
 =?us-ascii?Q?7fN1tM1K5GXDqO5gpAMPPBktjlPP6irBV3TYs1tOCj4hN2HasWhiQfPpE7GM?=
 =?us-ascii?Q?WjiQSx3ZnvC+Yy2MHmgkaN1j4tJs7/nKIArd/UfOWgGaayUcxK8OZxVzcYIL?=
 =?us-ascii?Q?VG1ZfWrYb1oGItcppg3pWI8V02S1Jq6oZbC2YfCJ7D/T7CSCOFOAQKj0eLgt?=
 =?us-ascii?Q?utBxftFH7UUGoUZ/r+sEJS0LwG6M63UNhG+HFUZZbjfUFOVzbBBcnX303N/q?=
 =?us-ascii?Q?i99rDeRx6+MymK3UpZ3JKG64s2IOhBVQWpl6L0dv57eq+I+hEVmxg+KhBCU1?=
 =?us-ascii?Q?Hli4JR6eBXE9HqqVFKyFLy9Y0ojJicSFMeHG77QRO/3Az7PSk1jVai2gJrwZ?=
 =?us-ascii?Q?9nJG60FG1EYbFnFqMH479i7zDAh3HOJU2r4Ez/RhMZWX/MhI+6CmjVZYn5FG?=
 =?us-ascii?Q?O3+yAigER4j//zuUV32QL0cC6KxCIdr+xKVOlcjIMpvMSFAN3pjanyj5OKth?=
 =?us-ascii?Q?SaxmGMwC6NgUbhkcfmrRW9+WQBjAWy8omVPFaHGz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d108e93e-7c21-41c3-6beb-08de22042cb6
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 15:57:26.0032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sb7uQbZ2QARalePsQK35F23vRhQnlsVNKKKSKtDDrCpYRjnrG0p9C3k+rVu4cNagPo3D2OYZupWbRM+zk7DDwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11452
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_075733_932418_15352D1E 
X-CRM114-Status: GOOD (  19.14  )
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

On Wed, Nov 12, 2025 at 12:03:29PM +0200, Adrian Hunter wrote:
> Rename some Intel-related identifiers to ensure Intel-related identifiers
> begin "intel_" or INTEL_, and for brevity.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  .../i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> index 617826628dc4..c74cc511a344 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c
> @@ -21,11 +21,11 @@ static DEFINE_IDA(mipi_i3c_hci_pci_ida);
>
>  #define INTEL_PRIV_OFFSET		0x2b0
>  #define INTEL_PRIV_SIZE			0x28
> -#define INTEL_PRIV_RESETS		0x04
> -#define INTEL_PRIV_RESETS_RESET		BIT(0)
> -#define INTEL_PRIV_RESETS_RESET_DONE	BIT(1)
> +#define INTEL_RESETS			0x04
> +#define INTEL_RESETS_RESET		BIT(0)
> +#define INTEL_RESETS_RESET_DONE		BIT(1)

These are already begin with INTEL.

>
> -static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
> +static int intel_init(struct pci_dev *pci)

intel_i3c_init() ?

Frank

>  {
>  	unsigned long timeout;
>  	void __iomem *priv;
> @@ -42,21 +42,21 @@ static int mipi_i3c_hci_pci_intel_init(struct pci_dev *pci)
>  		return ret;
>
>  	/* Assert reset, wait for completion and release reset */
> -	writel(0, priv + INTEL_PRIV_RESETS);
> +	writel(0, priv + INTEL_RESETS);
>  	timeout = jiffies + msecs_to_jiffies(10);
> -	while (!(readl(priv + INTEL_PRIV_RESETS) &
> -		 INTEL_PRIV_RESETS_RESET_DONE)) {
> +	while (!(readl(priv + INTEL_RESETS) &
> +		 INTEL_RESETS_RESET_DONE)) {
>  		if (time_after(jiffies, timeout))
>  			break;
>  		cpu_relax();
>  	}
> -	writel(INTEL_PRIV_RESETS_RESET, priv + INTEL_PRIV_RESETS);
> +	writel(INTEL_RESETS_RESET, priv + INTEL_RESETS);
>
>  	return 0;
>  }
>
>  static struct mipi_i3c_hci_pci_info intel_info = {
> -	.init = mipi_i3c_hci_pci_intel_init,
> +	.init = intel_init,
>  };
>
>  static int mipi_i3c_hci_pci_probe(struct pci_dev *pci,
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
