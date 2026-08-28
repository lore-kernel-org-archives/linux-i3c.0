Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586CCC61DBD
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Aug 2026 20:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dzYL9lJh7J/gJ5gOL+HEsryQKBWrzXaTVpdYiU+FcSE=; b=XOrrQ7ULzDvRJ1
	FyW+1v/AQAY77NXlhQpF83jeEYEnYjXu1gFzaL+i3cjmvgST4nsbkkG7aEq4BzLhUhs8Cac0AXkkj
	R10kWvsdd4OwyFOt6s9pRqcbIydOAYbXiPF1Iimj4UKuqLEt/MvxolLoPmkPm345v9HMn22sP+OH7
	ijVfVSx37EHaDi/tnjUatp74jgTIG/Dp2yyO/MycWeujWdHkwDf/n5YqsCoWqSm0hKFkZOSgzJujo
	P/H8eS169NmsrBxBm+vrEaqoy4lMJU0CWVC8qenXWvcCZAPiUWx7xYAVnEg2Gt573ukmT9H4C1+mN
	RT2YPhC2O6nvVtIC+6vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x030G-00000006OGu-3PAW;
	Fri, 28 Aug 2026 20:16:44 +0000
Received: from mail-norwayeastazon11013013.outbound.protection.outlook.com ([40.107.159.13] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x030E-00000006OGE-2XWY
	for linux-i3c@lists.infradead.org;
	Fri, 28 Aug 2026 20:16:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOLS0io0Z9eaWhrXCJR/Sy+LTXRc6sRk1xt4eUhofX4tMXzF+FQZEIuypqrd1jhg99CN5PNqhAx35cmz+CaHmU27cNOV1NmEBhkI345Xlmm6l93/TiuXiUHlX6dPJnFhgtsLyhgDoCIz1xO1k8vGyL8PEQZNViG6/WM+x9kV5ljYjex60WUtK4IjVuMXQ6rgBXmFyZv5J9ylbK9pQ0HfAuGKF0eD+PjOCQO53UvQl4lIimuPrv4vZX99v+qRjyOL1wZeveXWtKHPOP+H+zO39gYyiyzQjLGb5Z2InkkEOunusJMsCaqxpRxU6A3oFPNRT/zLIyYyTQGL6vWRTnXp8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uBE2sQGOpIeETdQ5sUpbxvKBgv09NA8VLNcXK7oVcg=;
 b=KADPuYePsEEKwhJgOS8pKlAI91TyTUXyfxvzqpKTIT1RxYkDmhQxKks9q20fWo+JPdhiQifY5IUlCViMYGY5QWmIufPFJvX4drLAyW513hf5Y/Ma2kneEyIPlicaAQKUmnkRhyVPhw/3PftoycdjYomTUX+ewI1UV6yx9cWl00xGE0vLIJAWJKxbjMMWkzf+NPM2bZdrUxKbqBy5Cb13Lxg/1hRw0L7uUROyqWdwMq5MOfepP1h/PO9Py/QkTw8I+XFA5v8YlCMMWh5SQ34TV7ZaKmaC3su6oIedTmIusIdmO++IPRTAOjHjOu9iwxuFKqdJ6YoHNLXh6myf3hsFhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uBE2sQGOpIeETdQ5sUpbxvKBgv09NA8VLNcXK7oVcg=;
 b=MJuh8NvTQCsJUS/uN/tbZ2mASrtJI2fALl7nw6OZzfs43F0CyKome6+ZVxEm9CgJE9edP0NN45dxeE5C+XKsexxWZR7pfkoc2JA0zkhfV3l8G3t2v8xBRRRfolLhBHnc3D/dnq/4DRoVdwiC0J393lhSzaZT6m3GCE3o/SYm3QPegvmMyM05MX4zC/nN85HdVcp4wTIiBtJea1mSFX95Dd1IA0nvGjGC/zO1HZ/MK1mCCJpFK1HMvEVffJB9xP5hbAvyPMgf3jP+mrw67Xu0DwTWdgujA70lrt0MgpOtj5rq56s0VAjiYeZiNznU73Wf6hlzk4gPcYcwbR76JBiv5Q==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by AS8PR04MB9012.eurprd04.prod.outlook.com (2603:10a6:20b:42e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 20:16:36 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0360.006; Fri, 28 Aug 2026
 20:16:36 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"lee@kernel.org" <lee@kernel.org>, Frank Li <frank.li@nxp.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: RE: [EXT] Re: [PATCH v16 6/8] i3c: hub: Add support for the I3C
 interface in the I3C hub
Thread-Topic: [EXT] Re: [PATCH v16 6/8] i3c: hub: Add support for the I3C
 interface in the I3C hub
Thread-Index: AQHdNUcSs1wsbcvQY0WlYGU50vgFqLaxra0AgAI6ZoA=
Date: Fri, 28 Aug 2026 20:16:36 +0000
Message-ID: <AS4PR04MB9362CDEAE312F232E037B51EFBAC2@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20260826103819.1614843-1-lakshay.piplani@nxp.com>
 <20260826103819.1614843-7-lakshay.piplani@nxp.com>
 <b2d596af-ec24-406f-bcd7-813db0aebeb5@kernel.org>
In-Reply-To: <b2d596af-ec24-406f-bcd7-813db0aebeb5@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Enabled=True;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SetDate=2026-08-28T20:13:29.0000000Z;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Name=NXP
 Public;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_ContentBits=3;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|AS8PR04MB9012:EE_
x-ms-office365-filtering-correlation-id: 1bce7fe6-de0f-442a-a05b-08df054142ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|19092799006|921020|38070700021|6133799003|10067099003|56012099006|4143699003|11063799006|5023799004|18002099003|22082099003;
x-microsoft-antispam-message-info: Rd25EfNiDNlrY4Ovrp/Axngh2NYWE/9wNbwSp8ScXzatfD27ARwkf0zKYrTZt9vyDNk8oOAWYLpgEBIYYG6+xOlEcSg0Q5iuOQajjZByzmh1PlViEYCEZBshfegy1PJfKNAFGqA8Y3f5Rcq14qabOn+ysvc2ggXf+IXVG3Te5irpk0LlzG6nCcqN2yLbWe7z9kOl5YUNS/YFC0FMLdnCyfUmx1OoViTKAtJA5yDj2gScuT1QPk9QmgxR9klYGQhXF7++Jo+tLdEUPv4md7tvMynUuxHnDACzRXKf48uNl0efP+U3LIl30ZHh+oY1z0vrLzlMHoMLKNzkAyNuKwQic0a7HjhclIpQ3IpWAiJSGq59LG42oWpAG5j8/fu1coXjl+ZUEeDfBXmZsDunWVfTAZlsqCTjJe7h0kaDX4MgcpA/iUxInxj59b6O/8mrWA4uBELTbezNcpr8t6IchxSAYE/uzF2zbWWtPEqmkoDps4L+XGdkiQ+msGT+ACn15dbBN+5yzxBsN8V6erb29hUPRnKHL+zY0PsFI1R5rjYmCZSJRjGXXgcmPT0Mdj2MV8U1UTVTgUM8NoVHJbgqkroT19INHjbKTqaxq5JJ633gH1C0PpOq2eFuPbitI53IKJrAJxfv1zeyaKTLF6SorV6amkoPSCoVmrcWaKuWUsbi+aUWv4E5IUMS0W/kUWUfstVx63o0X67quy1+276HQLFe2g3mKwFAaN0gRQco3PWkHVJ+iY1WdeIAP6MdCSgrgBVf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(19092799006)(921020)(38070700021)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZU9kLzIzSTBkc0Z2bkFENmhzcUhXZ3Y4dDhob3lhTW8zcWMvMFVnakxBWmJj?=
 =?utf-8?B?eFJGclAzSHVrempjTUhsM0pkNWZWRHVyTnhlQ3FBUzR6Y2pXN2tKT2xWUUlW?=
 =?utf-8?B?c3NDWFh6b1lIRXhtbWJNbzdPcWpzTFcxRmNXVklYRS9hS1lvWTRZYnFoeEc0?=
 =?utf-8?B?c29PNnFBMkFuTEVqWi9GbFB4d2Zqc1BDSERRZWpzUnBBZXJuYVlhcHpnL1c0?=
 =?utf-8?B?MDYrbTRrc205Y1FQYTNiYUhoVWNrZ1VRODh3T21ZTnVkQlF2YlZ2OUhkQTh0?=
 =?utf-8?B?OXBFdXRjN1pGRXo2azIybkZvUWFRMXZ4OWQ5M0dQV1RmcGRuR1VFaVNqNG5Q?=
 =?utf-8?B?MDZJRGtSeStkc21qQW1HMVhPUUtXU28xV2VFR04xRkZXTGNuRHdMamczTUZP?=
 =?utf-8?B?QUlJNE9DQThxcDZOaGFPT3U3aS9VaGNLMFJNbHJ4VFJCd2JaTE91WmV3NTNS?=
 =?utf-8?B?UFd5ZUtVQ2JyNGM1Qk5BR3kxc1E5OXdndGN4emtreGk5V0FOWHJMc0ZIb25a?=
 =?utf-8?B?a0NnUnhyMEJRclRSb2MrQnpmSFljZ1ByTThRdVNsNHZNTmM3MjJpOTJEMU1E?=
 =?utf-8?B?UTZ2U3BGMjdta3owQU8zcnNWcG04ak1tbEo5UloxWWNvcUN4OHRzVWVDaEx1?=
 =?utf-8?B?dDRQQVY2NHhUOHE1OTRXaXdoVXY0OW9XUldIa0JEUkwrbmk3K1BIYzFLNVo3?=
 =?utf-8?B?Y1VXdHh1U1dlOVEyZjllR2JlK1kxWWJSSEdibEtzZ1dXREF3ZGc4eDl1dnYr?=
 =?utf-8?B?RjFpZmF3d1ZTdElib2dFZittaDNXeHc2TTcrM3ZoMEpOQmpVK1l0SWFkUnFW?=
 =?utf-8?B?ejltUzV5QllidUtZaVFFVDdYWjVuRzhpRDlaemsvNHBnWmozLzkrYTRobG42?=
 =?utf-8?B?cjh6aUgxL2JWOVRHeXdINndWMk1vMGl6SnB6Q0ZVRCsyYkZuVWVMcEdkUFIw?=
 =?utf-8?B?dkwrelJaK05QNWJIOThoSU5qcHFwUkxDOEJFNVMrWTI1SUNMc090ZzNvSzQv?=
 =?utf-8?B?Nkp3bWc1Q25yQUpSSlc4U0tMbnNsNndtdWZsUk1BZjV5b205ak9oUWRRZWFu?=
 =?utf-8?B?THlkVG1zVUdjOE1XQmRnREQvdWlLN1VqYkhOZkRQMENIdFV0L2lWQXJ2a1Rq?=
 =?utf-8?B?cDdnemU1NWQ1RGFxMVhjU3k5VEtHd1R0eHVSV0YyZUh4YTFPL0ZXWTlkNDVv?=
 =?utf-8?B?RUExNDJ6MHRVd2puN0V2N1JkeVBiSEpUU3l0UWh5NUNHalY0WGhVYW8xUk1H?=
 =?utf-8?B?MzZOR1ZxNlBIdWF0ci9aTExNME9oUUZSdi9IZCtONUs5WUN2SHVhUk5ZTG8w?=
 =?utf-8?B?Y3VSdGRodFRvZHlnNGxoMWRJMzFOT1dicUdDNkJBNDZSTEVjS0w1WWVPOTgy?=
 =?utf-8?B?WnQzK25yeWZLdzlIbnVxdGl2ZmpUVkpBWlZqVGxqQ2dUbUk1TDAxOEJ4dUtH?=
 =?utf-8?B?Sk9KeVlGMHNMSnJDYW5Cak5YclE3RGhyRzIyNytRWjdka0VRN2NsWDhxMEln?=
 =?utf-8?B?UFBKT2p3aUIxRzJSbGROWG9tRUR1emVid0RPTDI1Q1FYbUk3bUI5YWo2NTBY?=
 =?utf-8?B?aFdCbkdzanFNZVljclE2TEc3dVFjYVlNSDlYK1NtdTZYMVRYOTlsZGsvWi95?=
 =?utf-8?B?Tkd0Ky9CZDBMY1poNEJpeE90YmdBekFaN3hWNGxHZk1MQXluRXVyRmlqL3U5?=
 =?utf-8?B?VFYybXN3ZkVUNG9MQm11WEZpS0l3cU5LZ2NwcVp4cldhbjJDcmZSaTRnTnU4?=
 =?utf-8?B?Q3I3WVBoQ1Y1My9KdnBzUnR3V0h2S3o3WFpocEpJQmJnVkU4ZW1mM0kvMVY1?=
 =?utf-8?B?K2pESnJlVWhobVNPUEJCc2hMb0N4cFlGNnZhTFJYdUVTWXVBWVpidzcwbEcz?=
 =?utf-8?B?WnFOYXh4a0lMVk1aS1FwSk52RGhqajNheCszWFpTK0w4N1dDam1xcUk5NGt0?=
 =?utf-8?B?OFIvcnNxQVJUdlJkZkF4S3ZoMFdzODd5cU1vRVpsRzhYSDNQU2xSd08yaE1u?=
 =?utf-8?B?VkF4UmljUysvU1JrUjU4V0RLVCtXWW1Cc0N0QjZIYXRwUUxOajZFeXlTZ2M5?=
 =?utf-8?B?SkdoTlUzL3NGSUkxclN4SWRZSlhKY0xjMFdXM1JpTm9OY09icWoxUWZXc3lL?=
 =?utf-8?B?ai8xZjBrWFZOdWpsa0xwRTI0WVgxUTdSOUplV0lBMlBQei9lc1A5NDFHNGtN?=
 =?utf-8?B?YjhOYi9LWTB4a2poUWlRKytnMXE0V2E3MmhaaThob2lpcXNEQVJUYzBHaDlj?=
 =?utf-8?B?cjZpZ09oT1hxRWgxeW1hRFNWaDJUcHh6ZW4ycURPTWJTTkRrcHRpUWZnOG1S?=
 =?utf-8?B?RVh3V25xalBvWTdhbjdhQVk0TVBJWGZ4eDgzSU1LQ1d3bll2b0UxUT09?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bce7fe6-de0f-442a-a05b-08df054142ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 20:16:36.3478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M9qe6ktvP4I0JhEv53FnIDjI96Oyr7nkBahTdHa4XGrgMSgjJO/GNWjzaaWuioP1jkLgrI95QvLFAV/XF80Cyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_131642_659398_785FDBD9 
X-CRM114-Status: GOOD (  21.73  )
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

Hi Krzysztof,

Thanks for the review.

> > + * i3c_hub_init() - Initialize hub context
> > + * @hub: Hub instance
> > + * @ops: Vendor callbacks
> > + * @hub_dev: I3C hub device
> > + */
> > +void i3c_hub_init(struct i3c_hub *hub,
> > +               const struct i3c_hub_ops *ops,
> > +               struct i3c_device *hub_dev) {
> > +     struct i3c_master_controller *parent;
> > +     unsigned int depth;
> > +
> > +     hub->ops = ops;
> > +     hub->hub_dev = hub_dev;
> > +     mutex_init(&hub->lock);
> > +
> > +     if (!IS_ENABLED(CONFIG_LOCKDEP))
>
> So without lockdep you do not initialize? Honestly, kerneldoc is useless here
> and explains nothing. Kerneldoc is pretty clear - you initialize hub context thus
> why hub context should be uninitialized without lockdep?
>

The hub fields and mutex are initialized before this check; only the
lockdep setup is conditional. I'll clarify that in kernel-doc.

> > +             return;
> > +
> > +     if (WARN_ON_ONCE(!hub_dev || !hub_dev->desc))
> > +             return;
>
> How is this possible? Why panicking the machine?
>

The caller already supplies a valid hub device and descriptor. I'll
document that requirement and remove the check.

> > +
> > +     parent = i3c_dev_get_master(hub_dev->desc);
> > +     if (WARN_ON_ONCE(!parent))
> > +             return;
>
> Why panicking here (WARN on panic)?
>

The parent controller is also guaranteed at this call site. I'll
remove this check as well.

> > +
> > +     /*
> > +      * The routing mutex has the same hub nesting depth as the virtual
> > +      * controllers this hub exposes, so the parent controller is one level
> > +      * shallower. Keying it once here, rather than per port, avoids
> > +      * reclassifying the single shared routing mutex from a later port that
> > +      * may already have used it.
> > +      */
> > +     depth = i3c_hub_controller_depth(parent) + 1;
> > +     if (WARN_ONCE(depth > I3C_HUB_MAX_LOCK_DEPTH,
> > +                   "i3c-hub: routing lock depth %u exceeds lockdep support\n",
> > +                   depth))
>
>
> > +             depth = I3C_HUB_MAX_LOCK_DEPTH;
> > +
> > +     lockdep_set_class(&hub->lock, &i3c_hub_routing_lock_keys[depth -
> > +1]); } EXPORT_SYMBOL_GPL(i3c_hub_init);
> > +
> > +const struct i3c_master_controller_ops *i3c_hub_master_ops(void) {
> > +     return &i3c_hub_master_ops_data; }
> > +EXPORT_SYMBOL_GPL(i3c_hub_master_ops);
>
> Do you really need a wrapper call over single variable? Can the i3c hub core
> code be NOT present when your I3C hub driver is buillin?
>

P3H2X4X_I3C_HUB selects I3C_HUB, so the core is built whenever this
driver is enabled. I'll export the const ops object directly and
remove the accessor.

Thanks,
Lakshay

NXP Public
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
