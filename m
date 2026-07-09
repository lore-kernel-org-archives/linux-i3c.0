Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238BAC44501
	for <linux-i3c@archiver.kernel.org>; Thu,  9 Jul 2026 09:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EjYX9oecF++14VvhvkkE5MWQ0DjfTOHEqFAJkfMdnEk=; b=BIPnTTf2so7w9W
	G4LQeJgp+F/OCu7wyNTm8bmnXaOuXCK153zuWHElTHNRbA9X1LIIslTa4S7KTxCfuWKPRNvooecgJ
	znPXxO1t29ZXzTjQEYuvDGyK0yVmHdAf5T+U9AAnJEn4yye1mziDUAAtFMuW4K9Dk3SOomN0l3ybn
	m4bAPFTmwJipyMTdKpFFai5Ky2z2VxVm+9rFnvzg4qNmw2iRdJ1k9es1iRt+yFPErAgnK5q1/sskO
	uMEts5/cTaSpbZw+WNTOR7fReEAyh/DdZZdtK1SXmiUZ4fB1ipfNn5XeUlyrG1Wsq+LJZEq8TUFyl
	danoNI8xTeojpd2rIDEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkcC-00000001hWy-3fW1;
	Thu, 09 Jul 2026 09:00:16 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkcA-00000001hWE-0GhU
	for linux-i3c@lists.infradead.org;
	Thu, 09 Jul 2026 09:00:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdbuOO+zNvRptebYaXseg2fbsezl/a+HX7JoBPCWz35khRb7iM9mpJQ7OaMnFCM8SXRMbXwZtk6nqVDUNuylRbHQiPpxKBgK4IdtVFEJuaz6szOyKvgLva1hE+hJd1ptYO1+bxptGlsAqBXzssoYUhfdPjMjQlqYYH9tuxy8PW5j+yIgh44+Tcq9lOkDU3MBUNZffuweRZSjt+2ivSEU/HmJ9DdR3279Dv5HMf+YGedH5vquvykyHJ8EYCQm+UD1Jg9t752NjNcJJ/LXzyz8rS9Oh6F2qYrusDZQaeLVcYppneCeWusFnsjQjfubJdKc7A9iAn+kX0ZRaYzBCs35wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l01SNbw3rT7RTupgjKqlM2ePH1Bp9/iqqch7W+HKMsI=;
 b=iyeP9JIbd3iKg279u1jU1XjzyvwW0h2Nx3ECofys6Fo1E7FnOSNV27epRr27GqDuiP/T2p6gpgTfMMc7vlpebR+Y434zMB5INI5/wxmmpyOWTl9rUO1X7cVJ7hPfXzYCxhDooVLCPuNDlgNUDc5SCvfxDfHZWFmDGe8Yx4uyw1HblumdJiBQr7DWnwpm8e2MxDVgG7kz7NjnNPwwhSrYgAQZVSWYyUzPOvkXcSULF34ZctveLQbLfm02DZ+j1sEyUI3Tz8/xqJLg2b1FFvelJEp3Gcio7Qy4axJmugogfwsWHYlHGd26cZrgk1lL73QIODKHd2AoRe3e8Y/fF1Xb3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l01SNbw3rT7RTupgjKqlM2ePH1Bp9/iqqch7W+HKMsI=;
 b=Zf4F8lanoqvTqJ42bjQ3u6z8CQMkp1HA7f/UBQTmpW1i8Dypyykm8+xOBw08KtLOJthkynwYC0PyB2+Bcqo+FTqaeX9p19bM19QovZq9WQXDTHO8WHuyCClLwpsU5ZkxpwGngduOVJXzX55U/LAOR0bCH8VOITnrIbdsUiuyPEk=
Received: from LV5PR12MB9828.namprd12.prod.outlook.com (2603:10b6:408:304::19)
 by SJ2PR12MB8832.namprd12.prod.outlook.com (2603:10b6:a03:4d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 09:00:07 +0000
Received: from LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685]) by LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685%5]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 09:00:06 +0000
From: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To: "NG, TZE YEE" <tze.yee.ng@altera.com>, "Guntupalli, Manikanta"
	<manikanta.guntupalli@amd.com>
CC: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>, Frank Li <Frank.li@oss.nxp.com>,
	"Goud, Srinivas" <srinivas.goud@amd.com>
Subject: RE: RE: RE: [PATCH] i3c: master: dw-i3c-master: fix OD timing for
 first broadcast
Thread-Topic: RE: RE: [PATCH] i3c: master: dw-i3c-master: fix OD timing for
 first broadcast
Thread-Index: AQHc+LEtZd2DpZcCgEm4F8t9yIwuN7Y3dzOAgAIUOgCAAQW1gIALBfKAgAfAwvCACvCcgIAANbCwgAxsrgCAACYHQA==
Date: Thu, 9 Jul 2026 09:00:06 +0000
Message-ID: <LV5PR12MB9828AC9C97DA5FA9C82993F781FE2@LV5PR12MB9828.namprd12.prod.outlook.com>
References: <ebddb8b62eae92de0a7eeda93cb18213c677ae96.1781077653.git.tze.yee.ng@altera.com>
 <20260610083656.334CA1F00893@smtp.kernel.org>
 <airgnoB0Uh60mn8T@lizhi-Precision-Tower-5810>
 <ccf5721d-3193-4a2d-b1df-23e1c648eda3@altera.com>
 <48947d4c-32a7-4f60-b5bd-c0881e76831c@altera.com>
 <CY8PR12MB76110BF12DB1557B0DBEC0F78CED2@CY8PR12MB7611.namprd12.prod.outlook.com>
 <7e432dc6-fe48-44c7-8a04-f80eb7d56673@altera.com>
 <CY8PR12MB761142838F98DC828AF472248CF62@CY8PR12MB7611.namprd12.prod.outlook.com>
 <e36678e7-1c2f-4d2f-b0dd-c1ef2e533669@altera.com>
In-Reply-To: <e36678e7-1c2f-4d2f-b0dd-c1ef2e533669@altera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-07-09T08:58:29.0000000Z;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD
 General
 v26;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9828:EE_|SJ2PR12MB8832:EE_
x-ms-office365-filtering-correlation-id: 0ca8b290-b27c-4c51-2ab4-08dedd98789d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|18002099003|4143699003|22082099003|38070700021|11063799006|56012099006;
x-microsoft-antispam-message-info: m5FfR0HumZm8gxOEfYPApSZGoHPugZqx8Yd4vc5UXSZb3moDUyN4vGLjC+dwdjSBH9kcZmMXEc0ymeviz0jVSvLppTDe2Dz0dw96DvmRNc+9wynBxyR0wC7mwAZDRsffjM3dC3aDPPdqppsamb52tLkmWApFsLQEoNP4DTFCQKCvUMq94y4vvOgdYc+/r1WENh3JnrHZghr82+A/ABtION8IGskpHnhRjaim7mLuT9H4XgBxKvsi7mC4d0h+jvQoYLuHlv2TqNkYh1zpFB1FdTOEEwPZGh21cf5YXdspduqiWr7wg45KH3WNV5XGr2aTqRqLL2jnh+mBMEmta7CpGN9ByYKZwUykgcVW1YQcwArHJrGHL8Mxrer9MyJ5Iz3pnNWy/NqIn5A/BazoHSURwW1LEl4lCl5ML4uftg0yIHiqbIzlaQwj3Pn4uOaal9C7HPJMm505ib9QGredWK1Zk3EydOGnRRbg2YS/q7vGwgh6XlQ/CcLqP4f36/+to7I+Zez+/cbWyqgmVtSG4Id8Xej2Gwy3YoBnhlHqY6Hs8O99GfqwrVr3GCg4nEa5Tuqr5bpMmrZ/clQLtFn7ZPcuwLqSDsOfhZk3sESPA4YiAMVo1l576gthgbCMYqKaKC7bFmFKf+rjKtCkNyq4DKDIswlqWJ65ker9LATXkHEW0mnuY/auvlnkg75wSCiuVdAW3UJ5CM4rSVlEzjMiXPZJobrPWW1lEWfcSagS8T5TAYY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9828.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(18002099003)(4143699003)(22082099003)(38070700021)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qm9UeVFoUThwSGJDbGprOUpOdGdENFlNZVFkdGNnZGJjWUFVamZzeEZMZlJ0?=
 =?utf-8?B?TVJPMDBkNVRsZzhxVFN3U25oeW1YcnpFODU3ZU5LSFJqOVcrV04xdTBENEZQ?=
 =?utf-8?B?MEQ2aGRtOEJNS3F1bVBKalFIR0xGcmZQbWh1bUU0eWY2d1VyeDZnUDkzV29u?=
 =?utf-8?B?NnJZNE1NeFFSNmd2VERIdSt6Yzh3RlVQaHUwNDE2aFh4ZGg5T3UxTWJ2WkZ5?=
 =?utf-8?B?MkxWMkpSWTEzWVBITmhpWC9hdXBwUkRLR0UxQkp5aFNGYTZ2QW1DdEJGQ2t5?=
 =?utf-8?B?WVUvN1F4LzdaSVdiNGdKZzdRRXM2V3lmN0J1YlZQMVRkUFZjU0ZJNWV3TlpB?=
 =?utf-8?B?UlVVY1M1dFBOV1ptS29xczRoamtubmV1bkx6TXFpbnpwb2Y4NU0ydXlsN2Rp?=
 =?utf-8?B?TlgxU21TZWNlV0dNR2plY2pPYmdOZGZPanRsSnJCOS9lVnRiWE4vcTlJcmo2?=
 =?utf-8?B?bXBnN0JJbFphR2VTSWJuZ1dnQTFLb1ZMMzFJMW1GelpML0pxZ2U0L2xrbUp5?=
 =?utf-8?B?S0RUcWUxaGltTjVTTEFaMmRwUWpBTTN3TDMrK2xWS3MvcUM5d0wvejlnYUZV?=
 =?utf-8?B?ai9kTFZxT051STNVSkcwVExESGYwWDdqWUNVMVgwVDNjWFVQa21HdzN3cDAy?=
 =?utf-8?B?OVJFTGorQ2dvd0hBNlJsV0dud1dHRHk3OUc3OHpwZm5hbmVMYVpMRjFJVGZx?=
 =?utf-8?B?UmI0cUN5YWhGVXE5WmUvK1lTN2RCSDdxenN1YzYrZ2NGNGRJWGtZUWhQUy81?=
 =?utf-8?B?ZEZUU1huWUtHaGo4cDlCc0lBbEdGWmUxSlJTTW9SRFh2c2RyYTg4VzFEaEZE?=
 =?utf-8?B?Z0dSczhBZVNDUklkNlRzWDFwSjFVOWdIV25JNHhudWQ2b2dnTG5YdmxNV3ll?=
 =?utf-8?B?QjNjeHRrU3dMcTl3Q24xaTRpTlpEOGZmRmlPNncyV0RQMW10MmozTHMzV1V4?=
 =?utf-8?B?c2J0V1N4U1N6a0g0SytzL2VpbUpweGZrWVg2Ty9qWWo0dGFtUlUvck9xL0Fx?=
 =?utf-8?B?MkxmYUVHWUZJMTdabWdUSUxmSEpsZ2xFMG53bmY0QU0ySzlsL0JBb3lWYVBr?=
 =?utf-8?B?K09lNnBhbko5MFVKQWU1UVpkMnFCbjZtV3BvSE0wNWNIRjJ2VktnK0RuVFkz?=
 =?utf-8?B?cHBaS21CMHhPTXFheC9icHJDSzdCSWJ6VXd4WDhMYUwydnhmRXhhem9SWkQ1?=
 =?utf-8?B?U3hnWGhSVUwveVZLc0VGRzlsK3NWVkV5MS9CY25ZL1BURkFSbVRqbXljWnhz?=
 =?utf-8?B?cW43YW1LTDA1WGlVTGhkRW1qTDlOdyszL3gwWUpMb2lrRDlna1JMWEE3QWpx?=
 =?utf-8?B?RlhYUlEwRVpqRzQzZjBuM3NmYTdhQWdGSUU0MWhEa1QzUnVRb0c4a041NExI?=
 =?utf-8?B?RFpQdWo2YzJTRzFjSGlsS3lBRWRUbFFZUTdORThlMjBFTTNyZGdRMXl0bytP?=
 =?utf-8?B?OXhDcFpSa3c1bU5pUnJ2QkEyUXlPLzJZWURlZkdQc1V3Q29YK2lJYkFOblVN?=
 =?utf-8?B?L2lmc1VZYVZHV3lIdXI4ZWxqNytkUXJ1UGo5UUEzSmYxL1V2eU1IeXlYUjQy?=
 =?utf-8?B?d3N6cThhMFVaWHZsVnNlT0lvc29raXp3Ym51dzFoN2ozdjdsTWZxMzZkUzRO?=
 =?utf-8?B?YWVmSWdoWkJvUVpVaXFoYXhTOVg1T2h3RjhDSmtONXdydlFuU0dwelN3cy9N?=
 =?utf-8?B?MFB2VXZvK1VjQUpPN1JMOERqVWxBYXVIMUhXNnEvbU9jQ3hhRlBaNzllaFNS?=
 =?utf-8?B?bzFweFlSZlNDZ2taQTVoL0RMNlRHMWlGWGdNREhDZEVPZllsUXZTdVJDZ0hY?=
 =?utf-8?B?WkJ3M2l5Um11aDc1U1UwbHAwRjBSVHp1MGRacUxCVlIrNDM2bWlySG1ZR0pC?=
 =?utf-8?B?cnlaNXZrZUJRM08xYXN4Mkl0cUo2bVZQRWwyd2hzeDBCejFCMm1jVGx4Q1Fz?=
 =?utf-8?B?ekVBQSsvUUZldHNMT1VNSGpZYmpMTFJ4VzkwVkRtcVE5WjZnNk1Gd0FpbWJs?=
 =?utf-8?B?empCQzU2TnROSUFURXBuRDZlcWZyRDFYOVJIa0hFRWNyVnBRODVvZ2xCK3dI?=
 =?utf-8?B?U3l4UFZWVzZlcTdtOXJzbkRnbW04c05OYWJuV2MzUmxMQU9HbjdVbTZyK28x?=
 =?utf-8?B?TmRnRXliM1pqQnhQOWRRQks2TFBLSUhGT29XSDdIQ2JuT0lpOWZ0b0w3QXZD?=
 =?utf-8?B?MEhwSHdHOXZOb1pWUnQ1d0ZvZk5tZENIYkJaM2FKWlpJWjN1Q3c5a2wyMjIv?=
 =?utf-8?B?OGtja21ReTdGbDFnYlpBYlRTY29xMTNXQnpwTFdTcW9xV3g2VUEraEoxS3RD?=
 =?utf-8?Q?KTEjbx2HnUOLJSm3yf?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9828.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca8b290-b27c-4c51-2ab4-08dedd98789d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 09:00:06.1391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9eHI6iPopwwekB2w/zZrVM+VA321B04PJ+Prwj06YGQJGPyv8o6USgz00Pni9IyKhG2KxdkCeEUQQWXPnxkogA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8832
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_020014_108320_40A176F3 
X-CRM114-Status: GOOD (  13.28  )
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

AMD General

> -----Original Message-----
> From: NG, TZE YEE <tze.yee.ng@altera.com>
> Sent: Thursday, July 9, 2026 12:12 PM
> To: Guntupalli, Manikanta <manikanta.guntupalli@amd.com>; Datta,
> Shubhrajyoti <shubhrajyoti.datta@amd.com>
> Cc: linux-i3c@lists.infradead.org; Frank.Li@kernel.org; Frank Li
> <Frank.li@oss.nxp.com>; Goud, Srinivas <srinivas.goud@amd.com>
> Subject: Re: RE: RE: [PATCH] i3c: master: dw-i3c-master: fix OD timing for first
> broadcast
>
> [You don't often get email from tze.yee.ng@altera.com. Learn why this is
> important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Caution: This message originated from an External Source. Use proper caution
> when opening attachments, clicking links, or responding.
>
>
> On 1/7/2026 5:06 pm, Guntupalli, Manikanta wrote:
> > Public
> >
> > Hi,
> >
> > Adding the below contact:
> > +@Datta, Shubhrajyoti
> >
> > Thanks,
> > Manikanta
> >
>
> Hi Manikanta, Datta,
>
> Gentle follow-up on the AMD AMDI0015 quirk question below. It has been
> about a week since Datta was brought into the thread, and I have not received
> guidance yet on how ->set_speed() and send_ccc_cmd() should interact with
> AMD_I3C_OD_PP_TIMING.

Will check this and get back.
>
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
