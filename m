Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5F5EB3629
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Mar 2026 17:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ztptwxYbIKX8haU3BQEr3Xa83KDJMSuk769PB7DPDSw=; b=A9oNxeVbMvx7SA
	89I7YOk6fehy9CctSHrXcC4Y6z0MPZvB9IINT2lSqiS2GOANOfVQ3etZGRT/oKYUj/kNNivs+maUu
	unu+TPd8INoy7HstEohICthqk03HdZMtcD4Hd1JbkTJwzizcT+R6Rqrrka8qKJn6ghjWABArZdt0Q
	HNTrVRO+Kvt+mguCzibiIf9I6KHpjfmGXz9wuPmg1etlbkMItTjGEux4MIVTIT5HEhdneZJSDqQZJ
	AqfD8+XHYRCxeFUlqkxYumLj/ZOg0MNLv9Nr4SFpPkzKwVTZitHvsfnPOFmg7Ije63T0rTH3bHItZ
	MVAF7OJvpwioXG9nFsqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7Rs-0000000Dd65-30Li;
	Mon, 02 Mar 2026 17:52:52 +0000
Received: from mail-francecentralazon11013014.outbound.protection.outlook.com ([40.107.162.14] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx7Rq-0000000Dd5S-1t2U
	for linux-i3c@lists.infradead.org;
	Mon, 02 Mar 2026 17:52:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Al0dwPIiSVgJJLxIgsGRrHXUQG3VWrFNToU+4fYlBjKhkJyp8ywCWER6ch9+U5JNmC2WCgKDqaa5wlR2SlqJAs+ZRC1b/UBT49bdBGkGBUDEt5ymXQ5jjHyi5Q3CTJQlIaP4xRLXVfhhbTj+S8bte0Eb8+Ghrl5YGdY2GifYJOxBIPRNVKycZ4xxs9OWNfYalfozTO332d8Z/+iTlNbDshTgIQrbtt+ypjGZzmrVaDNjWMCfdGiKTobFycWlWo8WD2ZcI4i24fliwnIY4UW8PDUJQXfJniR7gNlJkH9FUO5aJlndbb07MYQz2Tft0Fqla/aEFo4bujBBiGDduQbWNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wgckTl/14h7vGKOvYQavf07K4xXQsZEoE0e0EIaZ0E=;
 b=WmGLw+91/00velUHZGseAnzKHEJAaFr60nEyNsIqW06qkyYnCHJfASjTBVcNVWvevakNk/RNBTpZ4Ap3bLAmWIr7YnNoqa8VflFZhbsosu3/FeA6SyzU61geMuP5jJWJJY+l3F+I0MNGO0GN0nsB5p2f0DjhT7wOMzpW5Ln8rVZdiwCVh9TOWJZibeS5fbk93W/wFSZeVagjxw4gL+//4W4wIF4aAIzzYDNS0anPn13mIm4UnE4q/vRGQHwWdXexDSVLE4sWxzGmBw6xa8eZcVVqp6wOAdx7eiunoCIOKs9Mogm0X/rIZT6Eohj/HGHT9uc58VBqC0lb6GMheoz7FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wgckTl/14h7vGKOvYQavf07K4xXQsZEoE0e0EIaZ0E=;
 b=ejzCS09ZMyBZ0NzRlsVKLmYZ70d5Gn+n/GczSfpAks2k+c+XFVTPhbaxnas9rXJYENj5/hFNpAvqviQQnEErjnOBfT5u2GYwwUemHiYxcFIEdxtlNdL4zs2o/Z3FQfQ49mFCjK5OpS9d+yb4HpWE2fjeo8YecbZF+IBAV4BDxGSaBSkBihvzGiXD+BRtv7mOnoIL/yo1udGNSnOQYsrC9Mt0qJxW3P96/E68QXzx03WUobCeoIc2/cMMAcTD6m5ebutZojitnFZPgsTnxzgOGn1pzig9vEFwAfp6rQSx9mGSOqXvSZq8X9ulUl4acPS3V3OnlM4pjnyXfmiwwtCprw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AMDPR04MB11298.eurprd04.prod.outlook.com (2603:10a6:20b:6cb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 17:52:44 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 17:52:43 +0000
Date: Mon, 2 Mar 2026 12:52:37 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 02/12] i3c: mipi-i3c-hci: Fix Hot-Join NACK
Message-ID: <aaXOZWdqqHXYe9Xv@lizhi-Precision-Tower-5810>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-3-adrian.hunter@intel.com>
 <aaHATkkm-4WThkHe@lizhi-Precision-Tower-5810>
 <626942e0-0bcc-4ca7-a69c-d1e3ef7dc6aa@intel.com>
Content-Disposition: inline
In-Reply-To: <626942e0-0bcc-4ca7-a69c-d1e3ef7dc6aa@intel.com>
X-ClientProxiedBy: PH7P220CA0025.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::27) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AMDPR04MB11298:EE_
X-MS-Office365-Filtering-Correlation-Id: 9103f285-98a2-4edc-433d-08de78848130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|52116014|13003099007|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: z8AuEbMjzhazJOlXOCVCShD8CPOOYs8YfohIkNfT/VrhGJvVlaOdyEICv29xRnxk0HUtk7NeL+iQfMzTTbD0R3yKcBExeCZCCLR764gB9KH2Rs2xo92BbY5z17C2Q31TgCIohyNH/kjPGap0raLzW5jBn5qOseFI1oTXCrCzNgl3lBb9CcAeouPU2cVf7DTvLKA51POLV/WzHtEOJoOg0ZD6FzNFtnRpp5WGsbIizQJwyaQczipaEAaurxNHUShR1HERFGa4auVRaxEGiKK8lSBZ1dp3lduQbStjWoGY0wFNAaklnQGnuaaKv8eEol/PKORRxqn+4VBx1j6CluKgGXXyHSUZe87Ok8tiUcdbhXoJMFDCn+Abqo8yoL0zX0+HZEDT6hXtCrUdTzIVGVhhZei4nsC0TE6UWneRK8u0+seF/cVHDasuD1pfvu12d3VeV6Te9SqhY+SyDJK9832u6vmRF4qaAkGwrJdjO0UvEw9MQ0sGN7UKPRNOEUrYUSpI3gCS7t9eJYLvCV+H9wC1+E0IU5kSHIXkTxmeXtjDdtXqj7qbpA/sLzOcVJazb1W0mZuC/tGygF05IItDFTFjRT/ds7LopNQYPATlzNEvhQB7yS6CkLVjAxTd4IGypLXki23go6MTEu7GTnNvLU3xv6F1lf+2t6lNC2Cmd5u40gNHyaar+LrVcw2QAYsQr3g+FTAddX8Da1jJRr0an/Q/3JdUD0KgM4oIKcI5qfEWcH5jB6HHqjZMoRGJIAiZ7liVBsYzEA/JXDeo31SxfWWfflYZmSYiTykHaEhY8WLc1B0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(52116014)(13003099007)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eURjVm9QNVNJUSthN0I1eFgyTjNieGFVR0p2NTdDTkxZbWlJY3ZlSEdCUzhu?=
 =?utf-8?B?QnVmVXhXaHFrT1AzOUVsOHNhVWh6eDZ1V0gyLzJRSTQycmZnbzlpNTN1T0FI?=
 =?utf-8?B?alYzbjVNWjJweDlaK3BTYkVNUDJpREpKcTU5Ykw2NHVkenF0QWpRSm82dHha?=
 =?utf-8?B?Zk1nam0wbHhkMm05blFxWDdQTGVyeUptSjVLSjhRbllDazJuUUJwZFF0WEJn?=
 =?utf-8?B?RlluNDFQWXA0RHZqTmRIMktmK3Jic1hpaVcwYW5WVkpZT3FBbXlPNW5TZGtu?=
 =?utf-8?B?WEoxTzJOZVo1cVhJMjc4WXpHNGwxUWxSU0lybW8rTXNvMDFOak5VYnJDVUlO?=
 =?utf-8?B?V0NHcE11czdMTU9Scmh1b3pXejFUOFJBN2o5NkJQMm1XK3U4QlZJVHRtNDFF?=
 =?utf-8?B?RUloRmIwbDZiOC8zLytrN2gvU3ZINGFsNTgwN1dwWWJxNmNZeHNXVFA3RTlo?=
 =?utf-8?B?cGkyWUIvT2VBazBOeE9UOVZ0YzBXQVA4ZTlORnpQdGxpV3A2SnlCZlNYZm9a?=
 =?utf-8?B?U0pQaW81WHM1MWhGS29lRTBpekFFekl6d1FJck9uSzFlYjRJY0Z3Vk5qSDc4?=
 =?utf-8?B?WVh3YmlGdkdMK0xTWm5GUlBxZEt4THBDQzZ3RDJ5cmEzOUhUZFBmN3VjMDBZ?=
 =?utf-8?B?eU95czR5Qi9aUnorVGpxbm9ObXhrNDBKOGJtemtPWjZZU0ZUM1lOQ0tzOFRh?=
 =?utf-8?B?Q1NKdUtlQ1A3SGlpZ0djQStML25IblhncG43TTlhUFh4THcvQlVxRWtNZXZ3?=
 =?utf-8?B?Sk9tRlA0N2RodjBSNEFnb2Z4Qytka2JaczJCTXlCbnBtSUNWVWNMOFl4dzhE?=
 =?utf-8?B?TGdvKzVwVGJZYlRSRnZvV25FZjNrVm93d09sZ0lSOXc3bGc3T0MwQk5VS3lB?=
 =?utf-8?B?MXY0SEFoOWU2am5SUXg2cEFpU1VqemZGZ2MxOEp0VTBCRUpiMm9ibE5CM2FO?=
 =?utf-8?B?UnR3TEk1K1VnMHFQbm5Ea1loMCtacFZqeHVzRU5PN0hUUWJYUkVhVURac05P?=
 =?utf-8?B?MnBrOGFxSlRHekptK1BzbHQ3TmxxY1gxcTA2MGZrTU9GVGZ1RHE1c2l3Wkor?=
 =?utf-8?B?dW1wM0tvLy9tcWxBeU9oUEJJUXBLaDczV0xoM1l0V3dpaGswVmMzbi9DVXg3?=
 =?utf-8?B?NjkvWm1nOVc0MGRKaVJpV1BLSDVSMnpqN25yTkJZNzR1QVRzOWY1ejJjMTk0?=
 =?utf-8?B?S0g2clpYU1RQUmFCSVducTZXUWFnR3ZabDY3c2JNSDRmMncyZFZuK295Nitt?=
 =?utf-8?B?Tk9vbkYrZVpKSi9ranNUT3dkaGkyRXlqS21KdjVOYkdWUmdNdHRrdHFDcVR5?=
 =?utf-8?B?dW9JM2V6M1p4YjVtWlFHZ2VhZVdIL0VDb0Nhem1ickhYcm9kMzM3YS90dmFX?=
 =?utf-8?B?ZStscEhJVDJ2aWRrVEhUTnRWMTVPeXUzbmhVbVpDWmN5RVRUT1R0ZDdGdVQz?=
 =?utf-8?B?QjJsSUlNUHlQS1IreVRudk52UEZCeG9yZTlydDBjSUVRMVVUWXJkYTl2bWNV?=
 =?utf-8?B?STN1V0VqYk9uUHBDdjBINDk0bGdnZnZpdVMyb3paNXdOOGR0V1FicDR6aHho?=
 =?utf-8?B?RkdiMFdiZUQ3bjJGeG9hTWVWUm9DQnQwWmQrSlB5VXNaRTY0ejZ1dG1nSVlS?=
 =?utf-8?B?WExYNUdRa0ZMOCtMdU9XOG5TNUpyQkFPRXJSVmJiUmhKWHFZRUJqQ0FPaUUv?=
 =?utf-8?B?UW9SaThEeGl1VWZLMzdKNmh6NnM1VjhpaWt4MEtLVEd5dXV4eHNVUk0wZEw4?=
 =?utf-8?B?RTBSd1p3U3hLaEgzWWtkaWllUis3b3Y1NTVMT214bHVtYkszSytkQmo2VDJQ?=
 =?utf-8?B?Z3g0OUdiKzEvOWpRQUYrR0toaEY2bnFPdVlNeHl0Q1JGSGN2aXYrOWlSdS8v?=
 =?utf-8?B?Rm8yTnVsQ2pMOVdNNTE5eUJRc1JHRFh3ckFDM3N1MkM0ZFlwdTVOcWpQR1lF?=
 =?utf-8?B?RkVoMGpJZDVnb2F0ejFkNlJib1lZUnE3VUM4WXNJc0p5amgyMG1YZWZOOEtG?=
 =?utf-8?B?L0ZMajcyaDV4bHVCMGlmcUlxK0QzWnlFbUVXVGhJcmVEK3VjMW5qd2xhQkda?=
 =?utf-8?B?M2FteWRvN3ZtTnVUKzh3ZklidFBIMWUwUnc5cklSSld4a1ZLQjQ5VTE0Tm50?=
 =?utf-8?B?NHFPZDExVzlLWW5oWW0yZTdnQWtHM3dRa2xjM3N3VGpENjdtNTg5eSs4VFJR?=
 =?utf-8?B?UnAwcmQwRitkZXdSUDkzODNNR1RWNXRrd2gxK2g1cS8wck1mWHZGcGF0TTFy?=
 =?utf-8?B?U2NkTjdmbmk1MlZkTCtzZjhGWmltQ2YwR2NxTjFsZklsa3VtOUhNVEhHN1Y4?=
 =?utf-8?B?QlVNdlF5NTAzemU0a0pUeWd0cVh2R2x1eldHRXZDdjlxRG9tbmxVZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9103f285-98a2-4edc-433d-08de78848130
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 17:52:43.4397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1544UHL9WzcP0Xyn9U8ziFrNGsNE8Mg1jVAn86YrMfbxp6U2ziOgN4T7vDIJt/FFpnhfgLbaJyAMwDMU94vsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11298
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_095250_495696_35E991A7 
X-CRM114-Status: GOOD (  22.00  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXIgMDIsIDIwMjYgYXQgMTA6NDI6MzNBTSArMDIwMCwgQWRyaWFuIEh1bnRlciB3
cm90ZToKPiBPbiAyNy8wMi8yMDI2IDE4OjAzLCBGcmFuayBMaSB3cm90ZToKPiA+IE9uIEZyaSwg
RmViIDI3LCAyMDI2IGF0IDA0OjExOjM5UE0gKzAyMDAsIEFkcmlhbiBIdW50ZXIgd3JvdGU6Cj4g
Pj4gVGhlIE1JUEkgSTNDIEhDSSBob3N0IGNvbnRyb2xsZXIgZHJpdmVyIGRvZXMgbm90IGltcGxl
bWVudCBIb3QtSm9pbgo+ID4+IGhhbmRsaW5nLCB5ZXQgSG90LUpvaW4gcmVzcG9uc2UgY29udHJv
bCBkZWZhdWx0cyB0byBhbGxvd2luZyBkZXZpY2VzIHRvCj4gPj4gSG904oCRSm9pbiB0aGUgYnVz
LiAgQ29uZmlndXJlIEhDX0NPTlRST0xfSE9UX0pPSU5fQ1RSTCB0byBOQUNLIGFsbCBIb3TigJFK
b2luCj4gPj4gYXR0ZW1wdHMuCj4gPj4KPiA+PiBGaXhlczogOWFkOWE1MmNjZTI4MiAoImkzYy9t
YXN0ZXI6IGludHJvZHVjZSB0aGUgbWlwaS1pM2MtaGNpIGRyaXZlciIpCj4gPj4gQ2M6IHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmcKPiA+PiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gSHVudGVyIDxhZHJp
YW4uaHVudGVyQGludGVsLmNvbT4KPiA+PiAtLS0KPiA+PiAgZHJpdmVycy9pM2MvbWFzdGVyL21p
cGktaTNjLWhjaS9jb3JlLmMgfCA2ICsrKystLQo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGkt
aTNjLWhjaS9jb3JlLmMKPiA+PiBpbmRleCBkYmU5M2RmMGM3MGUuLjQ4NzdhMzIxZWRmOSAxMDA2
NDQKPiA+PiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUuYwo+ID4+
ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jCj4gPj4gQEAgLTE1
Miw3ICsxNTIsOCBAQCBzdGF0aWMgaW50IGkzY19oY2lfYnVzX2luaXQoc3RydWN0IGkzY19tYXN0
ZXJfY29udHJvbGxlciAqbSkKPiA+PiAgCWlmIChoY2ktPnF1aXJrcyAmIEhDSV9RVUlSS19SRVNQ
X0JVRl9USExEKQo+ID4+ICAJCWFtZF9zZXRfcmVzcF9idWZfdGhsZChoY2kpOwo+ID4+Cj4gPj4g
LQlyZWdfc2V0KEhDX0NPTlRST0wsIEhDX0NPTlRST0xfQlVTX0VOQUJMRSk7Cj4gPj4gKwkvKiBF
bmFibGUgYnVzIHdpdGggSG90LUpvaW4gZGlzYWJsZWQgKi8KPiA+PiArCXJlZ19zZXQoSENfQ09O
VFJPTCwgSENfQ09OVFJPTF9CVVNfRU5BQkxFIHwgSENfQ09OVFJPTF9IT1RfSk9JTl9DVFJMKTsK
PiA+Cj4gPiBDYW4geW91IGNoZWNrIHZhcmlibGUgbWFzdGVyLT5ob3Rqb2luPyBzbyBuZWVkbid0
IGNoYW5nZSBpdCB3aGVuIGFuYWJsZSBISgo+ID4gaW4gZnV0dXJlPwo+Cj4gVGhpcyBpcyB0aGUg
c2ltcGxlc3QgYnVnLWZpeC4gIFRoZXJlIGlzIG5vIG5lZWQgdG8gY29uc2lkZXIgZnV0dXJlCj4g
c3VwcG9ydCBiZWNhdXNlIGFueXRoaW5nIG5lZWRlZCBjYW4gYmUgZG9uZSB0aGVuLgoKSXQgaXMg
YWxzbyBzaW1wbGUgaWYgY2hlY2sgdmFyaWJsZSwgb25seSBvbmUgbGluZSBjaGFuZ2UKCkhDX0NP
TlRST0xfQlVTX0VOQUJMRSB8IChtYXN0ZXItPmhvdGpvaW4gPyAwIDogSENfQ09OVFJPTF9IT1Rf
Sk9JTl9DVFJMKQoKQW55d2F5cywgaXQgaXMgdXAgdG8geW91LgoKUmV2aWV3ZWQtYnk6IEZyYW5r
IExpIDxGcmFuay5MaUBueHAuY29tPgoKPgo+ID4KPiA+IEZyYW5rCj4gPgo+ID4+ICAJZGV2X2Ri
ZygmaGNpLT5tYXN0ZXIuZGV2LCAiSENfQ09OVFJPTCA9ICUjeCIsIHJlZ19yZWFkKEhDX0NPTlRS
T0wpKTsKPiA+Pgo+ID4+ICAJcmV0dXJuIDA7Cj4gPj4gQEAgLTc2NCw3ICs3NjUsOCBAQCBzdGF0
aWMgaW50IGkzY19oY2lfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+ID4+Cj4g
Pj4gIAloY2ktPmlvLT5yZXN1bWUoaGNpKTsKPiA+Pgo+ID4+IC0JcmVnX3NldChIQ19DT05UUk9M
LCBIQ19DT05UUk9MX0JVU19FTkFCTEUpOwo+ID4+ICsJLyogRW5hYmxlIGJ1cyB3aXRoIEhvdC1K
b2luIGRpc2FibGVkICovCj4gPj4gKwlyZWdfc2V0KEhDX0NPTlRST0wsIEhDX0NPTlRST0xfQlVT
X0VOQUJMRSB8IEhDX0NPTlRST0xfSE9UX0pPSU5fQ1RSTCk7Cj4gPj4KPiA+PiAgCXJldHVybiAw
Owo+ID4+ICB9Cj4gPj4gLS0KPiA+PiAyLjUxLjAKPiA+Pgo+ID4+Cj4gPj4gLS0KPiA+PiBsaW51
eC1pM2MgbWFpbGluZyBsaXN0Cj4gPj4gbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo+
Cj4KPiAtLQo+IGxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKPiBsaW51eC1pM2NAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtaTNjCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWkzYwo=
