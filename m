Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7891CC7EE22
	for <linux-i3c@archiver.kernel.org>; Mon,  8 May 2023 18:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQXVKLah9IUVcwYnSAIA5zqWpGexu0BmtGSvzdZ9HC4=; b=3Qr128ZQ4LE9OE
	qnZ6MaMh/PYBj+nN5GdmDKpClbI5p+jdsbnS3N7ylG+a8ohZUlvrgAtE0YjTYsfU50JUS5sYae+nD
	VoN1nwBz6jlbWS+gtmN8omfVghNEwBLSUBEESKa18EIoSjMlN8/TUsqdsFbQJgiFgbbeo/BHbeh9/
	UuJAWT3h6pUlrYM2RKuOpnTrzjKio6Oqraqp1+O5aaurIaXtwEzT+FEA6Uj5DVEVZ0skvKUEpOv97
	dHPcdGDA7HwiWiFXITzIOQgh4GS9cmP/sJmLo1SvqZk3Szh2TNFEnOChaRw/SPyqSFogreSLdeEGC
	iZPrjfpY69c3B2S+IuSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw5aZ-0017hr-2M;
	Mon, 08 May 2023 18:27:59 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw5aV-0017hG-1S
	for linux-i3c@lists.infradead.org;
	Mon, 08 May 2023 18:27:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683570475; x=1715106475;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=NN3m0/XFRgJyLm5axWykisTrz8wDfpV3rTlzRkryqrs=;
  b=OESUNvzB5jOZgaB0X6Y975Xwad4rF2rBwtxLlI4W7Dq0X0/Vill2FeVC
   97xbpwmbIQw9haTBDsiPoW9Ya/g9th8k9MQ4tpIx0lUdiDZb13udPZDYK
   w/DhrGm8Yl7sZtfBFJnpZUfg3OGZYQ7nFPGuo/Kwoe56uK9LbqHImuq+A
   X/mQtV+PLLQi0vS/vproRpIEtCpTZNQ3elJ3HMVdjwoxQYTUGvKYriG0p
   Y66qwYJIJ/jA6KQ8OtC9Xc0S/nbQtZ28bw1aHbFrlCoRJLA+GFigZTj+V
   of5aV1+5Qjj9ASwl7PcAP5LZRuVg431tx0NKt1XL/z0vg/uwd2uJXHR6D
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="351887190"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="351887190"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 11:27:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="676148315"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="676148315"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga006.jf.intel.com with ESMTP; 08 May 2023 11:27:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 11:27:49 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 11:27:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 11:27:49 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 11:27:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbWndSGM5iOqvgRYJhr4DMnG1rQkbvpB5ykJw0jrlnbkVuk4WkHd+2QKqeuZRaJsUrtiCsU0f1shzD44KeBxqJpQ89kt5iLxkjDgxTyRbeoaldIWaW52fMRrCU89eyJUwvVPcg89NIco83zsj2liK80uycEEN9XB9E8JR1D4Ko50jPAV86FfdfWw8b/SfwiIyAcq9eHhlHvum28wtfK4rMLRnnUnDppyXRtBixUeM+oICV07ZSY8bImwUMK+FF6ENiz+3zUtoDj46Dx3LEMhtb36AYL35UI4MJ3PbLxeerjvW3UIwgaYoUHYaS8BnyCikWOxn8qiFNFvNReVeKPoCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NN3m0/XFRgJyLm5axWykisTrz8wDfpV3rTlzRkryqrs=;
 b=cQg2xEr/N0iNbpNL2Ynh5lcxv2pdGMkQbS17t+Zd5T2e4Fed3m5cKFH9SamBeWHP0BzFA3BT95eSBMKTpP4ykQL4R20vE21XPHVeC3HOy4GN+/hVh4gMxgAvPnquP/ZZnvwnH92qG9H5WNNYyqiQRx30efhb8aGioWiPjPzEVhKI4gMncmHPGc39IT8+ghCgXOPLUCRsPwSpDPP56ZLjE94gu4m3FAnt14mcmi7a2voFgsRBTWMCL3LF2XIriaPVimAGmDPKM8smCizHdEYsGQoM0wyS3C1NxYXSRVT7lx7MPGNgz8ze5tX9XIknM/6ODgFPGkytvl3i8qfoTIvB2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by CO6PR11MB5633.namprd11.prod.outlook.com (2603:10b6:303:13c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 18:27:47 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::c91d:6ffc:c1a5:8c5d]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::c91d:6ffc:c1a5:8c5d%7]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 18:27:47 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "matt@codeconstruct.com.au" <matt@codeconstruct.com.au>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
CC: "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"joel@jms.id.au" <joel@jms.id.au>
Subject: Re: [RFC PATCH 0/2] I3C MCTP net driver
Thread-Topic: [RFC PATCH 0/2] I3C MCTP net driver
Thread-Index: AQHZcLHslnrqCWg690u04c5fB2wYBK9Q1C2A
Date: Mon, 8 May 2023 18:27:46 +0000
Message-ID: <f741f271752a6b141667625676487311a877a3db.camel@intel.com>
References: <20230413081139.15673-1-matt@codeconstruct.com.au>
In-Reply-To: <20230413081139.15673-1-matt@codeconstruct.com.au>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5823:EE_|CO6PR11MB5633:EE_
x-ms-office365-filtering-correlation-id: 8a4e2b17-75fe-48ba-10b9-08db4ff1ec1d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aBnNg5S0KoYLOOD4UDHUJMsNIZjueqXMFlCInSHiu3IRqrmcYu5F5a9Zd1dtAvAxQQPCZB7gIowIYWZyPyv46fqmc9GSH2UgSqWiAYmPOXfnTsjcbx4i5yUXD1vgfhalV7NOrljO0lPJcEAFMkEc7tMtUln50LJMb3vK612NfpgY9+xz015vnahsdgEuEGLGVyfUiMNEPHIpBIL9sU3gB2I7md0ZLYa/2wKIgp+T+7qbLMfsGA/cKOEqOmn3V/bVwOtFnVqdd8/VZNGGW37pQ/Xm2RD3AeXGtfUHUL73YOKK2CgOgiO1yC82IkxB1Pv4565242V/GUwEapQeEV+Gv4tSNo5QwHxpTsPnMaFqDaSC0EzBEtMcoFydpxHyv++Hlb1LT+J+AxFOLGk7pU+zCHJYpjk+zSHDsJXeSH8zAw5fzJ9RbDlucqv9eEtHTk6ONPqIwC1peDl35606pT0UKD/EY0oWENqhU8lbks7VgtKzJx+Mc3EqfkqBzymBEM+P4DW8Df8SUBIum+BAliRoW22ZMB+uuxW6ANJ3Q9sPTobhBhB2fY4FaQcU4J1LQnTihB/zuHGFF8fzIRVW43lz3TESkjU9uaVmNcCwX9MDhaksjv1sRXwcgEsDyEo0/VaP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199021)(6486002)(6506007)(26005)(6512007)(83380400001)(2616005)(36756003)(38100700002)(122000001)(86362001)(38070700005)(82960400001)(186003)(110136005)(2906002)(54906003)(316002)(8676002)(8936002)(41300700001)(76116006)(91956017)(4326008)(5660300002)(64756008)(66446008)(66946007)(66476007)(66556008)(478600001)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzAzOG1rYTBWdFpaK2d0YkZKMWlwU3l3VzFWc29wWnNWUkZjTGNOYmZXYmxP?=
 =?utf-8?B?YklwbDV4ODhLeHZjbUhXRi9uS01jUDBINThFN1VRUnk2NVNrSlgrRnp5Szhm?=
 =?utf-8?B?cHZOaG5YWGM0NXVxbUpIL1E5bXVFbDJYdWl4Z2ZnRUN4NGlsK1NXcXVHaEVS?=
 =?utf-8?B?cHhxNFVRY091blZxR0RtOGdsUzR4dW9BTXpuMllhRmQ1M0c5b3FVVWd0V0Vz?=
 =?utf-8?B?b1ZsdVFldmRFdGZ6eFlFaElyTUpsWGlSWGIwUEFTWDdzUnkwNlhCeHk4QmVw?=
 =?utf-8?B?OVJlVkRQL3h3Z2NGSC9RZHBvR0RzS2dhSlpTaHU3dEU3NGpicU4yaEIyWHlS?=
 =?utf-8?B?MEVpbkQ2Zm4xTDVVQjFKdS84NFNES29xSW9PUzFlbzhwZXRZUzZBTGRGWFhF?=
 =?utf-8?B?cTBQdDVPbk1MT2VYUHBBbUhLUjl0eWs3cWl5Q3FmUWV6NHFIeEpySC9wak96?=
 =?utf-8?B?UHE1TGFLekpSakV4bWxLM25tVHV0SklJN0JpbSs2MkVtVXQvOVVJdXhPYnVM?=
 =?utf-8?B?TVpYbEtqcFBtc05wL2NEZEMrcm1pOFR1dnhvTGxpenA1OFdxa3ZYM3RoVnND?=
 =?utf-8?B?TFhoYXhqWDRtYmFqYU82VWV5THI4N0tDTnBOWTF5ZGRSbCtGNTFINGRBTS9R?=
 =?utf-8?B?N3d5amJVakhoNXRmZGtqY2RzTW1TVS9vWElCcUdsSmhOK0hGeHBCYTZtbStQ?=
 =?utf-8?B?aGZxRWE4NGEwaVk3Nm5zL2cyWmxlaGZlZittTFVxUWwzYlFZRXd0T1ZjWnE4?=
 =?utf-8?B?Ylp5ZlpMOU94QXN5TnVDdkplVTRXSjdMTlpaZ05xQnltZVFXaUlyVHlPb3Rz?=
 =?utf-8?B?SDhQNGhOV0FtM04zMnp2N3JPYTBkT2N5QldEQU5XeVNIdG5LdDc2KzU3UnhZ?=
 =?utf-8?B?bXBQVW1mMi82WEVkZ05nbFYvcXNtNCtKcUdvTXlNWGVmclViSUdoZTNVSUJk?=
 =?utf-8?B?NVVrUStsQk9EcXpEbFFyMDZFeVpSV1VnaUc5RDhkemthR3cwUWsvejB2WFdP?=
 =?utf-8?B?bXFZU3F2bmRtclloT2E5VmNHSGs2dVV5cnhQaHBwbXZtYXAzaW9DZEVhNHpN?=
 =?utf-8?B?Y1dFWXNaRmJVZ1kzdWFTVjRIVW14c1pKOHNXUVJHVEtnZGZVY2ZEUGFLS0dH?=
 =?utf-8?B?V2U1djhGbFU5UmFQMkxVNXY0eEMrMEhxTlZKQ2V1aVdLdnArMTNNU0pENmNG?=
 =?utf-8?B?b0lNV1pJa3RIblJRN1ZaUDJPMWFjb1ltTnpteGVRcFF4RDVKb1U4czRmMS9N?=
 =?utf-8?B?UW5ha1g1ZDJydHhKcXdZVmZPYy9qQzRqNmgyYzUzNW9Sa1BEVFNyTUVXZkNy?=
 =?utf-8?B?dGplWHJGSkw2eXRxWWpjYkxXdExUYlpUek1oNWlPNVBocWdqTk8xcjFXbHpS?=
 =?utf-8?B?QlhMS0t3NnErbDNJaVpXeGFtcHJyOFFFYzZtUEFtd0VUL0xUdWcvaGNwWVJx?=
 =?utf-8?B?WEhCbjc2MGRReWN6dzMwclVMOHFZRU9LUVBZd0J6MFBjWVdGbmR5T2Vuc3Nn?=
 =?utf-8?B?MXg4ZjVQVHVBRmlPdDhzM0Ezcm5aN3VCaXJtb1lQOVp6ZzVKUm5QWXJxeEpk?=
 =?utf-8?B?Qm50S2I4cFM4M04vcWltd1lFV296ZitRSCs3UWZMaWI5aHQ2b1psMW5xblVU?=
 =?utf-8?B?bldZL1V3ek8zT1Jjd3ZOUDVZcHZJNUpVQjd5RisreU81R21DMlczS25IeDdZ?=
 =?utf-8?B?QjV6d2QvRlE0TXVSYTA5WEpWYVJQRzJseXVXVUlEcTVWNzFaa3V5L01jVUdy?=
 =?utf-8?B?eEVmU0JOVDJFaHFNQlBDckxER0M2REd2aXFaYy83RWNQdjByWUpmMWQzSmtZ?=
 =?utf-8?B?RG1TNFN4YVJUTkNONjIwRlJ3NkNiWXpEWVhiVFJYTWNONmZDazViY3VlbWQ5?=
 =?utf-8?B?aGlxaXZxWUxJV2pia2QwSDZxQ3ZnUm9MdWVkV0lzMU5yVHZFamhId09OYUFl?=
 =?utf-8?B?dFcybzBrMVRQYVlBb1hueWJ4QVdOSTQ1K3h0SCtRL0tCQW9HL0ZwR2RqOVpM?=
 =?utf-8?B?QnI0ZHJ4TUt6dElKZnA1emI3ZGpzUFlRRVphWXhVZUMxdFVDcU1TUVJpY2xQ?=
 =?utf-8?B?U08vMUMybmtIQUgyV2ovSmZRV2hvR0xiM1F4eU5hR205eHdvZkpWS1c3dmdk?=
 =?utf-8?B?OUFFdnZLWTh2QkovbDdiRHpGVXp4K1FtZkM4NFNSeE5PQTRxWlRKSUM3Ukpo?=
 =?utf-8?B?RHc9PQ==?=
Content-ID: <CFBC437EF10E2A45BFF2F41BAB7EE866@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4e2b17-75fe-48ba-10b9-08db4ff1ec1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 18:27:46.9852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e4/UXYjoNsGdI+IqTiTxSHj0a9MAolCey9bmgxyAwRAWFbwtMO4XVe5Lxbsv0XBPdUbSVnJhgJwsvcoi2Siv+cKgcOJclEbFraYmP4LDcnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5633
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_112755_607394_097C4411 
X-CRM114-Status: GOOD (  23.55  )
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

T24gVGh1LCAyMDIzLTA0LTEzIGF0IDE2OjExICswODAwLCBNYXR0IEpvaG5zdG9uIHdyb3RlOg0K
PiBUaGlzIHNlcmllcyBhZGRzIGFuIEkzQyB0cmFuc3BvcnQgZm9yIHRoZSBrZXJuZWwncyBNQ1RQ
IG5ldHdvcmsNCj4gcHJvdG9jb2wuIE1DVFAgaXMgYSBjb21tdW5pY2F0aW9uIHByb3RvY29sIGJl
dHdlZW4gc3lzdGVtIGNvbXBvbmVudHMNCj4gKEJNQ3MsIGRyaXZlcywgTklDcyBldGMpLCB3aXRo
IGhpZ2hlciBsZXZlbCBwcm90b2NvbHMgc3VjaCBhcyBOVk1lLU1JIG9yDQo+IFBMRE0gYnVpbHQg
b24gdG9wIG9mIGl0IChpbiB1c2Vyc3BhY2UpLiBJdCBydW5zIG92ZXIgdmFyaW91cyB0cmFuc3Bv
cnRzDQo+IHN1Y2ggYXMgSTJDLCBQQ0llLCBvciBJM0MuDQo+IA0KPiBUaGUgbWN0cC1pM2MgZHJp
dmVyIGZvbGxvd3MgYSBzaW1pbGFyIGFwcHJvYWNoIHRvIHRoZSBrZXJuZWwncyBleGlzdGluZw0K
PiBtY3RwLWkyYyBkcml2ZXIsIGNyZWF0aW5nIGEgIm1jdHBpM2NYIiBuZXR3b3JrIGludGVyZmFj
ZSBmb3IgZWFjaA0KPiBudW1iZXJlZCBJM0MgYnVzLiBCdXNzZXMgb3B0IGluIHRvIHN1cHBvcnQg
YnkgYWRkaW5nIGEgIm1jdHAtY29udHJvbGxlciINCj4gcHJvcGVydHkgdG8gdGhlIGRldmljZXRy
ZWU6DQo+IA0KPiAmaTNjMCB7DQo+IMKgwqDCoMKgwqDCoMKgIG1jdHAtY29udHJvbGxlcjsNCj4g
fQ0KDQpIaSwNCg0KV291bGRuJ3QgY3JlYXRpbmcgIm1jdHBpM2NYIiBuZXR3b3JrIGludGVyZmFj
ZSBmb3IgZWFjaCBJM0MgZGV2aWNlIHJhdGhlciB0aGFuDQpJM0MgYnVzIGJlIGEgYmV0dGVyIGZp
dCB0byBtb2RlbCBNQ1RQIG92ZXIgSTNDPw0KV2h5IGFyZSB3ZSBmb2xsb3dpbmcgdGhlIG1jdHAt
aTJjIGFwcHJvYWNoIHJhdGhlciB0aGFuIG1jdHAtc2VyaWFsPw0KDQpNQ1RQIG92ZXIgSTNDIGlz
IChsaWtlIHNlcmlhbCkgcG9pbnQtdG8tcG9pbnQgLSBjb25uZWN0aW9uIGJldHdlZW4gSTNDDQpj
b250cm9sbGVyIGFuZCBlYWNoIEkzQyBkZXZpY2UgY2FuIGJlIHRyZWF0ZWQgYXMgc2VwYXJhdGUg
ImxvZ2ljYWwiIGJ1cyAoc2luY2UNCnRoZSBvbmx5IHdheSB0aGF0IHRob3NlIGRldmljZXMgY2Fu
IHBvdGVudGlhbGx5IGNvbW11bmljYXRlIHdpdGggZWFjaCBvdGhlciBpcw0KdXNpbmcgTUNUUCBi
cmlkZ2luZykgYW5kLCBwb3RlbnRpYWxseSwgYSBzZXBhcmF0ZSBNQ1RQIG5ldHdvcmsuDQoNClRo
aXMgd291bGQgYWxzbyBzaW1wbGlmeSB0aGUgc2VyaWVzLCBhcyB3ZSB3b3VsZCBubyBsb25nZXIg
bmVlZCAibWN0cC0NCmNvbnRyb2xsZXIiIHByb3BlcnR5LCBhbmQgdGhlIGRyaXZlciB3b3VsZCBq
dXN0IGZvbGxvdyB0aGUgSTNDIGNsYXNzIGRyaXZlcg0KbW9kZWwgd2l0aG91dCB0aGUgbmVlZCBm
b3Igbm90aWZpZXJzLg0KDQpUaGFua3MNCi1Jd29uYQ0KDQo+IA0KPiBUaGUgZHJpdmVyIHdpbGwg
YmluZCB0byBNQ1RQIGNsYXNzIGRldmljZXMgKERDUiAweENDKSB0aGF0IGFyZSBvbiBhDQo+IHN1
cHBvcnRlZCBJM0MgYnVzLiBFYWNoIGJ1cyBpcyByZXByZXNlbnRlZCBieSBhIGBzdHJ1Y3QgbWN0
cF9pM2NfYnVzYA0KPiB0aGF0IGtlZXBzIHN0YXRlIGZvciB0aGUgbmV0d29yayBkZXZpY2UuIEFu
IGluZGl2aWR1YWwgSTNDIGRldmljZQ0KPiAoc3RydWN0IG1jdHBfaTNjX2RldmljZSkgcGVyZm9y
bXMgb3BlcmF0aW9ucyB1c2luZyB0aGUgInBhcmVudCINCj4gbWN0cF9pM2NfYnVzIG9iamVjdC4g
VGhlIEkzQyBub3RpZnkvZW51bWVyYXRpb24gcGF0Y2ggaXMgbmVlZGVkIHNvIHRoYXQNCj4gdGhl
IG1jdHAtaTNjIGRyaXZlciBjYW4gaGFuZGxlIGNyZWF0aW5nL3JlbW92aW5nIG1jdHBfaTNjX2J1
cyBvYmplY3RzIGFzDQo+IHJlcXVpcmVkLg0KPiANCj4gVGhlIG1jdHAtaTNjIGRyaXZlciBpcyB1
c2luZyB0aGUgUHJvdmlzaW9uZWQgSUQgYXMgYW4gaWRlbnRpZmllciBmb3INCj4gdGFyZ2V0IEkz
QyBkZXZpY2VzICh0aGUgbmVpZ2hib3VyIGFkZHJlc3MpLCBhcyB0aGF0IHdpbGwgYmUgbW9yZSBz
dGFibGUNCj4gdGhhbiB0aGUgSTNDIGR5bmFtaWMgYWRkcmVzcy4gVGhlIGRyaXZlciBpbnRlcm5h
bGx5IHRyYW5zbGF0ZXMgdGhhdCB0byBhDQo+IGR5bmFtaWMgYWRkcmVzcyBmb3IgYnVzIG9wZXJh
dGlvbnMuDQo+IA0KPiBUaGUgZHJpdmVyIGhhcyBiZWVuIHRlc3RlZCB1c2luZyBhbiBBU1QyNjAw
IHBsYXRmb3JtLCB3aXRoIEplcmVteSdzDQo+IEluLUJhbmQgSW50ZXJydXB0IHN1cHBvcnQgcGF0
Y2hlcy4gQSByZW1vdGUgZW5kcG9pbnQgaGFzIGJlZW4gdGVzdGVkDQo+IGFnYWluc3QgUWVtdSwg
YXMgd2VsbCBhcyB1c2luZyB0aGUgdGFyZ2V0IG1vZGUgc3VwcG9ydCBpbiBBc3BlZWQncw0KPiB2
ZW5kb3IgdHJlZS4NCj4gDQo+IEknbSBzZW5kaW5nIHRoaXMgYXMgYW4gUkZDIGZvciBsaW51eC1p
M2MsIHRoZW4gd2lsbCBzdWJtaXQgdGhlIG1jdHAtaTNjDQo+IGRyaXZlciBpdHNlbGYgdG8gdGhl
IG5ldGRldiBsaXN0IGFmdGVyIGl0IGhhcyBoYWQgcmV2aWV3IGhlcmUuDQo+IA0KPiBDaGVlcnMs
DQo+IE1hdHQNCj4gDQo+IEplcmVteSBLZXJyICgxKToNCj4gwqAgaTNjOiBBZGQgc3VwcG9ydCBm
b3IgYnVzIGVudW1lcmF0aW9uICYgbm90aWZpY2F0aW9uDQo+IA0KPiBNYXR0IEpvaG5zdG9uICgx
KToNCj4gwqAgbWN0cCBpM2M6IE1DVFAgSTNDIGRyaXZlcg0KPiANCj4gwqBkcml2ZXJzL2kzYy9t
YXN0ZXIuY8KgwqDCoMKgwqDCoMKgIHzCoCAzNSArKw0KPiDCoGRyaXZlcnMvbmV0L21jdHAvS2Nv
bmZpZ8KgwqDCoCB8wqDCoCA5ICsNCj4gwqBkcml2ZXJzL25ldC9tY3RwL01ha2VmaWxlwqDCoCB8
wqDCoCAxICsNCj4gwqBkcml2ZXJzL25ldC9tY3RwL21jdHAtaTNjLmMgfCA3NzggKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+IMKgaW5jbHVkZS9saW51eC9pM2MvbWFzdGVy
LmjCoCB8wqAgMTEgKw0KPiDCoDUgZmlsZXMgY2hhbmdlZCwgODM0IGluc2VydGlvbnMoKykNCj4g
wqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9uZXQvbWN0cC9tY3RwLWkzYy5jDQo+IA0KPiAt
LSANCj4gMi4zNy4yDQo+IA0KPiANCg0KLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgt
aTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1pM2MK
