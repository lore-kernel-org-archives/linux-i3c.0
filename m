Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30E3CCD1BF
	for <linux-i3c@archiver.kernel.org>; Fri, 24 Oct 2025 16:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oobcNUsLSgnqQcfAj+XR+6LwcLGUluy5hKPK5agrXSU=; b=opTXEvAlX7BcL+
	+BJ3K8XpYjj0ZFJj1DBsRw7l7G3/jfsoVoUtLSYvXJhILRpAjwg58j0bymK4C9Ng4VGWa2DLSiXGD
	5b2IK0SjrgWNK0LJnxTwOh6W12+xst5XqWyi0CDN5DCecciyD5yQ1HgkNOEpeUuCUdFMQuiTZXBPf
	KdU4UuoWmrWLfUoy0tBnbtkisz3a+8CNmIijx3mhX9QupEfuY3J5nMYlV2tUHoIli9erLBvV0z/+z
	LENHy00drdN8iiAdzqc6lssWjlJaBwmbS9WH+pgC8JG99eYG3T8RVlXF3z+bY7dad5bXiKg4Bcj/p
	HHgg1YMN96iAGHWvAEuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKfi-00000009yc4-1kdk;
	Fri, 24 Oct 2025 16:29:46 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKff-00000009yZl-3Myu
	for linux-i3c@lists.infradead.org;
	Fri, 24 Oct 2025 16:29:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6vqEMIIAmV3MfWS3//wWXDnTCb/BiiLmMX4fQNavTh/pK/qnBtVDO6UKowpqG+4gzyKcyCAJ8WovMQTgbmemZupci4UBhI/KTEfd/EAgd3yXKAamv5WsQcfyzi1ErR1IMGDpfLBiWsgRMzCNZQCkUYn9FFNgj4Ik3FJLmfzgvngd+tRijLr4srqG606HNPeEIf6/wJzl72mido3i5tH8NrWl3IrOMEy93GBW5FgaV/J24grkmCz08OZLBxqBNp16VWohCOpTdx5jd6GYTeb8sObhMzmsqT00aorXUBf03icm+K4CyhJDWpbFK0XGLcGcK8HntBIJhsPAvwWd59gAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxVyewu4XLOAehqGxeNZz7fmE5mpDYcPyYPuacZk40E=;
 b=mR10k8RbFzKKz652BpseJ8y6ydS1MFDgDePOgJBqfUhsuCzopdyxgOj/gNplI56RibjLtQekmmaF5KCeu9KSb0xp5YlGeRYuondNBbhYGlkBUquV9SHrtdGcTts8ohR6lYcbfgnuH7hhX0srH2YRqHA5CeGux/s7UHpeWmKvalhFkw0m/kYUVeLrT6EOuOiTeURoesMroL/JqvIPy+WmU3Yw3iVl88Z1yezGnupfPu2Q1tfZyUDF+I0Ku4cKyMAJuWwU7CRlcDIHh8tv+hWljewlmuZNq6UVMWEofazzjUN5I9OzzkKCMxYKjPclyR+QF7PvMseSOO0MYYJCmxmSkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxVyewu4XLOAehqGxeNZz7fmE5mpDYcPyYPuacZk40E=;
 b=C48vntO3tyjOPhLLxZHs3jZw+vHKZosDwE0fNj5qJNbyGBSiLZgD8uk7zKlz2EF9DFOdW851xHh7GgppY16ToHo/TGHMY/Nqbtt6jpRhz1xCvGyCibj8nVOJsDlT7ED9QVYj27YInWbjh2X5tEADsqJ8+kXR9X2w6OEJFCrGSpCx3UQToFR2Z06cVkIRcqNr+sxUi10ag8tuN5tb09uggP+9sk3MKJviIvv62lDnvFE0o7f7LikA/K1fvrD/0r30a+xCDbZf/ecc9QhTbTTw5wspMiOvN770bA2xrZiGwLchcyl94fu/G21LVXD7EqaXUq9QJ6PmXMZFopnNp3+i8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GVXPR04MB11498.eurprd04.prod.outlook.com (2603:10a6:150:288::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 16:29:37 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 16:29:37 +0000
Date: Fri, 24 Oct 2025 12:29:28 -0400
From: Frank Li <Frank.li@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-iio@vger.kernel.org, joshua.yeong@starfivetech.com,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/5] i3c: Add HDR API support
Message-ID: <aPupaHEZM20Q8aJu@lizhi-Precision-Tower-5810>
References: <20251014-i3c_ddr-v6-0-3afe49773107@nxp.com>
 <20251014-i3c_ddr-v6-1-3afe49773107@nxp.com>
 <aPnmCwwZVZ5egqkP@smile.fi.intel.com>
 <aPpHTej/vKfiN68k@lizhi-Precision-Tower-5810>
 <aPpyf1xPmU_koEXH@smile.fi.intel.com>
 <aPq/6/+63sHuq/qy@lizhi-Precision-Tower-5810>
 <aPsZB44qXR77jNHF@smile.fi.intel.com>
 <aPuHKs3u344zoI2+@lizhi-Precision-Tower-5810>
 <aPujXUO2h5zHy2fj@smile.fi.intel.com>
Content-Disposition: inline
In-Reply-To: <aPujXUO2h5zHy2fj@smile.fi.intel.com>
X-ClientProxiedBy: BYAPR06CA0025.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::38) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GVXPR04MB11498:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f189c9c-178f-4b8f-52c8-08de131a8633
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?hL0iagA0xmqXBYYTYjj5tu4QfVoW4jAZiXZy0ECZEdph+PTNlFir1mN6yW?=
 =?iso-8859-1?Q?jNHusFErUyTUkM/R8ekdGKAHIdxn3nHy7jLyqBM5pVHqw7XskHtzbsHUid?=
 =?iso-8859-1?Q?v+AY2gFJNh/fNmnJkk4g2O2LLDRITv37v6SHK3lN65ixQecv8mVLrqHOSq?=
 =?iso-8859-1?Q?N9OPFSl/9rCMgAwu2lJ02jyIXCuQTnnZlom8w81YvPie9b5q5XWLzcdZVb?=
 =?iso-8859-1?Q?GgNXzxhXo38VNDyawFCa14H/VupaADZmWXjAS2h+X1a5/Nj7eL1ZQ39icW?=
 =?iso-8859-1?Q?uBNsQZxihq0Tz4SRqYHihrR2gNsQ5fTnDhbLs1npyjHQGOpOuuQ0GnozqF?=
 =?iso-8859-1?Q?f2RX/5/f2IspJ7YA9Y88nWYenj0ClHth4TCrT8qkmuWe/k949Rt0Qh06pd?=
 =?iso-8859-1?Q?H3D54dUgDsOIa+jYx4HfRjJvhjHEhfSQm7JJxPgM5cG2VROtyoi2JYK6hc?=
 =?iso-8859-1?Q?8Id6hPa54gKeqvAnXDO2NjBKW7RUIPSO83YHgTVsBWh3yX7lWVmhQAIY1m?=
 =?iso-8859-1?Q?CI1N7JwOqwmCNhsMs6VEnpikXKqaE+dONlAo2sHz3MwPxtpKm0C5LpLL11?=
 =?iso-8859-1?Q?dsrbDljjfSQYrx7vJt/rEXicU2eg/RTHS0PicIo0p4cIn998wNuHWwvXIS?=
 =?iso-8859-1?Q?vPKZifswmITmxKuVtDpCjJ6NAKulMurND+Q2klHgjojt/p6LyQx1DcLcun?=
 =?iso-8859-1?Q?0SZE3nuJmN4QU8LMgEonM+IBnbD78TgI6+ELjhkXIqU7lTOdEfYV6zGi6K?=
 =?iso-8859-1?Q?mWxq9rRsD9lpgnhgZF0DI1SB9Q3elE1W05R14sWQ7OnNwOVF8HdOwV97Cc?=
 =?iso-8859-1?Q?5nGfPx/rrJVoPwHzxH/wWclbREluW/V3R9nBfA298OkzDGOyugcNtfwkwz?=
 =?iso-8859-1?Q?wqdWfxF+ErIke+xTF0JqG5R6hI0BMb2HRGilHipfgIG0fRctbpQPDBI/Rv?=
 =?iso-8859-1?Q?XVorYpughpMrDNYIecagmHYU5tlwOqqDLUaNZdkwoTqolresnaxRicFy3f?=
 =?iso-8859-1?Q?ml3ZRhj0qcfiQNWrpyHWDegQKCsp8FrC59j7XcGBeTbWJJ24JWbkNRlDQk?=
 =?iso-8859-1?Q?ZsaSXIoGpFEN2vr16EpB7Wm0e37cR5aShAZhP/yjEbhd7H3A7Imm1zfYxA?=
 =?iso-8859-1?Q?84EKvsW4TXXOo5t2niUGEcc45kTOUVpMqj7dXsu20qx5RsyHMplnppuRQq?=
 =?iso-8859-1?Q?iS9jZqeHnqYXf0CfZUB35yQ3Cr+qDTiGObuLYb8ESv9gInFIBmz91fHEgk?=
 =?iso-8859-1?Q?hQskfqHQm8FnmhT8SA5TiOA2ChjtTWU3zqdDjkhrQjlBE+n7sRMXJh67G5?=
 =?iso-8859-1?Q?CDaUO8RXJLjWPvlbve7KlY210iCeExJmjRHeFQIKRndYLhVepbg0GCPGeW?=
 =?iso-8859-1?Q?DE9ghUPDwGJJ2g43X14QzsOspqc+cjm3lHICzX6eXVtLKwwGuXCB9kttIV?=
 =?iso-8859-1?Q?eG68uBbnt6eMj9wJILNRjQf4bDrsd7J4ysMp7KJUiUheYuKOmb43YVd47E?=
 =?iso-8859-1?Q?/i0533t6SvtuMyEFT/7y7kW+pHpVWzuxpyiuBN+SQYguy7NmiDkN5CBo3f?=
 =?iso-8859-1?Q?eF8yOaKJrd0CqaycTEjfhh0kXc4P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?k/5KpgsjL4rOTO2p/eDEkDwgnXkayHOYEzTf2pw8vNyNqHRR50eG1S80Dh?=
 =?iso-8859-1?Q?D8FqABoCMRniGh86Em0L0Ud4+YEaSTqGL5LQJGX9nPaC5FeAHcGrJUc0+A?=
 =?iso-8859-1?Q?oZ7fEDTD9w0/eFoMPVVNZF/QxDtCu33+ySKpD8kRTkMFMa58k69ST8iuTj?=
 =?iso-8859-1?Q?dAhKYG+xcovT/qkgriyi49m9n4B+xE+TcKmLY0xsjtEN4EgXo6mTCpQfpQ?=
 =?iso-8859-1?Q?GOS+QqAtfJKte05QfamBRaSTgILQqhJIRaG4+w0lmduKary541XnhDVNY7?=
 =?iso-8859-1?Q?EmwHKvpQvB/yN0PmSTeEoP6u3XFXbhjdRqmtuoX38Qa77ZP0I6e7DJ+0zE?=
 =?iso-8859-1?Q?CKRN4Tu/YsDUYyMs02yV2SWPXLeTWIdDU0gFVjDQS3HqL4+jwg6YJxmqL6?=
 =?iso-8859-1?Q?kWWkzNqLa8SlmPNs6vcE0ihBLr/HlolmnpUlRgIfu2jOuItJtqMXwM4SEF?=
 =?iso-8859-1?Q?Gw0bZP1IsGZ06glP/JT6owHc86ddXtK0zf6Ohn+WAbQutednu/C50UzUnY?=
 =?iso-8859-1?Q?J4hv7Yk8rfWZj1RwDnxJWXmswpTys/23891gkFLCaIwrO4gIs82b8ZOonh?=
 =?iso-8859-1?Q?R/MK7wCLgqMJhECUEOrOZFR+pflHtaMghGXf0HnGFDOHedlgJoar3wriTO?=
 =?iso-8859-1?Q?Gjz8lYVfz1F1KtfoFCzT+rsIzJnUU+9YPSBhyMGt9N+A0jNePnG7zN7oHU?=
 =?iso-8859-1?Q?LZtIDvWdy1U6gQU51gsFlDP/h8ZM/J8XIbvFK8Nsi8bVY9uDS3FRImLESX?=
 =?iso-8859-1?Q?BTkNE+7NXwW1p1ZP4FF6Et1Lpp2iYfae25BfMbYKOhz7zlRg33i/DP7QT3?=
 =?iso-8859-1?Q?gjnqhpDFfqmDKAWRAHXYHyK4c8I63NQO2nAEh1UV7ddCzP/j6SfTxZhEfI?=
 =?iso-8859-1?Q?/XJKWb8id2sRrX4FT/fttlQRh0o/Rv/xxK9rcmIxvaL9zCigL4hRpENMR9?=
 =?iso-8859-1?Q?HkquZ2DopEfy0jMCHOV7ax3xtaoZul3yDrr8aVt6ZPl6mfJ9nfBNst5XS6?=
 =?iso-8859-1?Q?yeKAf1PUzT8JTua86nOURzJdU8sdsxTKSq3UQqCzuugwvKju88SIOp12cr?=
 =?iso-8859-1?Q?oE+aii+Ph9z4ytzkqEl7VitS71blREIgfY4W0B7qwzjaFIsENGbeFdCYn4?=
 =?iso-8859-1?Q?pJhomBqV5eCIXFWoWBbidhXdOB9YSBqpMTc5PrNlQ8zlgWTe7dx+kyZTOn?=
 =?iso-8859-1?Q?APsuXJ1vjbzxzDA0Xj96+Oz+YaWSf0884zR/iNtOlEgWraqUw4OkgMcO7+?=
 =?iso-8859-1?Q?ohUgoZIWKWHjm106w8rG213sdBAtbhXx4hdWekRF3vWAePuVY6mvdTnTJ/?=
 =?iso-8859-1?Q?174Q5/gU98Qxk3rYu54MnE3NK41Gab5ODSXySfvGn2e6E1jKaGPbHXnNz8?=
 =?iso-8859-1?Q?LHu/tWrMPqoUFAEjUrdE1B9kVQCYOHovQZzirWImD0vQWBPZdJnp0OYw2s?=
 =?iso-8859-1?Q?ExQPyMUoL01wIkAyM4jdVjndRQyDQQNDcgTdjlt+slMV+rfpm25gpOqTtQ?=
 =?iso-8859-1?Q?U2gbq17HToq3YLd6otN5CHRHgqPkB33xXCCtQKRYSFM49FbS8BdN0NRjCJ?=
 =?iso-8859-1?Q?z7ASRzXuqxvg4TIyBjnKVpPVgc3r93BeMUSZa/uAy+nUCFJeXnoKhDYbpj?=
 =?iso-8859-1?Q?VmIreKCUE6DeDf6TOU1ksqY3VTt4ZCJQMP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f189c9c-178f-4b8f-52c8-08de131a8633
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 16:29:37.6950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +RvI8Q9tW8Gl5Qt3qtKahA0eAYlpiD4hfuLPeIFIWph5B6x87cinl1p1oH70dyPk4//Hsm2da/K3csAQ/Nb1vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11498
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_092943_997020_7628A46D 
X-CRM114-Status: GOOD (  28.95  )
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

On Fri, Oct 24, 2025 at 07:03:41PM +0300, Andy Shevchenko wrote:
> On Fri, Oct 24, 2025 at 10:03:22AM -0400, Frank Li wrote:
> > On Fri, Oct 24, 2025 at 09:13:27AM +0300, Andy Shevchenko wrote:
> > > On Thu, Oct 23, 2025 at 07:53:15PM -0400, Frank Li wrote:
> > > > On Thu, Oct 23, 2025 at 09:22:55PM +0300, Andy Shevchenko wrote:
> > > > > On Thu, Oct 23, 2025 at 11:18:37AM -0400, Frank Li wrote:
> > > > > > On Thu, Oct 23, 2025 at 11:23:39AM +0300, Andy Shevchenko wrote:
> > > > > > > On Tue, Oct 14, 2025 at 12:40:00PM -0400, Frank Li wrote:
>
> ...
>
> > > > > > > > +/* keep back compatible */
> > > > > > > > +#define i3c_priv_xfer i3c_xfer
> > > > > > >
> > > > > > > How many of the current users do this? Can't we just rename t=
reewide?
> > > > > >
> > > > > > git grep -r priv_xfer drivers/
> > > > >
> > > > > `git grep -lw ...` is a better approach :-)
> > > > >
> > > > > > drivers/base/regmap/regmap-i3c.c:       struct i3c_priv_xfer xf=
ers[] =3D {
> > > > > > drivers/base/regmap/regmap-i3c.c:       return i3c_device_do_pr=
iv_xfers(i3c, xfers, 1);
> > > > > > drivers/base/regmap/regmap-i3c.c:       struct i3c_priv_xfer xf=
ers[2];
> > > > > > drivers/base/regmap/regmap-i3c.c:       return i3c_device_do_pr=
iv_xfers(i3c, xfers, 2);
> > > > > > drivers/hwmon/lm75.c:   struct i3c_priv_xfer xfers[] =3D {
> > > > > > drivers/hwmon/lm75.c:   ret =3D i3c_device_do_priv_xfers(i3cdev=
, xfers, 2);
> > > > > > drivers/hwmon/lm75.c:   struct i3c_priv_xfer xfers[] =3D {
> > > > > > drivers/hwmon/lm75.c:   return i3c_device_do_priv_xfers(i3cdev,=
 xfers, 1);
> > > > > > drivers/i3c/device.c:int i3c_device_do_xfers(struct i3c_device =
*dev, struct i3c_priv_xfer *xfers,
> > > > > > drivers/i3c/master.c:   if (!ops->priv_xfers && !ops->i3c_xfers)
> > > > > > drivers/i3c/master.c:   if (!master->ops->priv_xfers)
> > > > > > drivers/i3c/master.c:   return master->ops->priv_xfers(dev, xfe=
rs, nxfers);
> > > > > > drivers/i3c/master/dw-i3c-master.c:static int dw_i3c_master_pri=
v_xfers(struct i3c_dev_desc *dev,
> > > > > > drivers/i3c/master/dw-i3c-master.c:                            =
     struct i3c_priv_xfer *i3c_xfers,
> > > > > > drivers/i3c/master/dw-i3c-master.c:     .priv_xfers =3D dw_i3c_=
master_priv_xfers,
> > > > > > drivers/i3c/master/i3c-master-cdns.c:static int cdns_i3c_master=
_priv_xfers(struct i3c_dev_desc *dev,
> > > > > > drivers/i3c/master/i3c-master-cdns.c:                          =
       struct i3c_priv_xfer *xfers,
> > > > > > drivers/i3c/master/i3c-master-cdns.c:   .priv_xfers =3D cdns_i3=
c_master_priv_xfers,
> > > > > > drivers/i3c/master/mipi-i3c-hci/core.c:static int i3c_hci_priv_=
xfers(struct i3c_dev_desc *dev,
> > > > > > drivers/i3c/master/mipi-i3c-hci/core.c:                       s=
truct i3c_priv_xfer *i3c_xfers,
> > > > > > drivers/i3c/master/mipi-i3c-hci/core.c: .priv_xfers            =
 =3D i3c_hci_priv_xfers,
> > > > > > drivers/i3c/master/renesas-i3c.c:static int renesas_i3c_priv_xf=
ers(struct i3c_dev_desc *dev, struct i3c_priv_xfer *i3c_xfers,
> > > > > > drivers/i3c/master/renesas-i3c.c:       .priv_xfers =3D renesas=
_i3c_priv_xfers,
> > > > > > drivers/i3c/master/svc-i3c-master.c:    struct i3c_priv_xfer *x=
fer;
> > > > > > drivers/i3c/master/svc-i3c-master.c:     * at svc_i3c_master_pr=
iv_xfers().
> > > > > > drivers/i3c/master/svc-i3c-master.c:static int svc_i3c_master_i=
3c_xfers(struct i3c_dev_desc *dev, struct i3c_priv_xfer *xfers,
> > > > > > drivers/net/mctp/mctp-i3c.c:    struct i3c_priv_xfer xfer =3D {=
 .rnw =3D 1, .len =3D mi->mrl };
> > > > > > drivers/net/mctp/mctp-i3c.c:    rc =3D i3c_device_do_priv_xfers=
(mi->i3c, &xfer, 1);
> > > > > > drivers/net/mctp/mctp-i3c.c:    struct i3c_priv_xfer xfer =3D {=
 .rnw =3D false };
> > > > > > drivers/net/mctp/mctp-i3c.c:    rc =3D i3c_device_do_priv_xfers=
(mi->i3c, &xfer, 1);
> > > > > >
> > > > > > After this patch merged, I can clean up it at difference subsyt=
em. After
> > > > > > all cleanup done, we can safely remove this define.
> > > > >
> > > > > I counted 9. I think it's not a big deal to convert all of them a=
t once without
> > > > > leaving an intermediate state. But this is a call for the I=B3C s=
ubsystem maintaiiner.
> > > >
> > > > There also are other cleanup works. The key point is that everyone =
agree my
> > > > HDR solution. Cleanup these is not big deal. I am not sure how to a=
void
> > > > build broken at difference subsystem.
> > > >
> > > > After this patch merge, cleanup will be easier and safer.
> > >
> > > Then leave that renaming to the cleanup series. No need to use a defi=
ne, just
> > > use the old function name.
> >
> > Using old function name for HDR will be very strange and conflict with
> > spec's name convention.
> >
> > The term 'private' transfer in i3c spec is specific for SDR transfer. It
> > is neccessary steps to complete whole naming switches.
>
> Right, but this out of scope OR a prerequisite to this series. My point t=
hat
> these two shouldn't be mixed and one left half-baked.

It doesn't make sense that the new iio driver still use old interface, then
replace new one later.

Is it okay I create new patch serial, which switch to new interface, but
it's depend on this one. Let each maintainers decide how/when merge it?

Frank

>
> --
> With Best Regards,
> Andy Shevchenko
>
>

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
