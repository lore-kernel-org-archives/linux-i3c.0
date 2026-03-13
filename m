Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6510105F79B
	for <linux-i3c@archiver.kernel.org>; Fri, 13 Mar 2026 11:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0MMCGZhhKvpE4M1gpEYh6eggrKee/Rcni6+P2JHdfIU=; b=FIqqqelzUuczrn
	t/1lz/Wjd1p6sTDtDiys2HZ/NpFSkSKqr8CTb3e3FWWSEMgCJm207SPnl9iXl7CU9aVDOiAsZviLV
	jnJSN2viIcxEwLrNNgFJ9xk1Y16FQrKSTp4TYblHsARlJjYxGTvFLJpyhVfeQRTLXEI9WDAgpgf/D
	ecLmKSyz8GE4sImJk5ne8UqG9ZsEtgLv7ecCmc5554Pw2WE7Swge8WM0pnwDGRGL2bwtS5EXg55bW
	yLLZvgmeq7sMghPx9qlUJHb1IsMLKZH0xqHt+CH0/sp/qEOYCOhzXErk42PE9fT33+0rc/N0lcM6W
	baisnRI7UAxMNWHx0ilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10P4-0000000HaMG-2OMW;
	Fri, 13 Mar 2026 11:10:02 +0000
Received: from mail-westeuropeazon11010049.outbound.protection.outlook.com ([52.101.69.49] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10P0-0000000HaKN-3G82
	for linux-i3c@lists.infradead.org;
	Fri, 13 Mar 2026 11:10:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUiBJ0t52bhGHdKvVDPSPlyL3DTZdxHMGOjpnS1OUTFnw4ebqv3pZzytpv8PAIF8LEqc7mE8u/i+ZL+iiAWx0qQaj+4wTg3GU3Ta2rJDBJ2nSkQ7hv6pqNtkWif4R1DbLx4wwRWRfwcGpGKD8XhNdAweNRqQHedByE+l1EUyg6TBP8uKY7RjQ8RJahldvvKHelZlhKpGkIjfM/vvowjLikEVcZbqnKGhEjP2VGBbVJkxgXxZ6Em3PqjM8dg8De0MxsdTbYQZmUkF3jH4QZIxKw12pbQn9kePOO2yHEXN5z911tPNewR5mOWPBPQHPWIYGsJpo+Y/fLFJokvqZapFog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IgzZrPkx8AHiwoW7u91hvRVEbJL0T5UWU+6qPZnIHg=;
 b=Jgdd9MJclETIyFF2sYozhzuUzkXwy7BxQfUNbUQo6kjKF/ftjrYPZkEq4d1iBjs85V2XDPyL0YFfJ1AL49EXOfMYTaUZtxK+q2rxDOJQddk6AMIv8XyfcLM8UyFqpyzSWmx1R+7n5CQUellD+Z4vIt2TgmA1Xf2gwRpjj1dMBQdtMbIaOzLHDRZdaHErzbiwAdYUz4qSJIqFT9RefX+fPVkZH/3Bba7kv1JUP89VHvW8+r6vHBxDQTiQ1ZlJkR87flgMpKVhFEYeyNCWa83VXkiMo6AsE+cxruS1q3BcY1DzDuLFlEbCgXodIteVVP337Td0qT94zNGmwgsveEq6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IgzZrPkx8AHiwoW7u91hvRVEbJL0T5UWU+6qPZnIHg=;
 b=Id5q4sfwPYb1+tHeMk+FCFMiohGfyy1lwpph/q50wIKO4vHAmirvi361eWaJ6wMyNE5cSjS4qq3QwaZtve9q+VvDP6CPjcMrfiakBxzRYVidE42z1pYAJ70J3s9/1jbHCKMovr4N5ldZZPbjQgSTy5qxYIK+2bm7vpIxRMHdeHAWikhqLpNNfBW2hOQkHWLf1kS5iUEBokVwbPKwFKpAQ3/fvdaikZKzyLbOeKT0eyg95UM3aXhEewlqFKHOPQ81BhxORhlEKC/QAWxGxsWf6b3v6bfXgjwB4nr0MDw2QYR7xLFgeMEmUHBsrzOSAZ9Aqcpd/WhTw073L2nR++89jg==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by GV2PR04MB11093.eurprd04.prod.outlook.com (2603:10a6:150:278::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 11:09:38 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.20.9678.024; Fri, 13 Mar 2026
 11:09:51 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "lee@kernel.org" <lee@kernel.org>,
	Frank Li <frank.li@nxp.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain <priyanka.jain@nxp.com>,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: RE: [EXT] Re: [PATCH v6 3/7] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
Thread-Topic: [EXT] Re: [PATCH v6 3/7] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
Thread-Index: AQHcsFstbeRrFutBCkyz6OBrlMui6LWo27+AgAN3JZA=
Date: Fri, 13 Mar 2026 11:09:51 +0000
Message-ID: <AS4PR04MB936254136A4791441EDA2F91FB45A@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20260310065727.3759342-1-lakshay.piplani@nxp.com>
 <20260310065727.3759342-3-lakshay.piplani@nxp.com>
 <20260311-outrageous-unnatural-jerboa-53f5a8@quoll>
In-Reply-To: <20260311-outrageous-unnatural-jerboa-53f5a8@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|GV2PR04MB11093:EE_
x-ms-office365-filtering-correlation-id: 02640ea9-0491-4b51-59b0-08de80f10c34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|376014|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info: OLdcQU8C1ATA4ow2LbxU66msusLBfqT94o7Sl7W1oDDv5xgvEBpv4TgrqrlJMkmOfzxjh/xB38kj6ZfrneE9IwKOJu/kN1hyKDM3qThDIQEuutEK1nXoLmQO6SauAUU0wZd40EpYXjv7O+2qoOQRoIH4Ctkzt6+MCXX8xzdzpMSe9cMVSRaBYsD8Lp5scFF6q0rTxrWHwkP80Z2tZ6dcljRyWZJrzF/7ai9Cy3hgbadFun30C8rvBroKwSerXqQ8P+mKpiptP33KrXRCG+/tsjTwtRcPYJXCUKQ1ubdXS/JjbIejnIcHA0/1LMGdPhr5lqNn0QlhMOsQn7OlkusKSHaXMZ9TG9BoiHJ1wAiqdzBKaLTWyYqGC1ix85Bx9uFYmtqrA3LuIP1pCxJpt13YTwiwRCLK25UQDotswlWPzwqwMZKZjx2Pru+ok6W7GIVnxgn69SRV71co9ZoIPCKXpsgI69CgqjN6Dms88kXbb0gbnjd4ck02HGBtJmNM3giMSyvaxJe0tOrt8DrayizrefbRo6O3N/mwFLqa9msE0OZy2uMwMiVfVNzRtGadAXcNtktJF6ayT41/hFVgCE/R/tU2wlHsRAhN2L4qCIbkY96//ig1DQNQN/YZnPji96bbH33DPf6/Ra92ykABAhC3eoGWJT9w/uogL1LhwyMTFe1EfAiVBW3VoB0hurHWkhSXzguPTp4VQhYSqEcbkhCL2UeKpM24I4nkFPZzk28Hakwk16+gaimk58WmredYr+bI/QNlk9q4NuQ/sjt3lACxGdnK2WKTqPgnhxccZbonC6s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DVaYUELx9ibRCS5Rr7LEbgIGg65zf2tkj0bHb5JXwq7IBtxfvin1G0umvTnz?=
 =?us-ascii?Q?BEtqvFvaC+GVtyTK6mk7sOVXVjdMXqR5+6cTnv937T6fIWJW573Lo58hglE+?=
 =?us-ascii?Q?+dFp7E6JR+F0D52yLcxGJVam9bPrSyh1vncuSv2FlVpb/QvgW2TaIOHT5n1T?=
 =?us-ascii?Q?aCZK9uEnVvB7GtwTNpxl/pDdcRM1MGAR9/ZTHLRfLwwH5HGwqe6jve/nmiMP?=
 =?us-ascii?Q?IBdvMnieAtgCq8D8FZVxlRQHoIGho9ulFYsSW2ulM8jLqmBR3qxZJqT9RR2n?=
 =?us-ascii?Q?4nYVTVpbdVp+xOR8p0OcHglF5YZ5+7Aw/dU3lv5xC5kDUltJ4jh5xe5bqiuv?=
 =?us-ascii?Q?7c6JwMscfrXENMzQ6wPnFNXVcHCQuHZgQ1Rvq62n7rScoCftqvU9kxPyep1n?=
 =?us-ascii?Q?i5kgYFq+ZbxTpw5ENX/ca0WREzvR5pS/XyMaoLWLTwI5Et1w+NhqF9MyCNDh?=
 =?us-ascii?Q?9unxRfdFzH3DLPfRQ/GJ85B331YzOchhsxDNzU0FGTzrl1OEGeRr/+8LthjX?=
 =?us-ascii?Q?QfZL3HoLtpucVofhNVbolrzdU7W8NH9H3kZzz9bNJqbNd4gfxiGxMPj5t8S1?=
 =?us-ascii?Q?7zQfbapaJuoMCk5LwkUfYBavarpPRTBgQBhXeSaIoXBrD7teq5M2E0OYJ6Aw?=
 =?us-ascii?Q?ej+BWV1kFUAs19RCLjIKraSEcV1yddybrbu7LoWmekX4XZQXYYYoW9RMfXKq?=
 =?us-ascii?Q?Tehd/T6ynSFoIZccJe+OoxBnPaoxtHQYL9DZirtgl99D0+e4VO4Twu+k4Qfn?=
 =?us-ascii?Q?qFoRuFrCn4lyeOdH8hRnj9uGlCVD2WaBa0ZRbfAAIs4ZGkUetCLOKhA8ORdw?=
 =?us-ascii?Q?422s5k3SqeVvXMk0PyZbwQUbedbTVXgu09acYhjwxjYTTNYVGYEF75UyAAvF?=
 =?us-ascii?Q?0VY0FT4ddAHMOCGI1H40w6gbzf+ZR8Ega8k/w0A3+sLuEKxlxgIQQzHQgaXh?=
 =?us-ascii?Q?q8nRE+H/BzTYrfLoqOVDSwjr2xRP0/l7aL7lo6Jb2YITsmglfR/jfuA6BAl5?=
 =?us-ascii?Q?Y55hhsVIXAA0t8hGHcsmOjJuTuEjskGM6xvsg2ka3PTSM20x8IsKl5HXqJiP?=
 =?us-ascii?Q?rqAIqeGcIpCMxlRwq3sLAlydrBwz49W9iKGc45Q+OvKwziJ8qDu5k9xmZZCH?=
 =?us-ascii?Q?+DtvtTwih4OaVVbCdTov5nm+MGldu9FsuBO7dRVY1BeCqwgjbxwEnFNms4P/?=
 =?us-ascii?Q?08LQ++k/y2m9dVeYopl0AmwBWofvP9YXiyep4csPgRkS2LyXDE4AY5/Upsca?=
 =?us-ascii?Q?SQeCnGNrxfBU2Id0b3UT3YiqDs2ZxSKWRPORXZjBZoPRneMPpMGtmXncAE5d?=
 =?us-ascii?Q?oYGHm4FTVdt6/jCup5yZ8GFDkzs3g5AhwTjlSRYzJPoKbMDPFXRIFbRfSKeR?=
 =?us-ascii?Q?JnZRhCcRcKAdl78+G5cLhyMZ6ygNPDLoCfWj74d5FBPtBUeuTkIaDwygTk2+?=
 =?us-ascii?Q?HZHXsR/Pk69258snurLv7FWwx3BJTsldINR8tvxkfJgd0NB/6h2dwvGUIZHn?=
 =?us-ascii?Q?XKEgWNTNw/vOLnWE1Fktpgb/Gl7SCkgBQgk0RbwVoNIAyqwgbGF8YrXJSpWP?=
 =?us-ascii?Q?JhvkwpUpvJC4fWrZILS70iR7c7NevUhUnDdsju3K4IE4zeuND4VBy1WGUszm?=
 =?us-ascii?Q?HvV9f9dPq4LLZRV+Q0KZwJf4xBR+OMl0CENtiJtpikfw4pNj6PCc8zHrTBi1?=
 =?us-ascii?Q?9sEabAMHBngyQYM57TTbdCqwrqD01WtV2EPh6Tzz+wdOQ7ytCpFzZNF9fw4n?=
 =?us-ascii?Q?GbgKXIA56g=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02640ea9-0491-4b51-59b0-08de80f10c34
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 11:09:51.3157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Q003wafV1p2aKGafkZqtI+xCU2pX7vcvt5m0t+9Jtanpt2+QmKGpJgNMCgTnFSo5UOnkgGGyOAYOdjsj7P17w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_040958_818419_BB937C5A 
X-CRM114-Status: GOOD (  12.98  )
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

> > +examples:
> > +  - |
> > +    i3c {
> > +        #address-cells = <3>;
> > +        #size-cells = <0>;
> > +
> > +        hub@70,236153000c2 {
> > +            reg = <0x70 0x236 0x3000c2>;
> 
> Where is the compatible?
> 
> So this wasn't checked/tested. Try yourself, remove required properties and
> see if there is an error. No error, right?
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

Thanks for pointing this out.

In this binding, compatible is not a required property by design. The P3H2x4x
hub can appear on either an I3C bus or an I2C bus. For I3C instantiations, the
device is  self-discoverable via Dynamic Address Assignment (DAA) and its PID/DCR,
so, the driver does not rely on a compatible string for matching.

The compatible = "nxp,p3h2840" entry in the schema is meant only for the legacy I2C mode.
where a standard OF match is still needed. Since we did not include an I2C example in the
examples section, the compatible property does not appear there and is therefore not
required for I3C only cases.

dt_binding_check passes because the schema intentionally does not declare compatible as 
required, and the examples conform to that.

Best regards,
Lakshay


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
