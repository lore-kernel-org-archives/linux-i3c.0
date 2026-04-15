Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34ADFA0C3B
	for <linux-i3c@archiver.kernel.org>; Wed, 15 Apr 2026 06:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HsUMTS5iusQqX9h2VWFEaQM5fl9psBdbHA+6/mkIshg=; b=xDxR7hCrtIpmMn
	HtdrcL1FNjqmSra9pEW4Ttufau3NU/OUEcYVYWH6vzKtPWzAHKUPK/c2NubgaxtNQ6mqbdB0R+BPK
	PiwQcdhuy+OPaLjHmlvNTVzbl2AsRJTcv6dqAz92lFcJRxVEAVYwMP/sZWWgLGl53N0hCmrUuyFIV
	z/ncZiDxfDu78BcVEykHsOf8o3AgQyuuv8t250dm6WNMlR1HlOngUqBWsJisPfdAhBNqPsL/BYt8p
	+QPvahCL9/SUSETyAxw1/jdhz0XYwltEBNRZ23b13rwk5IMA6lvc//EQrGN9ePhTyYcTt62bIUdFU
	4dhTdOyIuDohUuamV23g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCu9D-00000000gaB-2c5v;
	Wed, 15 Apr 2026 06:54:51 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCu9A-00000000gZf-317y
	for linux-i3c@lists.infradead.org;
	Wed, 15 Apr 2026 06:54:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZjcUTHjIpXvnVjPTCcnyYado2FrcUkWFI+TUyzeJJ389pjAjJSQgCX0+MAgORDuSaNIBFJL2/1KoW3MXTosbGFfBdTEzYSlH1TyCra0gDEysCnmPCI9GMEZ9zgj/BzsmAvoMX98P15OXHZ0PwhwhjzDK2nA/hbjpmLo8WPjLA6hjWNJRwW6RHWw55N9R84tdLwvxTPTNfhD9exqF9IXyS/NvHOEdsOo/lGnTjg8gkRYBQJ2vFurnTK4dzInfEQp1Qtt9oCRZBcJUDFesqgYKdXfeiuKjIAnG8ouPl169Cdx889Q6d6ZXDlIVHacjESFo1zgVpdLujAO/gBAxQBJS6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtBHtV3oDRL0RbwqyR4BQIHf96aE8o2joUbvxsnvTF4=;
 b=zNcPGvHSsll4DeXVpXypD4T6M3WnXDtYxXwgM0o9LMbBFACgh9dK7KJ313Z4KUUUQkbou4vHWbyguSdi9PJep4THV49v6Wv7jZ4G2Sc126E18e4Q8ctxNz2Y0Vr0DGrSPbd+Ee3B22nEJpR4taN9NI3CrMyfGCrDD+ug9aGOhTYelSCdu38AX40Ix/Nsy3a0gA7LsvbDtT6hmp2o0y/vzCyi4tHmkihVdOdTNKIqJSTljCeNQHm7IfdhsYnyL2GuzG18A6gNzAMXF9vjywkYYDNoV8SC7ejD96aPIORnk6xe5FXrDUIa8NOPJ1AWcI0crpri0iUqLY5rEJKFmbndDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtBHtV3oDRL0RbwqyR4BQIHf96aE8o2joUbvxsnvTF4=;
 b=hwHLyJ7ywPTczZnf9vw1iPbAFEINshWbvQE5qFvqilzFL8S60A18qWWFgBJ66+QRPQVgMP1U+DJW2N2sgesmKRiKzA3R3pTAqtQYJ1qzAPIYd8nYHdAz9o2JAkM37w6RJjHvqZmzVyAX6YQs+2qxy52cbGl7DEzN7m1fZKQQ0Iw=
Received: from LV5PR12MB9828.namprd12.prod.outlook.com (2603:10b6:408:304::19)
 by MN2PR12MB4303.namprd12.prod.outlook.com (2603:10b6:208:198::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 06:54:36 +0000
Received: from LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685]) by LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685%5]) with mapi id 15.20.9791.032; Wed, 15 Apr 2026
 06:54:36 +0000
From: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "git
 (AMD-Xilinx)" <git@amd.com>, Frank Li <Frank.Li@nxp.com>, Joel Stanley
	<joel@jms.id.au>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>
Subject: RE: [PATCH v2] i3c: dw-i3c-master: Fix IBI count register selection
 for versalnet
Thread-Topic: [PATCH v2] i3c: dw-i3c-master: Fix IBI count register selection
 for versalnet
Thread-Index: AQHcwbP0iEhqjhKrXEiTcNwUXToqzLXJ7HIAgAF0jKCAABIXAIACFkMAgAdhI4CAABDIgIAKyTfQ
Date: Wed, 15 Apr 2026 06:54:35 +0000
Message-ID: <LV5PR12MB9828E418D82343404810670181222@LV5PR12MB9828.namprd12.prod.outlook.com>
References: <20260401084430.436059-1-shubhrajyoti.datta@amd.com>
	 <a9b3a99f42bb9d092e95b35290cf4043fc780d3f.camel@codeconstruct.com.au>
	 <LV5PR12MB9828D700D168803CBD022A708151A@LV5PR12MB9828.namprd12.prod.outlook.com>
	 <5cb83afcd5340a108fd5a7346494ccf73752cc27.camel@codeconstruct.com.au>
	 <20260403162442668f12b7@mail.local>
	 <f6253217-4b40-4d0e-b2cb-085c3d090b71@amd.com>
 <f202840ba1053f9d14655c9f6310298ba3e9c5a1.camel@codeconstruct.com.au>
In-Reply-To: <f202840ba1053f9d14655c9f6310298ba3e9c5a1.camel@codeconstruct.com.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-04-15T06:49:39.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV5PR12MB9828:EE_|MN2PR12MB4303:EE_
x-ms-office365-filtering-correlation-id: e4841b22-214c-44a4-9396-08de9abbdb2a
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: n/MfbS26ZSvtHhxGlVMgGBvB+PxAMCJw43/ORdRTVAfCHgElpf9BzgxrD/M230jWhDUCn3a7rOpgux8d3mLSDDo+WKI8akv+9VqVtPDbuzxsIVx+VMxKdT/GETpoq/wrVJKu/pOK+NU1IQW0ubTDnDoNj14TT+kYkBU/Y9FRwIXvtOj57Ib4E6xJB+gtvT0SnrGlCuxscxaZhwFeQne/N2oYkFFM1U28XxMXrUmeCwvGmjhIOxZ3qZTxWzZs7o8rh2MsxYmUKRBSsgbuxlQk8Kluhi/pE1uEdx9q4IMe7MHJZFI8F8V6dGBWkamBu6DBySbHxHoPVxzIf28W1TY/M1NzUXIvWYwY0DIsXKbpP0od5F0C3saKTWj7Gb1axSfdHIiS8uBJaWPWKkJ3S+D1/ymMx27ui1nUfUR8XUmXTO4uc5iFkEJZunJtUqFUr0A+mgzhVJ58s3AM+lJk/DbpIi7hUcTu2SGPMCi15Xz8NSMLVdjHuyZT/m8BCgCuhjKP1N19ri5wcF80v2gCdo1eqMIE/8yOOnbSbHP12wphiCx/ad5Q+E77wr3sjARv3dDa3VCc+OWarSO0dfADLIdl0MJpAuawuVRJ3Q2HI0mvKstfvOLWAu3+zW7obE/OgJB+sNItqdv+smL/BtxUW7Fm3P0kVOSLbStzDwOHOf3VIf9iEr8TomPgu5BO/dApXjnK1V+QJmNVYHLxu1qiI1+AHsyarkgQIN5tg+69nhn3XxN8uLqdonxgwtSPMCIeQB2PPtid2scXZrKDTmu6kN4B9sSd0HOhvATM48Fu0ASaVk0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9828.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2xETzk2dUM4UmhqREZadXFLWlJCR09tMEhhOVJNWW9WRDBuQ3k5RnF1ektR?=
 =?utf-8?B?V1VpQmxRNUVSVWRYWDJCbk1qUWN3czQxay9ZYVlQK0RlWHRtUjY0d1pQZVg4?=
 =?utf-8?B?UFFQSnJYUnZzLzlUQUY0elc2dUhnUjV5SUVtdVlGQ1VWbFhhdGwranZJZDRR?=
 =?utf-8?B?NWZGYUNDMWNuOE9PYy9uTGs4V2x1Sm00eWc1WG0wODY2cTVvV0xEWjZmcjht?=
 =?utf-8?B?ekFWUGpEK0d5Q3hFWmVqU3N2TitMbGl2SzJUS0NtQTI3SUk1YW5nYjcvNlVO?=
 =?utf-8?B?ZGQwakd5d00wY1lwaWVHYTZ5RXJtT0libkpEbnN2cU4zVjBWOVcwNUFXSnBP?=
 =?utf-8?B?MGVPV0dTRkRTdFdVeUIxK1ZuaFRxbEtaYUpoVkxXRGY0QjhhL3I3MHdrb0Fv?=
 =?utf-8?B?eHJFK0NpVlg1NllGbzFmMnBWYlA2V2Q2ZGRhV0I2SGx5Sjlxclc5TlN0TUtR?=
 =?utf-8?B?OXNycWw3L04zNzlFendtdzhZczVFSXRISUdXZUZKVHp4bjNJYlh3ZzM1SFIy?=
 =?utf-8?B?Q0hEcUEyMTd1Q1MwZkVhZzE2cU9ubGpZMERsbkgwUzFpQUVCS2t4ZlpGZlE4?=
 =?utf-8?B?Y0RVcW9JUkYxYWxySXRld0lLcWYxM2taZVBZQWhreWVsa1JjYW5OcWlGeGxT?=
 =?utf-8?B?aE5IaEtIU2pmc2VlRndkRlA3R0NFTHM4akhQY2gxQ0NrS29mdjdMNStYMktV?=
 =?utf-8?B?QUJLbmR1Q0NUcTNpOGtNQ1RZUnJJSXhWei9lcnB6a3Qxa2xvdlpUVS9kZENr?=
 =?utf-8?B?elV4NTdndTBFWldDVTVnWkkrR0tlL3BqdEJHeFBtamNVMjVjQjVNWnQ5dkZn?=
 =?utf-8?B?N2FDTTI1cFZmQzUxT010T2pzRzhzL2tSUm4rYzBuemtmR21PbEI5aVFIT1hi?=
 =?utf-8?B?U0ttZ0NDc2VsMGFibUhFTTFmQ1ZXeXd2UUJiTGl4cXNwNE5ORXJSM0ZLNm0w?=
 =?utf-8?B?Y1NIa3VXVStaZ1lkVk40NFZmdXRTcy8zUDJRUXpLUXJOZjJRRitERE9RSmRN?=
 =?utf-8?B?Y3FPVDVTNmxuM1Q0RTg0UTFQTGtDSEVpdGpKbEwrUnhOWkp0UTM4OXBOcjBL?=
 =?utf-8?B?VDZEMGNkQ0FKS1EvU3ZBbCtyUzdJak9lRTM5MFRXWWdCdVBmb01QS1Q2R0cr?=
 =?utf-8?B?eUlSNmhRSFY3d1RPS04wTEl2a3VqcmtJRy9OUS9tRkhXOHhiTVJ3ZE5FOVAv?=
 =?utf-8?B?cC8rWTJVZHZ0YlRVT09Md0cwZnVrU0hJbDNVcVFkanVyVXpuV25NeExCR2px?=
 =?utf-8?B?M09na0orR0wxc2tIdHo3akV3ZFdSL2FKM3M0SVFTSE9mK25VWllFMTliTWpp?=
 =?utf-8?B?ZzgxOXdxQlVIaU1rQTlqUisxSFlJTDN1a05BNE4rRDhPWkZ3ekVDcWZKRDRu?=
 =?utf-8?B?ekdkeCtXNHVxalNMdWcxTW5Oem45ZDlWVWF3aU8zSEZtckNWOG5IcUVuOVZj?=
 =?utf-8?B?MjhkK3VWOXRWdWxjWUpnUnNNajJIR0hpWkloSENuc09Ga2UrNllzVU5zMVZX?=
 =?utf-8?B?K1JhbTZhSXV1U0ZIZnpiVFF3LzVzYnpyTnlzWFpKWDlPK3p1VStWaVpMQ2R6?=
 =?utf-8?B?cTdURmRncDJrSnhEYmpsWDVQQzR4bFpNZE9mNk1aSnZteldHMUJlUVBpQ0E5?=
 =?utf-8?B?Z0RnUktlNXIxcXQ0T2lVSmkxUFEyM2xQbVljVHVselhTNnhsQTFISmhubjJ3?=
 =?utf-8?B?dzg5UTRSenpkVzhTN2RkMUZGOUtTZzFLRm9RWUR2QkpEV1h1c2pKaFR0Mnhk?=
 =?utf-8?B?VGVJMzBrTGwzbTJDdFlQcU81OS9tVFBSYlpQWCtxRXhUdlFnRGdadnA3Z2Jz?=
 =?utf-8?B?b0R1NWtneXdXWlFnRWhVWWFsNENsZy8rZk42U0svVGVON1U2VXU3b0FySDYr?=
 =?utf-8?B?ZVVSOEJpQm5IR3RDTkdKYnBVdEp1US9DRlVMUUtJRUFKZEs1MUd6MlYxUkpE?=
 =?utf-8?B?T2crZ3pIVng3U0ZWY1JUT1ZMdSs4RWE4L29CcFNtY1UrN2NRNEgzQVdkMm1O?=
 =?utf-8?B?ZGRDenA1RnREVDV4bEgwdXgza1hGdnB0VXNDa1lEdjJmZ2VHSGxvNFRIZnZU?=
 =?utf-8?B?WWF2RkJsY3lxS2pZVnoxRkFjRERNWnMvVHdLdkJVWHZhSzYvT1Q3U0FXREVs?=
 =?utf-8?B?NnhQUndhejJhaVF2Q0Q3eWhqMGhhUDZYNmxXbGJnMDI1SlN1c3pqVEhmM2hq?=
 =?utf-8?B?bkJoRHE2WkxFVHlqZU1aRmdURmt0cFF4djBobW5hVmE0QXFIRlZlL1haYjkz?=
 =?utf-8?B?RTc2eTNxU1VzdmxGRmJKaGJXOXB0UkpjTi9SVkRmSjRyZWpDYUM4bm9WcFRW?=
 =?utf-8?Q?RBtzJRnSjIIQ1+E14F?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9828.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4841b22-214c-44a4-9396-08de9abbdb2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 06:54:35.9166
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ih/FBTjW8S9b4yemmVAw2Lbze2BPbkEdCqLSfZhPbKzoNL/A3ZrY43PAtWMgCYQoA8FsQGcWCzz5Sf9OwOXf0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_235448_778786_68C0A954 
X-CRM114-Status: GOOD (  20.81  )
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
OCwgMjAyNiAzOjM2IFBNDQo+IFRvOiBEYXR0YSwgU2h1YmhyYWp5b3RpIDxzaHViaHJhanlvdGku
ZGF0dGFAYW1kLmNvbT47IEFsZXhhbmRyZSBCZWxsb25pDQo+IDxhbGV4YW5kcmUuYmVsbG9uaUBi
b290bGluLmNvbT4NCj4gQ2M6IERhdHRhLCBTaHViaHJhanlvdGkgPHNodWJocmFqeW90aS5kYXR0
YUBhbWQuY29tPjsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGdpdCAoQU1ELVhp
bGlueCkgPGdpdEBhbWQuY29tPjsgRnJhbmsgTGkNCj4gPEZyYW5rLkxpQG54cC5jb20+OyBKb2Vs
IFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PjsgbGludXgtDQo+IGkzY0BsaXN0cy5pbmZyYWRlYWQu
b3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIGkzYzogZHctaTNjLW1hc3RlcjogRml4IElC
SSBjb3VudCByZWdpc3RlciBzZWxlY3Rpb24gZm9yDQo+IHZlcnNhbG5ldA0KPg0KPg0KPg0KPiBI
aSBTaHViaHJhanlvdGksDQo+DQo+ID4gSSBzZWUgdGhyZWUgcG9zc2libGUgYXBwcm9hY2hlcyBo
ZXJlOg0KPiA+DQo+ID4gIDEuIFNvQ+KAkXNwZWNpZmljIHxjb21wYXRpYmxlfChlLmcuIFZlcnNh
bE5ldCBkZXRlY3Rpb24pDQo+ID4gICAgIFVzZSBhIGRlZGljYXRlZCBjb21wYXRpYmxlIHN0cmlu
ZyB0byBpZGVudGlmeSBWZXJzYWxOZXQgYW5kIGFkanVzdA0KPiA+ICAgICB0aGUgYmVoYXZpb3Ig
YWNjb3JkaW5nbHkuDQo+ID4gIDIuIER5bmFtaWMgcnVudGltZSBkZXRlY3Rpb24gKGN1cnJlbnQg
YXBwcm9hY2gpDQo+ID4gICAgIFRoZSBjdXJyZW50IHBhdGNoIGF0dGVtcHRzIHRvIGluZmVyIHRo
ZSBhYnNlbmNlIG9mIElCSSBwYXlsb2FkIGRhdGENCj4gPiAgICAgZHluYW1pY2FsbHksIHdpdGhv
dXQgcmVseWluZyBvbiBEVCBpbmZvcm1hdGlvbi4NCj4gPiAgMy4gRXhwbGljaXQgRFQgcHJvcGVy
dHkgKHxoYXMtbm8taWJpLWRhdGF8KQ0KPiA+ICAgICBJbnRyb2R1Y2UgYSBib29sZWFuIGRldmlj
ZeKAkXRyZWUgcHJvcGVydHkgdG8gZXhwbGljaXRseSBkZXNjcmliZSB0aGUNCj4gPiAgICAgaGFy
ZHdhcmUgY2FwYWJpbGl0eSB0aGF0IG5vIElCSSBwYXlsb2FkIGRhdGEgaXMgcHJvdmlkZWQsIGFu
ZCB1c2UNCj4gPiAgICAgdGhhdCB0byBkcml2ZSB0aGUgYmVoYXZpb3IuDQo+ID4NCj4gPiBDb3Vs
ZCB5b3UgcGxlYXNlIGFkdmlzZSB3aGljaCBhcHByb2FjaCB3b3VsZCBiZSBwcmVmZXJyZWQ/DQo+
DQo+IFJlZ2FyZGxlc3Mgb2YgY2hvaWNlIGhlcmUsIHlvdSB3aWxsIHN0aWxsIG5lZWQgdG8gaW50
cm9kdWNlIGEgZGV2aWNlLXNwZWNpZmljDQo+IGNvbXBhdGlibGUgc3RyaW5nLg0KSSBhZ3JlZSwN
Ckkgd2lsbCBwbGFuIHRvIHRha2UgaXQgdXAgaW4gYSBzZXBhcmF0ZSBwYXRjaC4NCj4NCj4gRnJv
bSB0aGVyZSwgeW91ciB0aHJlZSBvcHRpb25zIGFwcGx5LiBNeSB0aGlua2luZyBpczoNCj4NCj4g
IC0gaWYgeW91IGNhbiAqZ3VhcmFudGVlKiB0aGF0IHRoZSBwcm9iaW5nIG1ldGhvZCAoMikgaXMg
YWNjdXJhdGUgKGFuZA0KPiAgICB0aGVyZSBhcmUgbm8gb3RoZXIgc3ludGhlc2lzIHNldHRpbmdz
IHRoYXQgbWlnaHQgaW52YWxpZGF0ZSBpdCksIHRoZW4NCj4gICAgdXNlIHRoYXQuDQpZZXMgdGhh
dCBpcyBzby4NCg0KDQo+DQo+ICAtIG90aGVyd2lzZSwgaWYgeW91J3JlIHVuc3VyZSBvZiB0aGUg
cmVsaWFiaWxpdHkgb2YgcHJvYmluZywgdXNlIGEgbmV3DQo+ICAgIGV4cGxpY2l0IERUIHByb3Bl
cnR5IGFzIHBlciB5b3VyICgzKS4gVGhpcyBpcyBtb3JlIGFwcHJvcHJpYXRlIHRoYW4NCj4gICAg
dXNpbmcgdGhlIGNvbXBhdGlibGUgc3RyaW5nLCBhcyBpdCdzIGFuIGFjdHVhbCBjb25maWd1cmFi
bGUgcHJvcGVydHkNCj4gICAgb2YgdGhlIGhhcmR3YXJlLCByYXRoZXIgdGhhbiBhIHdvcmthcm91
bmQtc3R5bGUgdGhpbmcuDQo+DQo+IE5vdGUgdGhhdCBBbGV4YW5kcmUgaGFzIHRoZSBmaW5hbCBz
YXkgaW4gdGhpcyB0aG91Z2guIEhlJ3Mgb2theSB3aXRoIHRoZSBwcm9iZQ0KPiBhcHByb2FjaCwg
c28gaXQncyB1cCB0byB5b3VyIGNhbGwgb24gd2hldGhlciB0aGF0IHdpbGwgYmUgc29saWQgZW5v
dWdoIGZvciBhbGwgZHctDQo+IGkzYyBoYXJkd2FyZS4NCg0KU3VyZQ0KPg0KPiBDaGVlcnMsDQo+
DQo+DQo+IEplcmVteQ0KLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1pM2MK
