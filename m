Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC57FCC6B1A
	for <linux-i3c@archiver.kernel.org>; Thu,  2 Apr 2026 07:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsKnn8bazg4PiyTp3UeaGyhNpBhvl7y+uEXDKoJ5wHA=; b=IsrVv66ax1U8Tg
	sjssbkGW0p+NVBRy6dbZHL82HkZu4S1klC49KMhs3KrY74xbSve8YWLN5awoooa1OlrBOXxCsIn0t
	veaOPNECbTd6xiMIoI7dHN0UpY6eUCiPyU77ZIASToAX+wvUEBotgXmi6A0RJjrkWyNXtDppczN0K
	9bCzrliI1zuvU/eVlT6LpFmSzy/kQ5mOHt6u57uA7v82qmAqIpKzCdlX8n4zGppgxSVp+QM2nbmk2
	l/yKyPExmrB79pO1fwAAzVR5kV4M8v9ZRG9wQif8dx1JYHmSkHp4qYycyN/lYmK5gz+/Lcwcpcz6o
	DNzEmTrhyxd+kEX//x3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CeU-0000000H6dB-2QDf;
	Thu, 02 Apr 2026 07:39:42 +0000
Received: from mail-northcentralusazon11013016.outbound.protection.outlook.com ([40.107.201.16] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CeR-0000000H6cM-2ZfS
	for linux-i3c@lists.infradead.org;
	Thu, 02 Apr 2026 07:39:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PYM7iahCddAMkz2xXk/FKCNBtiAuMZM153isVvoa2vCtbox2jYPs7nscTwofJLX5+BzkDKcUxrmJDPPeIaIShzgtQ6EO2JSuKOJOOL/sK4U4RKXdBpbwoeU9GiHJ8E34M0/vgujWV2RRXeLrnEmtjSch+322haj6vOPwN4yQrFXmZ/FHohJNU/HAsdH8Qu42SLuZ5k6/MvRt4WmfkZ8CjmoZ4JiRhXPirP91w733wuWQDJbcBbYg3xqHrpoXCfx9XBdVFPOW7eKVKSN6XMFpt0sLFRpC8zIJs18Hjez7YXwom/c99I1mR0oHnahiW9NNiYsAuCL84Ax2ea3ZYzHFMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Yg4hsM89qvM81cZ86T0RW41w5dH2csjqhC1Knkg/gc=;
 b=cfsY+l8LrfSKqApOJ/NAjDh8mHIrgqpK4zwD1Hw+BGq25b02KgBajy6T8J28rg0wSpsW//FwnhkH8ZOkmohZuOCLNY7b3K4aDxvHyASWGFh1vGMUUktPFSSNDSKj2zqPLqzBxS5XgCa+e/RGGmx9mws/TixViP3gDjjfzg6RG5/69LG1N4iBmeFUCsyFAf4G6fd/HYFArODmAkCJ4+m9vGQWEjAvchnwNQhBspGze+GUPAQXHGdE2zqOZuZj5AwYq62gzQ5Z7NivoSbqyOjsWbwZNZc05R3jt9RPI0dZp2v5kTWVrZ9pGurtPrxPwkqFVUUNSsAy3jYo2FAAi+MbUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Yg4hsM89qvM81cZ86T0RW41w5dH2csjqhC1Knkg/gc=;
 b=mGR7ATa4Ij+MFIFvj/AXUA37JDj2oZ3/uG6jNRoz/uDjnX1xMuySz6SHJpe6gtjV30qxFwi9SxXkS84Urw4jD2bH6BJmNWrwGDE6qEQwgVrGa3Nym1KLVTyhluZ9mMS3V3YEmwNcYHh7iIGcasxZY1XG7UAdbw3VlZqgJQWV3Cc=
Received: from LV5PR12MB9828.namprd12.prod.outlook.com (2603:10b6:408:304::19)
 by CH1PPF946CC24FA.namprd12.prod.outlook.com (2603:10b6:61f:fc00::61c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.13; Thu, 2 Apr
 2026 07:39:29 +0000
Received: from LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685]) by LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685%5]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 07:39:29 +0000
From: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "git (AMD-Xilinx)" <git@amd.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Joel Stanley
	<joel@jms.id.au>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>
Subject: RE: [PATCH v2] i3c: dw-i3c-master: Fix IBI count register selection
 for versalnet
Thread-Topic: [PATCH v2] i3c: dw-i3c-master: Fix IBI count register selection
 for versalnet
Thread-Index: AQHcwbP0iEhqjhKrXEiTcNwUXToqzLXJ7HIAgAF0jKA=
Date: Thu, 2 Apr 2026 07:39:29 +0000
Message-ID: <LV5PR12MB9828D700D168803CBD022A708151A@LV5PR12MB9828.namprd12.prod.outlook.com>
References: <20260401084430.436059-1-shubhrajyoti.datta@amd.com>
 <a9b3a99f42bb9d092e95b35290cf4043fc780d3f.camel@codeconstruct.com.au>
In-Reply-To: <a9b3a99f42bb9d092e95b35290cf4043fc780d3f.camel@codeconstruct.com.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-04-02T07:28:39.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9828:EE_|CH1PPF946CC24FA:EE_
x-ms-office365-filtering-correlation-id: bc2a47a6-a81e-4ff6-2dd4-08de908af8fa
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: amHqppALcrYcy+KCY0Ek1W40rHCqytEqiFvEO8yo1Y1lWrD7Br3WMxA+6IehogO3JzrioxY/xqd597kwYXtGAhi/7hqiYMO75Lmuk/A9N7zCaVZcciLUGrChny1qsrFbziqDjes49C4KWmhC0YAwGLdh4fPOzc41gJ/2VUQ0udQ/gAMN6HbMSqWaD9Zv0zxkFBTQ/LD8BF0LnmPVnyZVkRy8U4riROX+T9hEzdK1eEyjig2bwCz+GhePttg3A/FKWX+tUPmdcxa7W0aGpfdiwAHfkCbM8x1yD0BROtRoriFFwsO5s/D4KQkp8TvqvxQywoYlq8XyAiasjX151sEdcx7zWE3rPFdw2WoFpZXWGEzVfhrlY0WZLr1aMw2zJxo24VkaobUB0Q8YLe6k3vPcnV25gdiZU1IB0Lr9wp4FEMZqd0rI9sfk402RfH6k/3GOVzKTx0zvn3qQeXxHGUU5JIFRzcsZVcfX26wka/6WpYCScukulZAQaVeo9S9fkVwZC4mw10ZlTTSEblYW0acx/K63bBqD2lyN1y5n8OESBna4nlklji8S1pvwFy0FprpybAx8LtiW63SiuWxT8/5w8SeaSXctN23xWV/JyVWL+lH13zyzsHOwXgfa2PEJV4o9hGjYKzeVJ1x42XtQr47PSPUM5benCYK2LhKDV7i4cU9ZaydGyk/ZOuKzJXVUEUadjqJ4Pklp0v13NGZG0NNzSZgB9kMqrv721xiUM9deVk+aqR6xMJpgck/sM7XIVwmZBUyFmDMNNYv4+LTb41kd6LKNzrV1zWHquKA8Iq53nVs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9828.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnRYM1JaZzh4b3ZoNitnRlNBbTJ1ODE2aTFaYmlZdUQvQTBsQmM0OUV3SUJz?=
 =?utf-8?B?QjQwakpuaWQwSWRqN00rYnZmN1BockdheU80TFNpYUF6dXBESWxpZmZkL0pI?=
 =?utf-8?B?TE03L1daWjlhS3dpS0YzdXRFZmoraFhnWXNqcDR0K09TcUlCSGlZaE5FODVI?=
 =?utf-8?B?dUVJSGVFekF4R3RiRTl1ZjhWRGJuMHlKeU5tNlc2SjFrekh3N2FkQmdHREdH?=
 =?utf-8?B?TFhTVWxtN21VdzNNV0xlakRzeVRqb05sa0E0MjZzbkdZYUg4YmZsWnJVbTkv?=
 =?utf-8?B?a3JDOHV0cGVPbFNxcWRROXJ0SHpyajFra1Y5bHVOeUp4NDBMZm9weStWRHRw?=
 =?utf-8?B?QVBVTDJEbVloNVZYUXpieGxlN1AxUVIyUjlWbkttVFEyV0cwK3lTWndxUEcr?=
 =?utf-8?B?NXhYSVhvNHQxbmpubUVsSG9ML1pSQ1JHLzVCSHR3Ti9tcjF6bWpJWWdhTTdN?=
 =?utf-8?B?NGpkRmNBSU9aekxLbmRCaVVJQ05ER3dObzR5b2JTcjM4UDcyQVYrc09HZFdF?=
 =?utf-8?B?SXdiQk5PMTJ2OXIrd2wyT2IzTy90VVBXRHBrdjM0c2ZBVEF0UjNvSzFGOUxO?=
 =?utf-8?B?Z1BjRzl2MkxVOWE0QkV3RUl4QzBDWDdVV3ZxZHkwYzhiY2NtMG0wNU9CL05M?=
 =?utf-8?B?bXRRTVViMDNTQ1lGVzRiV0N4eWNPN2NLd256OHdFQUFLVFhuNlF2VytIS00v?=
 =?utf-8?B?WC9TNzJ3QmxlK1JqOTlPYnhEa091Szgva0VVVEJQK0pBY0s0U2ZJbGdSRFlB?=
 =?utf-8?B?SDlMM2RDRnNyaGxtZFUrVStCdnJ1VFZiR2R6aEFoWUtaT1d6dlJjc2Nsblhp?=
 =?utf-8?B?V0lGTmNpbVRJOXNtTTgwNXNUdEh1aTV3R2I4czVXaUphdEFiejhzL2FNVFRT?=
 =?utf-8?B?MHFtWWt4ajdtcllUc1JCQUhHOFdEWUFoRU9oYjQwNzJiOEtIdHR4bS9jb3NX?=
 =?utf-8?B?RVc1RkU4aE1KcGpndTFBaEdYY2dpYmVQaGJNOUFlOFBDYkt2cWQ5bUZuNFFG?=
 =?utf-8?B?MzlTYUtrTGpFQVVuempPT2JINkcvcTY3Z0VHQlpqWmExT1BZbXkzdEVnSEVW?=
 =?utf-8?B?b3QyRDVsRUFVWXd4am9VSndBQjM5SXVBOUFYdDRnOGJPTEhHbzQ4T0JPWVNR?=
 =?utf-8?B?VldDYTJnWTFoV2Zza1FrNXN2STdnb2lMSmdLcVg3ZkZuZVhYQzFMdVJlcm5F?=
 =?utf-8?B?NnRHMzBEM0NTVTZHRHY5R1lKRVQ5REFPQTFJdWpqTmdGL3VvQm8rbWRJZmV0?=
 =?utf-8?B?RVgxa2JuRS9FYUdIdmpDakoxdERzQkUrMG9ZMURLcE9WZE8xM3JpWlZKQUVR?=
 =?utf-8?B?WURWMGJpMFo4REFFeWVCbEpjVzF4RERIMzNNalVOQnk1L0JKU1FkNGszVS9V?=
 =?utf-8?B?cm1xR2hWSlk5cXFjT25NMHdZRDdRN3ZIeWNteGpTNHpmTXVQaExDWVFVUGt0?=
 =?utf-8?B?bkptejZrc3loNG0vVjNkRjRodUtlVTQ3VVNaTjZISWx5ZnFBMDJvQmpTWm1v?=
 =?utf-8?B?TXMrYUxUYnhSbmEyc3prcGlpSEw4OHpJb3ZycTc4OW1UNm14Y21QdHdNVlFn?=
 =?utf-8?B?TG9aUVdVcGNTQkNaaGx1SldMUk9Qc1lOZk1LaUFjUU5nOWtWYWtvQ2d2N3pt?=
 =?utf-8?B?b1lJYXFabFN6RVV4ZVhFYnprNzBVNWJ5MWYzVXV1UlI5NmZDN3oyRkVnd0Vp?=
 =?utf-8?B?dTdwdTk2RnBhc3l5SU9CY0JRb2lQNytxZU9OWFZsWmtBMDFod0w3aS80dC9h?=
 =?utf-8?B?UFZIaEJhb0Nmdlcyb1lBMnVDU2FTZlJmeDJGUEJGTC82U3dGZVhvRlZQL3RM?=
 =?utf-8?B?aC93QWVKYVY3eEROVFBpSEcwUGNwa0ZKdWY4WlhDcEM1WS9HTFB1UXV1VXdQ?=
 =?utf-8?B?NDRuOWgwdW1lcVNma2xOd0ZyWUNtWlhxeWhiTHBnTmo5VjFWeG43ZXl6eDdQ?=
 =?utf-8?B?RU00K0NxTFJQcWFHOVNFRFNmSUNNbzZjeGRHaGgxVnFSeEc5S1FzQS9IRHRw?=
 =?utf-8?B?RE5zVVFjMjVVVldSS0d3ZW1zZEd1aEZuZVJlM2NmcldxV29PNmdTbGd6eWpZ?=
 =?utf-8?B?dDlpcUZIWE5ZNEhaNTBSS242T1hrTnNFNThiZzBhY1dNMWdaeHRiTmU1MWhV?=
 =?utf-8?B?bXAxRDAvSk9tL282MDRWWlVMY2RaZzRJVEJsbWp0aHZkaWl0WVR0SDMvQVpr?=
 =?utf-8?B?d1ZnSko4TFRuZzJENEFCcjJKVWtMeGtwYjczRVNUbStockwydDJtN1o3VWdB?=
 =?utf-8?B?Z2pqN1ozLzg2WDZ2SEVieGZIWDBzb25DNHVRUWNjRy9KZWpsOXljcGRuZWJ1?=
 =?utf-8?Q?sucwFt2w477y5/t/VE?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9828.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2a47a6-a81e-4ff6-2dd4-08de908af8fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2026 07:39:29.0182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zI3o6ttJxST2yCfogoTdq0dU1ay/NQCQD1A2cbuDt/SGICSkTvUF3AIW0+Ab6/ZCZzcutytC9zrDOEYET48VHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF946CC24FA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_003939_693110_710B412C 
X-CRM114-Status: GOOD (  24.37  )
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

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKZXJlbXkg
S2VyciA8amtAY29kZWNvbnN0cnVjdC5jb20uYXU+DQo+IFNlbnQ6IFdlZG5lc2RheSwgQXByaWwg
MSwgMjAyNiAyOjQ0IFBNDQo+IFRvOiBEYXR0YSwgU2h1YmhyYWp5b3RpIDxzaHViaHJhanlvdGku
ZGF0dGFAYW1kLmNvbT47IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IENjOiBn
aXQgKEFNRC1YaWxpbngpIDxnaXRAYW1kLmNvbT47IEFsZXhhbmRyZSBCZWxsb25pDQo+IDxhbGV4
YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT47IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPjsg
Sm9lbCBTdGFubGV5DQo+IDxqb2VsQGptcy5pZC5hdT47IGxpbnV4LWkzY0BsaXN0cy5pbmZyYWRl
YWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIGkzYzogZHctaTNjLW1hc3RlcjogRml4
IElCSSBjb3VudCByZWdpc3RlciBzZWxlY3Rpb24gZm9yDQo+IHZlcnNhbG5ldA0KPg0KPiBDYXV0
aW9uOiBUaGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9tIGFuIEV4dGVybmFsIFNvdXJjZS4gVXNl
IHByb3BlciBjYXV0aW9uDQo+IHdoZW4gb3BlbmluZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlu
a3MsIG9yIHJlc3BvbmRpbmcuDQo+DQo+DQo+IEhpIFNodWJocmFqeW90aSwNCj4NCj4gPiBPbiBE
ZXNpZ25XYXJlIEkzQyBjb250cm9sbGVycyB3aGVyZSBJQ19IQVNfSUJJX0RBVEE9MCAoc3VjaCBh
cw0KPiA+IHZlcnNhbG5ldCksIHRoZSBJQklfU1RTX0NOVCBmaWVsZCAoYml0cyBbMjg6MjRdIG9m
IFFVRVVFX1NUQVRVU19MRVZFTCkNCj4gPiBpcyBoYXJkd2lyZWQgdG8gMC4gVGhlIElCSSBzdGF0
dXMgZW50cnkgY291bnQgaXMgaW5zdGVhZCByZXBvcnRlZCB2aWENCj4gPiBJQklfQlVGX0JMUiAo
Yml0cyBbMjM6MTZdIG9mIHRoZSBzYW1lIHJlZ2lzdGVyKS4NCj4gPg0KPiA+IGlycV9oYW5kbGVf
aWJpcygpIHdhcyB1bmNvbmRpdGlvbmFsbHkgcmVhZGluZyBJQklfU1RTX0NOVCwgY2F1c2luZyBp
dA0KPiA+IHRvIGFsd2F5cyBzZWUgMCBwZW5kaW5nIElCSXMgb24gdmVyc2FsbmV0IGFuZCByZXR1
cm4gZWFybHkgd2l0aG91dA0KPiA+IGRyYWluaW5nIHRoZSBJQkkgYnVmZmVyLiBTaW5jZSBJTlRS
X0lCSV9USExEX1NUQVQgaXMgbGV2ZWwtdHJpZ2dlcmVkDQo+ID4gYWdhaW5zdCB0aGUgYnVmZmVy
IGZpbGwgbGV2ZWwsIHRoaXMgbGVmdCB0aGUgaW50ZXJydXB0IHBlcm1hbmVudGx5IGFzc2VydGVk
Lg0KPiA+DQo+ID4gRGV0ZWN0IElCSSBkYXRhIGNhcGFiaWxpdHkgYXQgcHJvYmUgdGltZSBieSB3
cml0aW5nIHRoZSBJQkkgZGF0YQ0KPiA+IHRocmVzaG9sZCBmaWVsZCBpbiBRVUVVRV9USExEX0NU
UkwgYW5kIHJlYWRpbmcgaXQgYmFjay4gVXNlIHRoZSByZXN1bHQNCj4gPiB0byBzZWxlY3QgdGhl
IGNvcnJlY3QgcmVnaXN0ZXIgZmllbGQgaW4gaXJxX2hhbmRsZV9pYmlzKCkuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBTaHViaHJhanlvdGkgRGF0dGEgPHNodWJocmFqeW90aS5kYXR0YUBhbWQu
Y29tPg0KPiA+IC0tLQ0KLi4uDQoNCj4gPiArICAgICAgIHdyaXRlbChyZXQsIG1hc3Rlci0+cmVn
cyArIFFVRVVFX1RITERfQ1RSTCk7DQo+ID4gKyAgICAgICByZXQgPSByZWFkbChtYXN0ZXItPnJl
Z3MgKyBRVUVVRV9USExEX0NUUkwpOw0KPiA+ICsgICAgICAgaWYgKHJldCAmIFFVRVVFX1RITERf
Q1RSTF9JQklfREFUQV9NQVNLKQ0KPiA+ICsgICAgICAgICAgICAgICBtYXN0ZXItPmhhc19pYmlf
ZGF0YSA9IHRydWU7DQo+ID4gKyAgICAgICB3cml0ZWwodGhsZF9jdHJsLCBtYXN0ZXItPnJlZ3Mg
KyBRVUVVRV9USExEX0NUUkwpOw0KPg0KPiBIb3cgYXJlIHlvdSBiaW5kaW5nIHRoZSBkcml2ZXIg
dG8gdGhpcyBkZXZpY2U/IEFyZSB5b3UgdXNpbmcgYSB1bmlxdWUgT0YNCj4gY29tcGF0aWJsZSBz
dHJpbmcsIG9yIHNvbWV0aGluZyBBQ1BJLWJhc2VkPw0KPg0KPiAuLi4gYW5kIGlmIHRoYXQgY2Fu
IGJlIHNwZWNpZmljIHRvIHRoaXMgaGFyZHdhcmUgaW5zdGFuY2UsIHdvdWxkIHRoYXQgYmUgYW4N
Cj4gZWZmZWN0aXZlIG1lY2hhbmlzbSB0byBzZWxlY3QgdGhlIElCSSByZWFkIG1ldGhvZCBpbnN0
ZWFkPw0KSGkgSmVyZW15LA0KDQogVmVyc2FsTmV0IGN1cnJlbnRseSB1c2VzIHRoZSBnZW5lcmlj
ICJzbnBzLGR3LWkzYy1tYXN0ZXItMS4wMGEiIGNvbXBhdGlibGUgc3RyaW5nIOKAlCB0aGVyZSBp
cyBubyB1bmlxdWUgY29tcGF0aWJsZSBzdHJpbmcgZm9yIHRoaXMgaGFyZHdhcmUgaW5zdGFuY2Uu
IFRoZSBEVFMNCiAgIGVudHJ5IGxvb2tzIGxpa2U6DQoNCiAgY29tcGF0aWJsZSA9ICJzbnBzLGR3
LWkzYy1tYXN0ZXItMS4wMGEiOw0KDQogIFNvIHRoZSBjb21wYXRpYmxlLXN0cmluZyBhcHByb2Fj
aCwgYXMgaXQgc3RhbmRzLCBjYW5ub3QgZGlzdGluZ3Vpc2ggVmVyc2FsTmV0IGZyb20gb3RoZXIg
RGVzaWduV2FyZSBpbnN0YW5jZXMuDQoNCiAgV2UgY291bGQgaW50cm9kdWNlIGEgVmVyc2FsTmV0
LXNwZWNpZmljIGNvbXBhdGlibGUgd2l0aCBhIGdlbmVyaWMgZmFsbGJhY2s6DQoNCiAgY29tcGF0
aWJsZSA9ICJ4bG54LHZlcnNhbG5ldC1kdy1pM2MtbWFzdGVyIiwgInNucHMsZHctaTNjLW1hc3Rl
ci0xLjAwYSI7DQoNCiAgYW5kIHBhc3MgYSBxdWlyayBmbGFnIHZpYSBvZl9kZXZpY2VfaWQuZGF0
YSB0byBzZWxlY3QgdGhlIElCSSByZWFkIG1ldGhvZC4gSG93ZXZlciwgdGhlIHByb2JlLXRpbWUg
ZGV0ZWN0aW9uIGF2b2lkcyBoYXZpbmcgdG8gZW51bWVyYXRlIGFsbCBhZmZlY3RlZA0KICB2YXJp
YW50cyDigJQgdGhlIElDX0hBU19JQklfREFUQT0wIGNvbmZpZ3VyYXRpb24gaXMgYSBzeW50aGVz
aXphYmxlIG9wdGlvbiBpbiB0aGUgSVAgYW5kIG1heSBhcHBlYXIgaW4gb3RoZXIgU29DcyB1c2lu
ZyB0aGUgc2FtZSBjb3JlLg0KDQogIERvIHlvdSBoYXZlIGEgcHJlZmVyZW5jZT8gSWYgdGhlIERU
UyBjaGFuZ2UgaXMgYWNjZXB0YWJsZSwgSSBjYW4gZ28gd2l0aCB0aGUgY29tcGF0aWJsZSArIG1h
dGNoLWRhdGEgYXBwcm9hY2ggLg0KDQpIb3dldmVyIEkgdGhvdWdodCB0aGF0IGRldGVjdGluZyBp
dCB3aWxsIGJlIGhlbHBmdWwgZm9yIGJhY2t3YXJkIGNvbXBhdGlibGUuDQoNCiAgVGhhbmtzLA0K
ICBTaHViaHJhanlvdGkNCg0KPg0KPiBDaGVlcnMsDQo+DQo+DQo+IEplcmVteQ0KLS0gCmxpbnV4
LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
