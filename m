Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEAEEFCBBB
	for <linux-i3c@archiver.kernel.org>; Mon, 16 Mar 2026 06:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EJU69haCkWby1pVNBOfyCToAc7HmtA6xN7fEx/EYA1k=; b=T0wbKfadoU0eKN
	kxDGtdCd01dQc4d3dYxW5qyIRAtpu0cHOC5v9jj7zUP1e2aD9t2KJdMQA92CBWPRfulS42KqE+iCV
	vSJrNFo5UyHKm0jRXieHeSGDKHwlaqHQrMce0cxcC1ptljiZJFiJR2KMviQxtI7uQcaB0ofRtOH9V
	GSCXlBcBAhg07KBNF29ogMP0+Sq9o7ILX+CBLIWk9Zbex7dGKgGiu6iAYTVXVlgxlqSKitI0j7zvr
	OFwv8YcJ/TBC0s1Dya6dMInVRxwcgWAbRkMhGwr1nt0ieQ96prHg7cSiPY+2wgPv5fL2FIaW2YGGh
	CT1k5jbxXklyNVBVNSYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21Yq-00000003QTk-1r7y;
	Mon, 16 Mar 2026 06:36:23 +0000
Received: from mail-southcentralusazon11013011.outbound.protection.outlook.com ([40.93.196.11] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21Ym-00000003QTC-0vT4;
	Mon, 16 Mar 2026 06:36:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4E1a/IWh7LdfQDeAuETjRRUHNtBKgaXvVS/aNluGogaYdmmJSpMYf5SpEgBsGEo0Mdm6rp1/4IYULAxTBcXeH4dwYKIO970ry+wXuu2yyL564lZ+VZbzcsEQc5a0EpOvMKmZXWQyndiVOiAj7wBG1Dx8Zv2nFz5+YB8/3//oepq2YlyfQhDfLHiaXBWM6i7b6O0g4qNWinM7yYdbHLfrwocu+SXcwQgwQvxgkIRMUk+/8f1CNMaH5XRUjC5x8ixVsOiq+R8T1Z09X6g+Rb/VhutIjAf202m0v5ThXvH1oeg27KkaeXL8zZIwSyDa507+nGTfDvS6N86vPYA0NAVRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L10Wdsmo0DEYCRC8dETb0o2wdRS42Gt5q8bKZF4nfoA=;
 b=CigrhzBTAIIV7evJZpJbGX6juqI0S6m8GiF6B66XrNKBkKlcUAZiRtyuY+O1X5aVVbztte0E20Kd2UcmYBBxUiejw5elmB7D87gwAdH7tHRKjs3LuhfxPxYx4EPAVkkpNOq9ZoZmAU6OlrNk5YPDJCwr4ERk7KTb9ZOxRM0bOX9Lr6szA7A9ylKXlgaj8Z9kECQRZq2KBEMYlaDYCCHiypp+VKq2/2vMeM/Cn7Ed5a3haku/Y+lcocum044XPfYTNxcgsvUElKjOUrV0EUa1IHvm9yLfTuKlvC16RwKO313+Zq2NMyLzKEyAqFLmxQWDuYLgatJ/fdUkRBQj72GVxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L10Wdsmo0DEYCRC8dETb0o2wdRS42Gt5q8bKZF4nfoA=;
 b=dDw8T/Rb+ytSWxIOioOrLwSE92lhYFWlSP3KUnjVfc9G2cQ/g5Go6LSBiW7pdxIXi15bLIBDuEx7owfYizE5dVdMps74xS2xs8NBpDl9LXHPaLlYaonG63+OBexMBo7XUkuQKWb4wL8TxAHA6/1bb3LRi/16Q93L1PibePj7kOw7sANnqJkQiB8zKwk5655bxqNQVm6puLDKCSFBESIEBrcsqQFPjT0AMMSEMnZGBxW+NVQSBJHFObUoV871+U4SlL49JssNiNFJuH8gbB1+x4uX1ahGLaFNJ2NS1luHLmiaHpt3QCvVfMN2L9LChfQj00NGVqjd+pDUigWbHJ35aw==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by LV3PR11MB8673.namprd11.prod.outlook.com
 (2603:10b6:408:21c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Mon, 16 Mar
 2026 06:36:06 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::bf22:8190:4af0:3def]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::bf22:8190:4af0:3def%6]) with mapi id 15.20.9723.004; Mon, 16 Mar 2026
 06:36:06 +0000
From: <Manikandan.M@microchip.com>
To: <conor@kernel.org>, <adrian.hunter@intel.com>
CC: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <ardb@kernel.org>,
	<ebiggers@google.com>, <martin.petersen@oracle.com>, <tytso@mit.edu>,
	<Cristian.Birsan@microchip.com>, <jarkko.nikula@linux.intel.com>,
	<kees@kernel.org>, <npitre@baylibre.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 3/5] i3c: mipi-i3c-hci: add microchip sama7d65 SoC
 compatible with the appropriate quirk
Thread-Topic: [PATCH v3 3/5] i3c: mipi-i3c-hci: add microchip sama7d65 SoC
 compatible with the appropriate quirk
Thread-Index: AQHcsde/Oxq3mcmH9k+EacVRoLYMMLWqob+AgACMlgCABYxOAA==
Date: Mon, 16 Mar 2026 06:36:06 +0000
Message-ID: <a7cbdcdd-330a-457a-b2d9-b822bbd2d725@microchip.com>
References: <20260312042056.309237-1-manikandan.m@microchip.com>
 <20260312042056.309237-4-manikandan.m@microchip.com>
 <a41378a0-d2f1-4fa4-ac6d-1d0916590b47@intel.com>
 <20260312-ricotta-unusable-44c25a03eff8@spud>
In-Reply-To: <20260312-ricotta-unusable-44c25a03eff8@spud>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|LV3PR11MB8673:EE_
x-ms-office365-filtering-correlation-id: f0cb3d26-acc7-4d54-5d8d-08de83264d63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: TSqh3YKHfWIRNBkqoFI/zJjtIH0JldRAfdhMH35qHdDfwKEwgPkAPSixa92tW9tzSXkQEFIyfEPuFF1BdiJllzs44S0lYP45Kx/eKzqua3+t6UaiQSlHMezm8+02OKSBo7/XvjMmjlLh4ceHnnDNS3Ni/Y+7bJ7uICwBYS4rQTSoGTuP1DysiB14RPUz2i5NBGt/VfcpXyDUcSD5WB6A6t8mw+2OEEPFxptSKD/iqAZwObE+IX3NpvbhKv75RCZbZWjjA45xc8bRxRreMkmFM39yP3L/Y+B9wQTfSG6+oER8TSkBN7h3tKLUt2S3/nJ1YDlJsgljhF0Lf+jNnv3lZmMenoS0QpeHTkD8hZj10XbLe6NeyuzNelTexY3E+Jj2zIpSWxuJ+hCDJn5dWupmKTs4O6uHpD9fXU+3jEVqwxws9ursVmzd2lbOqqEsXdThScRNINFJGlGE1EejSgjch5nB5aJWHNSeuqXgHAbXdmugDtlP4S5raGPcDGvLdrz2Ttq0mSJTgVrDLkrSzR3x9mO39ltc83YJPN4NOEjF34o14ZDlPgq/Dc/DpoFdQS0n9jvT+SanmjWOY+EqudpyXq0xwBYn25ksWlEWDDAFJDMgUbBARKLitJ+oWij5yDeIKtBxcY6wbZsPdW9GZXdLCgXcCgB/d9uuHd4ExcaK3DmR5WBbyrP+aFU/7zifVEHG/USn0e5w23o1AAuXazzb0i1HuAvcjPQibEbjCbLMLHP866xYtUxd6V/WdvcV7U+gNjFQJYrnSQSAC+DaFYtzKooeBsM0dPphJaaDjrqrbuU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPF9623118BD.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Zk85RzdVdUZBdndkWU5kSDYwNzQ1SlB2UGJZOEZldzRtRFdDdXRuMDhXanRj?=
 =?utf-8?B?RjdqRmgrSnFreXhWQldCQlZaTUMxSUlpL3lvQ2NqajNRU05Dekp1VXl4S1gz?=
 =?utf-8?B?MjRIaHBvTU9QamFLOXU0bnljeGYySFFya1I1dDdqOVJyNzEwK01ndElxQStM?=
 =?utf-8?B?NmQ1dHRuTzQ4MUFHM25DQmxzVGZiUVJyd0ExS3MydGxxdGNtaHh0SmpQZTNt?=
 =?utf-8?B?MXBPcndKbHdwN28wdXB0Vjg2ZjlmRGZSZ0E5V2hndys1NkxvYks1QTBSUmlB?=
 =?utf-8?B?Y0ttaHF2RXU0R1FNdStkZ2JuaUY1WUpMdENkZlJXWU5hdFhQSnNzenZ2enhM?=
 =?utf-8?B?Ui9lbkpibUMzYVZIOEJTcWZqTVNIOW9GRmxlaWtkYjBpZ1ZhS0ozVXFhVXJY?=
 =?utf-8?B?UDZaeGFuMmZLVGZQcWQyOXpUOXRoWlprNkF6OUVEUlc0SEhnemkzZkVKa25a?=
 =?utf-8?B?RUlyVll3RG05MDdSK0lya1JxTXpiTCtKYm1scmgrM0tYNVkzS0NEck5aaW1Q?=
 =?utf-8?B?dVgxbWgwb0xJeThsWlM0aFBZTnRJc2ZsZis4TjdQTDlvZmlJdENWK0RVeEFl?=
 =?utf-8?B?TEdKSzFYQWZKUnVjRjMwVUFVM0lodkFhbzdnbytDdUtXTEQzcC8xb2l0bjhW?=
 =?utf-8?B?R1l2RDFTdXJyTWNnckJ1S0FydzgwYlZHelhINGlVNjRJMEdIU2EyNWw2Mno5?=
 =?utf-8?B?bkNIYi8vYmk5QnlQUVJlNGJhdFphalFoQlpVeWlsNWdqdkFrcFRoKzgwZmVW?=
 =?utf-8?B?QUZtbEZkOTVNdEpFenBZeXlnRWdUbW1PZDVpaER4UDVuVEFpZk1jQ3JVS1Z5?=
 =?utf-8?B?ODVpZHhJSHVFTEFuMW92cDJnVU9veUdGU1pwNTZ5R2g5MnUyMnJmL0hyMllk?=
 =?utf-8?B?SmlGRGVnRkdGUVhqUE5wbWMwZ3lUS3Q1Q0JmOWhrZm5neHVGWkFrcGIyMitq?=
 =?utf-8?B?QTBsTXptR29kN04rSVhHcy9tU1d2VlQxcTY2dTBWRU5nb3A1SWw2alRHa1pr?=
 =?utf-8?B?ZEVJdzl4dlQ0aHA0YU50N0YzUWZsRkRPSCs0eUMwUWwwaGRsYkowbzNaWUcy?=
 =?utf-8?B?NTRONU92djBKczVIeXhGMWpqejVxUDFtSmFHWHFtTGMydXlteDNna1E3SFJw?=
 =?utf-8?B?UEhGVzRXUk9tbnk2MFNpSktmV012aFd4akN2UXJTQWJDOWw2a3g2RUJRRkJP?=
 =?utf-8?B?cEtFdFF3eFFsdzhVcjJybkZmUHlMbjBqdEZxckZZWXFXaXJ6Y2I5bWpwTUVJ?=
 =?utf-8?B?eEhMcUY2MjB6dmtWazRkeGNtV3NxWUNsamc0c3c2Wm40ZXZCY1p6MG1Db3dx?=
 =?utf-8?B?YzZsYnByV0htYWNtNFp2c3NBemVUMm1KSndZWm1RaTZTUHZGa05pSEh1ODNh?=
 =?utf-8?B?Q3pmc1ZoS3FwZXUvcC9OcmQzMWp2YUNmc1VPRHZDOFcyMnNmcjNYYUZYWVc2?=
 =?utf-8?B?QUp5ZWIrVnBrV0hKeU9Md0ZSQnJ1Y0o1cGhqbThQYm1Ed09EOWdFOWlIcUpY?=
 =?utf-8?B?dzRtYjlnZWNhR05EU2hSL3ptbW51SERJa1hKTlBiTXNHa0ZYSnZ1bFpEOVlk?=
 =?utf-8?B?TVlOSCs4Y0EwR2hhL2JpbmlnS3FyY0taVXllbTF2RFcxek9KZmNwelBjRnVD?=
 =?utf-8?B?Ym43V2JIelVvNHhQekdFZWtDVTJxSXVGSUdjd1RlREs4QXZHUEFwZ2JLa0dP?=
 =?utf-8?B?N0ZyRkF1d2VTNVJiVmU2aXBxV1U2YjJBb1R4Zm9FWXR1UStEVFhWQ1l5TGdt?=
 =?utf-8?B?dWVNR0IveWhzN0dDYW1GYU8ybTl6clRrL0hYY1o2ZHhCZ2VpUmh4MnhOT2FL?=
 =?utf-8?B?UmZwampBQUF4MFNFdXRzMXN2NCtRUUdVSkVkb0tFYlVSYzUvQUUwZVhQelBz?=
 =?utf-8?B?cURMRi9nR2hDQm1aekVHSi94d25sbnRueE1oZHFoOWJweHZ3WnZsWTlyang3?=
 =?utf-8?B?U2ZPWWl6UGNoVlhKdWRKR29pZU1uSEhOOFZmU0l6Y2YxUnNVa00wVjVZczdN?=
 =?utf-8?B?WU9qSXZNUlZ6QktqR1BuWmlqNkNaMFo0dk9MYXhrem1yTDgwNEVyZndsemRN?=
 =?utf-8?B?TmNXelJGYjAxV2JTWkF6UjJxdHQ1L09oQUtXdXZyME1aQm9WSkZYQjkrNDJB?=
 =?utf-8?B?U1EvTmpHQjBxWDh4KzNyV0Y0KzRJODRtWTE0NFlTSmdYdHdFSDFWNktEaHg5?=
 =?utf-8?B?SFd2WkFRaUJYUzVqQ2hyamdlbkJYUW9aeGVwaWFtUTlnMEpyU20rU2E0enZo?=
 =?utf-8?B?SUk4VUZaTUVpc010bVozUDJuR2tVN01lbU5abHhzeHRuMHhQdWFoM0R4ZmQv?=
 =?utf-8?B?bi85cVpDQlQvME4xV0pOU3FXV1dXTGt5OENmdDdubm9GZ3dmUFAvZz09?=
Content-ID: <36F6E191ED46DD4B81892C9BB5B7B27D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0cb3d26-acc7-4d54-5d8d-08de83264d63
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 06:36:06.3053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eXrBqv4LdLkjP07v4FtDhkyGWb5h8f135c5Be+A+/LUXUD00sV9kaRRPByA+zo18aCPG4A8z2Rp6zv1GTYLr4+mQ/3RQJN+4PtKJ4GYgz6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8673
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_233616_287776_E0A5FAA6 
X-CRM114-Status: GOOD (  17.26  )
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

On 12/03/26 11:22 pm, Conor Dooley wrote:
> On Thu, Mar 12, 2026 at 11:29:25AM +0200, Adrian Hunter wrote:
>> On 12/03/2026 06:20, Manikandan Muralidharan wrote:
>>> Add support for microchip sama7d65 SoC I3C HCI master only IP
>>> with additional clock support to enable bulk clock acquisition
>>> for Microchip platforms using HCI_QUIRK_CLK_SUPPORT quirk.
>>> Introduce MCHP_I3C_CLK_IDX to define the maximum peripheral
>>> clock index
>>>
>>> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
>>> ---
>>> Changes in v3:
>>> - Make use of existing HCI_QUIRK_* code base
>>> - Introduce HCI_QUIRK_CLK_SUPPORT to handle/enable the required Peripheral
>>> and system generic clk in bulk
>>>
>>> Changes in v2:
>>> - Platform specific changes are integrated in the existing mipi-i3c-hci
>>> driver by introducing separate MCHP_HCI_QUIRK_* quirks and vendor
>>> specific quirk files
>>>
>>> ---
>>>   drivers/i3c/master/mipi-i3c-hci/core.c | 12 ++++++++++++
>>>   drivers/i3c/master/mipi-i3c-hci/hci.h  |  4 ++++
>>>   2 files changed, 16 insertions(+)
>>>
>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
>>> index 5879bba78164..6b7716bd517e 100644
>>> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
>>> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
>>> @@ -8,6 +8,7 @@
>>>    */
>>>   
>>>   #include <linux/bitfield.h>
>>> +#include <linux/clk.h>
>>>   #include <linux/device.h>
>>>   #include <linux/errno.h>
>>>   #include <linux/i3c/master.h>
>>> @@ -918,6 +919,7 @@ static int i3c_hci_probe(struct platform_device *pdev)
>>>   {
>>>   	const struct mipi_i3c_hci_platform_data *pdata = pdev->dev.platform_data;
>>>   	struct i3c_hci *hci;
>>> +	struct clk_bulk_data *clks;
>>>   	int irq, ret;
>>>   
>>>   	hci = devm_kzalloc(&pdev->dev, sizeof(*hci), GFP_KERNEL);
>>> @@ -946,6 +948,13 @@ static int i3c_hci_probe(struct platform_device *pdev)
>>>   	if (!hci->quirks && platform_get_device_id(pdev))
>>>   		hci->quirks = platform_get_device_id(pdev)->driver_data;
>>>   
>>> +	if (hci->quirks & HCI_QUIRK_CLK_SUPPORT) {
>>> +		ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
>>> +		if (ret < MCHP_I3C_CLK_IDX)
>>
>> Is MCHP_I3C_CLK_IDX really needed?  Why not just:
>>
>> 		if (ret <= 0)
>>
>> i.e. don't you anyway have to assume DT has the clocks defined
>> correctly.
> 
> Ye, I think this is kinda silly. Trust dtbs_check to have the correct
> number for your platform set, and let this be specific.

Thank you Adrian and Conor
I will drop MCHP_I3C_CLK_IDX in the next version.

-- 
Thanks and Regards,
Manikandan M.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
