Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945E9C61DBD
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Aug 2026 20:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cy0h9WwitpX6sJFTLpHyukbqY96SDBcmES0Bz+tyxWs=; b=uhPrfx+R3Y7AdP
	mwspBgvpQfQzBYOmWy9oOwn2UYrNB/yakhCxkUPTDzt5LCfhufynrn+wzChWX5lUM/Too82F4vf8J
	ymVsXpIOTalDcPcSeFlBfzmzyR8em9FztHMYxNs0zGhhwRaE99Eh8w2MXAEHCb4gJp3Hzy0DKXYFy
	cvfONwXp8iIGvJALG5APDiWYIPudcMpRoAvjVwq5gfKwJuEnmwD89900Gti6LLqo/18aIINVJq6sm
	qdoNP3GzxAU9kW4f1BoC/ezcwV+ZVI1z6B7KMFzF7DAPybEDws5YKAD70g/mkrSd/KQ2XUlHgLgIV
	VTJCRpUZNfYtm6yB4aww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x039n-00000006Oie-3o2Y;
	Fri, 28 Aug 2026 20:26:35 +0000
Received: from mail-norwayeastazon11013069.outbound.protection.outlook.com ([40.107.159.69] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x039l-00000006Ohr-39lD
	for linux-i3c@lists.infradead.org;
	Fri, 28 Aug 2026 20:26:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WwY5TjAGpVyaq8A7lpuRtisCAPy4w3tPl0doALj5WQOjeSy9eVo60prMAotrby2diDt3Y+WgtLTAYcyymdvOZXVrbqb99A7lxLRRaiiqNNppNMYbYWH9vD8mdg6srpXodEZkGTamCyOMdKmad2Z920iG7o88UtF5Fc+C1u1MWoJPFmU4hxbd15ffuMJARpL1UygiRzs1kyaMZ7Cl5hSMnYyFlUoHd8ejXZ5MgfyKf+KPMHaRWQiSyu+D5YhOFKDIw4TvjDRDeZFNonhaX4Q+PW9t2IpdPY40MAcHeavSF3dWqN5zWhJPMlNHgwAo019m8mYRlLfrHi1+6j3I9sO0wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8RwyFLZ6Bs70exYbzNEiIV6G+KWR21abxqt2OxgzNw=;
 b=RR/jaRpLYCRL1qJB7k4mz0NnQQtGsjuBBZkOblx2zMXJOQYRcFPdDD49Mjj291SE9WhO4x4UPHnthKF1GbXWzi5KUlPcKpe+53Ew2AO4nw2BKSE2GcRzdkdvaB2vE/+/FwVgj6vwXdVTwhK1ZnmyuJgphFNtYmwDTXYXbyFiNEwLBDAj3JGyXwMGR90Z2hKC7gFY54L/sJMO6XM/OWaI1aAoAYKTvgFbXmfGjafjqCt20KF0uRwSIESdCb8YL5CBYlfK7A1v7nRWVo7XY1hj9jtyQXhQQXNpJOq+cY4V6anX+J4N4NzC7UpoKvrlBNQL1DS4UhYLkzPeihMe0EJstQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8RwyFLZ6Bs70exYbzNEiIV6G+KWR21abxqt2OxgzNw=;
 b=b6Xpgurze1/yjEokL4lUdL17Oec0jHjcuaymx7NW5nPkFWpJifKvEts6/wHrCKKFfqch7lQqYl9ZBc3PWt1VDNIex/c9GBIjrt6PAxsy7jJq29gLcUm6ntQIpJE9aCxHXsNTTnZ9SWJEDccxioYby0PCQt5N4JUoxyOEf0L/FpOonsh3aefXL2J4mteQMyX3RHEkwPbpr2jxk89t6xvGs3KOTdosCBZ3Qg/kp5+HQTvVYT5IqSumsekWWgx61Xtsiw/qTkqoOagA3AECHqNtgPo2ZLuQQnF6UvUrIwfnTvtyF8i/o4DzyJue33sgVY/QzdHvz1pjHnAnQhVKl1KXGQ==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by AS8PR04MB8516.eurprd04.prod.outlook.com (2603:10a6:20b:343::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 20:26:27 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0360.006; Fri, 28 Aug 2026
 20:26:27 +0000
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
Subject: RE: [EXT] Re: [PATCH v16 7/8] i3c: hub: p3h2x4x: Add support for NXP
 P3H2x4x I3C hub functionality
Thread-Topic: [EXT] Re: [PATCH v16 7/8] i3c: hub: p3h2x4x: Add support for NXP
 P3H2x4x I3C hub functionality
Thread-Index: AQHdNUcRD92nHiHFwUu9XYfDRdExMraxr8YAgAI5+KA=
Date: Fri, 28 Aug 2026 20:26:27 +0000
Message-ID: <AS4PR04MB93622991CDF793463E476702FBAC2@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20260826103819.1614843-1-lakshay.piplani@nxp.com>
 <20260826103819.1614843-8-lakshay.piplani@nxp.com>
 <91090730-b8b5-4346-a151-c11489abf2b3@kernel.org>
In-Reply-To: <91090730-b8b5-4346-a151-c11489abf2b3@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Enabled=True;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SetDate=2026-08-28T20:16:49.0000000Z;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Name=NXP
 Public;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_ContentBits=3;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|AS8PR04MB8516:EE_
x-ms-office365-filtering-correlation-id: 9cbbccda-2468-4974-7e0d-08df0542a317
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|19092799006|23010399003|376014|7416014|1800799024|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003|38070700021|921020;
x-microsoft-antispam-message-info: WsKHiCnzpqktOB3hUOddisko+bdiPJR/nWBSHOV4VW4OKx77rAql9bzXUGGaB9KsTtziXO7ylYr3uRoCVV6SyQu1cxwJ3aIW4RKmvJtu3xZOtMoiGPoq/V+nlrRTHof6vZgcVhawgWxJbjBC/uJtsmOvhK4FlL/Cd51HotCgrFjIqKr3hRSfrxoakTFOL/y7/L0Ulf0Y28UgjACpWDxVx7XRjOF1Mes2FhwWlCim6P002mh+qcMvtr3DvWMLuSVjmnMr3j+Z9TAeMmqb8Um+bo68jUUHL4S+McU95Ev7cLOXvwsCClPCfVlRN1BtUImYXPv04bL/vTedZrmz6L1ZDuaWotu2bk1OdTzk3gNKuo/SDhwsI0CbcbjsENmaC5jMTZ+ec7LD2BxVovHy5EJB5FYkqmqTcmPbXVpxVFA8DPXQgXsFYefKDvtVlV5dCh17+n1dJvnPepHWNdEH3FdFlNuop9/iiSc8FMoeEgWyBcM9IkFNq/mXkIX1j5DLM1jVUvSiSFHthr9NHbe8VTuSRqbIWiOWyoKRO+m31WkbC00YqN2goCcboWouzOgmS8kFPU8kocZGYgVoTKiVeXpaDfdtd27erP51KF0z8Igk/SRdG32Q8X6FYSbdi9yofCUFAUeKyOOfT+peLybk47BfzeLktuhO0iiuk3wzA7xztkbN/WO56euJznkyY2rO1RpxQec9wNXx5tZQvGFBCXyvWDZfuGa4j0JFbUexanrnOBI6ZrfBLKTOEUc0Z41gKVdn
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(376014)(7416014)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eG1Qa1d1YUhKNXlNa0tyVCtXMENFT0hsVjA2bkxwYU9ONU1wY2xNZjJWK1Ay?=
 =?utf-8?B?dGJHS1I5dG5DbEZsU09JQ3NBZndRWVBnaHVENFg5Sk9KSnpZMEpRd2svbFpS?=
 =?utf-8?B?OVE4cnpxUHdNYkFJLzlDbDVzVnNwbE8rVkpjR0lZS3VLcGxuWjBtTzBMeHRw?=
 =?utf-8?B?MTFUUm4vRit2M2VwK2ZETmFJaVVUSms2UWpOM2ZqaWRGQnZnVjQ0SklTb2dT?=
 =?utf-8?B?VzVMNTRQN1hsejFxbVNOYkNIaWtSdmZLb0QrMWpSRHFhQ1dzUzFyL3FLREtp?=
 =?utf-8?B?dVhKRDBhM2FGSlNmNVBmc2ZtR0huUngrZkR2ZC9wcFUxenpDNEx1dERRNmQ2?=
 =?utf-8?B?UmNhd09WZjIybEVUbFE1eVZOUGpOamxjbHlKVk0rcnpMaThlMmQwM2djZXBM?=
 =?utf-8?B?ZmFGUjV5VDI1M2dlYlBVRk1CZThDemlpNFYxU1ZtM3JldUlVR01ITXpsdDVq?=
 =?utf-8?B?WExkQjFEYVVvYTBJbTNodXptbUM2aTVUcHE4K0JENGsyODJVQjN5dktnVENq?=
 =?utf-8?B?YlkwTmNnL1d2UUdRWHhuRGZsSWJ2WEswS3lTRGlIQnlmODEwTDd2a3JyZG9s?=
 =?utf-8?B?YTl3bFNwTFRnV25tbHdZRTFKMTUzRy9renFuaSt6Q203TGpFYUttZTk1YXZH?=
 =?utf-8?B?TUxEN2tWNndMVjY2NFRQUTgvVEc1Z3I3Vk5DbnN1M2lUWVFiaDZ6WjlVOThi?=
 =?utf-8?B?ZXlqdDB6V2pOckFMRllRN0FkZzF5ZWRhVHdmTGYyQ2M0bnVlcGZaSHNrN3Ev?=
 =?utf-8?B?cVMxdVRLdytkUTB1Rmc4Y3ZBSUVlVFVtOFFUZVZ5OGFtV0tKcUU4akhIOUFR?=
 =?utf-8?B?NWxXL3hhTU9CeWsrMWk3dHQ3dDVjOFNsWWlwTi96OUd2SUY3YVpNa1l4UkdH?=
 =?utf-8?B?UklaWHQ4RGNSK1MrOEJtUnBXWUtzOGhNV0lkcWlIRy9UaDJ1SHEvWmFHOG5F?=
 =?utf-8?B?VHNzb3h5MmMrSXFlWkkzMGduOGtvNWJ0Tk00dHJadTFMeWVxc2o5cUxsTVZN?=
 =?utf-8?B?MWN4L0VIMm44U2QwYU5tRW5QdExXOTlnOTJBRENyMkdsRFV3b0srbDQvTXNM?=
 =?utf-8?B?cXluLzJ2RWhvRUdoVDhNVHhMVDlNZDdqRGt6TUhBcUhQV2RLemNOaWg2VHpZ?=
 =?utf-8?B?UXpLL0RFNk43bkdjMDQ5RC9IdlpJYzZ5RlFwOGhXTTVaYmZYaElqRkgzQVkr?=
 =?utf-8?B?Rm1XMHJDT2dId3RuNkd4YWphSWRReWNJREVxZ2tDVm94dGRXa0Vwa1pNbzRW?=
 =?utf-8?B?cy85MkJWak54OTA1dkViRlI2T01CWW43TFBtV2VZWG0yZWw1Vld5SW9PTTcx?=
 =?utf-8?B?SmQxYWNpZlJSbVVtU3UzTGtGeldlVkNwai80dnVhZUt2WEp1ZDBkb1JUaU9G?=
 =?utf-8?B?THlrVHdiMGRMRUUveDFwSVlvUTROSUlQM1h4SUtpQ2djeFluLzVEUUxXTjkv?=
 =?utf-8?B?OTJYVTVpZFM5S1grWko2cU1EYlp6Mzk1SnRHSjJUM3RCQzV2MDh2ZkJlckhM?=
 =?utf-8?B?MVdFRDBTZEtHOVkreno2U1ROZ3FwZ3BWYnd6WUc1VDNVZElWOWJhL2doeVdZ?=
 =?utf-8?B?QytvZTI2VEFXMFJBZzVadWpVeE8zYXRGNFVnU0RDWTlSTHFscmVIYU00dzFH?=
 =?utf-8?B?VXMxV3l6MGp1TXcwd0lSNkM3R1BNUWRYcWs2bjROQnNVdjYyWEdrbXViaG1Q?=
 =?utf-8?B?NmYzNUFjYTZyQmlCUUU0dC9rSEowRXFvZTh5d3JrTTQ5a3MxZlNCQWFNalVw?=
 =?utf-8?B?cTZwRS9pb2VHaG9ra05FNnhGeU52d2c5bEF2OEQwY2MwQ1dzdzdLbVFSalVa?=
 =?utf-8?B?cE5VMjNpM3FTZkZrNVVUSHRPS0cvT0pCNmloWEdUaDFnalVlTW5EWjVwZC9x?=
 =?utf-8?B?Mm5ZVGZ0VkUvaGNwRkZtdUhDMzRrYTdDcTc0SHZkcVorbG82cFpiUDN3SkZv?=
 =?utf-8?B?dGorWEZvWVowczI5YTRKL3FPbVVnOXNpaVpBeXViVWdxRlNZZThtTzNScEw4?=
 =?utf-8?B?T2U2ODZLMEtKVkc0eERvcVB3bTBraTlvOXhXeThwL2xEM0lscWFaYkM5Rjdn?=
 =?utf-8?B?Q21PYTR2bGJJbE1iVmZmSVVjNVovOTlHWDZQZC9BK0ZHZU1hQkJ2czJMcGhw?=
 =?utf-8?B?cklVT3o0UGIreElEamRxOEtQRHhVaUF3WmxLOXdCSHpoSWJOK2s1YjdZUjRK?=
 =?utf-8?B?Q0F2QWJCNFJyNS9idVRPTWovWFhNajhINjlRWVBUY25yNlV4YU5NVGxDZmor?=
 =?utf-8?B?bldyT1pJK2Flek9abXBSeUJoQmpIVFowcCs4YURkNUZaVFN6OFRjbm9LUHJq?=
 =?utf-8?B?VngxS0EwaEo1VEh3WXJZM0tncWlhRCtqTlV5Nnpmck5BbXFHRHg2dz09?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cbbccda-2468-4974-7e0d-08df0542a317
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2026 20:26:27.2002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RdWvjrzydTQrh87bsjBE0lj5DYQ2vAMmYBiu0lZX40az/nYStl61v1Yc2FMtlHe0lSnjNnGAlL9OQaJEpdTfNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8516
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_132633_792172_3B8B818E 
X-CRM114-Status: GOOD (  15.79  )
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

> > +static void p3h2x4x_get_target_port_dt_conf(struct device *dev,
> > +                                         const struct device_node
> > +*node) {
> > +     struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = dev_get_drvdata(dev);
> > +     struct p3h2x4x *p3h2x4x = dev_get_drvdata(dev->parent);
> > +     u64 tp_port;
> > +
> > +     for_each_available_child_of_node_scoped(node, dev_node) {
>
> Why do you need scoped loop?

I used the scoped form to keep the iterator local to the loop and
consistent with p3h2x4x_parse_tp_dt_settings(), where it handles
node-reference cleanup on early returns. This loop has no
early exits, so the ordinary iterator would also work. I'd prefer to
retain the scoped form for consistency across these helpers.

>
> > +             if (of_property_read_reg(dev_node, 0, &tp_port, NULL))
> > +                     continue;
> > +
> > +             if (tp_port < p3h2x4x->num_target_ports) {
> > +                     if (p3h2x4x_i3c_hub->tp_bus[tp_port].of_node) {
> > +                             dev_warn(dev, "Duplicate target port %llu in DT\n",
> tp_port);
> > +                             continue;
> > +                     }
> > +
> > +                     p3h2x4x_i3c_hub->tp_bus[tp_port].of_node =
> of_node_get(dev_node);
> > +                     p3h2x4x_i3c_hub->tp_bus[tp_port].tp_mask =
> P3H2X4X_SET_BIT(tp_port);
> > +                     p3h2x4x_i3c_hub->tp_bus[tp_port].p3h2x4x_i3c_hub =
> p3h2x4x_i3c_hub;
> > +                     p3h2x4x_i3c_hub->tp_bus[tp_port].tp_port = tp_port;
> > +             }
> > +     }
> > +}
> > +
> > +static const struct platform_device_id p3h2x4x_i3c_hub_id[] = {
> > +     { "p3h2x4x-i3c-hub" },
>
> Use named initializers. In every patch of yours.
>

I'll convert the remaining positional device-ID initializers across
the series.

> > +     { }
> > +};
>
> ..
>
>
> > +
> > +/**
> > + * p3h2x4x_tp_i3c_algo - Register I3C virtual masters for I3C target ports.
> > + * @p3h2x4x_hub: p3h2x4x device structure.
> > + * Return: 0 in case of success, negative error code on failure.
> > + */
> > +int p3h2x4x_tp_i3c_algo(struct p3h2x4x_i3c_hub_dev *p3h2x4x_hub) {
> > +     struct i3c_master_controller *parent =
> i3c_dev_get_master(p3h2x4x_hub->i3cdev->desc);
> > +     struct p3h2x4x *p3h2x4x = dev_get_drvdata(p3h2x4x_hub->dev-
> >parent);
> > +     u8 tp, ntwk_mask = 0;
> > +     int ret;
> > +
> > +     p3h2x4x_hub->hub = devm_kzalloc(p3h2x4x_hub->dev,
> > +                                     sizeof(*p3h2x4x_hub->hub),
> > +                                     GFP_KERNEL);
> > +
>
> In multiple places you added blank lines between the call and if() check. Don't.
>

I'll remove those gaps throughout the series.

> > +     if (!p3h2x4x_hub->hub)
> > +             return -ENOMEM;

Thanks,
Lakshay

NXP Public
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
