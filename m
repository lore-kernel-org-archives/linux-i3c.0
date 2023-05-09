Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D200C77B7C
	for <linux-i3c@archiver.kernel.org>; Tue,  9 May 2023 21:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vltASNWrcbYD9ggUf0F+BD534E6QtEQerK+NseemGnc=; b=TQyRZ+sqK6aad/
	oteK6382EB3tphVblfOZavUeBbXLBSGaGvntcx+t87EJZ81IfRpmIU+Mu0kUHsh3DeCRp3Is/MiZA
	Tr54USQybbVPGLoM2QRrUQbwSccO38uKs+fnrcJUZeiVjuYFx4Zl0FeE1kHUtKMqy+wgayRq9fMVr
	So+cHchg+BYu/kVRKcX5n7dO3YAKWsBJwhGEdTirmbhUbNAkNE0dEGZY17xPD44HQnsARF5VOGwWf
	p3xl40T4fEka79pFTEeDgC86NRl5335WmxQHjLLbAl9i6iIMsRwja3KYhSIhGNr4w0gfOsewMwtpO
	8B0Fl+pmKpmV0jIDuHsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwUfU-004HLn-1f;
	Tue, 09 May 2023 21:14:44 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwUfR-004HLK-1O
	for linux-i3c@lists.infradead.org;
	Tue, 09 May 2023 21:14:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683666881; x=1715202881;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=I3vyx+GJrzkhstEtc+SwfjyiVIvMUaz0GhE/UesRDo8=;
  b=l5AvLNqDmX8dTbKC5R3hCOWyo5gElXsvxESeB4Nlbb41RvTuaZY9cs+q
   IDYwUDPMAGYSylELczznBhO89U1q6ENp4htc7XeWMixwrDRkbvlSb4zu2
   xZFQ2LN7hkdOOt1plMESAFAmjkLs96XKL0IybdqHjRjGCdcIc/pEFYaLw
   tP70eSbfymH6TMFounQtHEI0KzkxQ2+HdxcN0ShIrRoLes9olEMeKfqJh
   Xd22CMybYMXN4Cea4+3ewSntJG7K8QEbb2sMqgRrKdqSoioMZ3pfILsKx
   NbNrVZ1mksMkHvq8j4PiOel6g3aauGK+ay7OWUmO1/TOkO/cDYMVAXXld
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="436375742"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="436375742"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 14:14:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="810874169"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="810874169"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga002.fm.intel.com with ESMTP; 09 May 2023 14:14:36 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 9 May 2023 14:14:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 9 May 2023 14:14:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 9 May 2023 14:14:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKEnZ2Wf66IYrXiu/eOLiLxER9vuAtjkfzAWqaMlI+DBqlfFbYuDJGmZoh94kuTtMxPfA1cJopcvUtjW5FuywpqSDRH8D/f1yEqYc5xBGENEZHQ6P8I3JPbmeQJtCQoyIlMMWjPIZzqm9vl0fzRnMwLZkSTnTxvDIN148OnjdqdyRyPpu8DeUJsDmVkbx761b7q8fEhJ0EH61hS8xgK17GZEG9O4n9hO2qZiZf7s4d9FW700jrFCCmu1FXDPSHoJiHZoiJjV7FYSgBfK8CO000hW7gVD83OWRNRSmZzKhsfYR9+3C/3ln7rZbpHfnL/V+YBGXhJ11tUvOuzfXoeTzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I3vyx+GJrzkhstEtc+SwfjyiVIvMUaz0GhE/UesRDo8=;
 b=JNMdf0uKKlVyQpqtH1DsbQB/efLkzqk4IFONoxRhs2y5/M7ETn8vht/l6J4Va7LEltpZu2qlvBc35N8HemUi2G5RRBD5dIh8gfrVZeYtwqC+BNdWuLIkoP7BJAlyZght03VsOWHqnvNxh4imr/TG6hhXRPstlefb6OWfWMdkOyC66UfhdIel9mHlFbCbnL3QDC1+4L0fFlL5cwR1W0Y084aN+bscl3PG7Ihq+/ABwCTlTPDejh5/Rd7QgLitTJ5eBVEb0qrnp+XCYrq9uAFWHoh7/n23B1liI4exJqnlgDvgC/o4GiXDNY5YYIH+JKrNlHV/mTfMjw8yrMUUesORdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by DM8PR11MB5605.namprd11.prod.outlook.com (2603:10b6:8:26::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 21:14:33 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::c91d:6ffc:c1a5:8c5d]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::c91d:6ffc:c1a5:8c5d%7]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 21:14:33 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
	"matt@codeconstruct.com.au" <matt@codeconstruct.com.au>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"joel@jms.id.au" <joel@jms.id.au>
Subject: Re: [RFC PATCH 0/2] I3C MCTP net driver
Thread-Topic: [RFC PATCH 0/2] I3C MCTP net driver
Thread-Index: AQHZcLHslnrqCWg690u04c5fB2wYBK9Q1C2AgABX+gCAAWjxAA==
Date: Tue, 9 May 2023 21:14:33 +0000
Message-ID: <4f58f4be52613b2ca18a68ec2bd511b4014c9143.camel@intel.com>
References: <20230413081139.15673-1-matt@codeconstruct.com.au>
	 <f741f271752a6b141667625676487311a877a3db.camel@intel.com>
	 <4127aa2454a33bccf666597c292943ded9ccaa5d.camel@codeconstruct.com.au>
In-Reply-To: <4127aa2454a33bccf666597c292943ded9ccaa5d.camel@codeconstruct.com.au>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5823:EE_|DM8PR11MB5605:EE_
x-ms-office365-filtering-correlation-id: 3f3881e9-fbbe-4da1-ae3b-08db50d262b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jkl/nYGRhKp5kKacI7KJcO/e9rZ5CUDZFRsYRc5Oh0z27LKLPHxdL4ehG5DmjjgWAZ/j6T/rw8o+8OIOMffekwxWqTEwSktYtLatTcSwjq3to3x6VC8GBFkFFNB0NZM+EYIifYoczBTmr+87fVcOC7dkLgTDoedngMUCjTeXkLRHaX6G+V8mrssEQwGsuqfL/FZHl7zCviX8sZ5c67LM0u7dEp9A0ScFbakM+/xvb5SQ+SmaqCLywdLq68pbPt1hM9T3UHtZsYgMlrcWLWTGt8/6FSu/WO1kytGOo3rzeZhS3Ea5j2bUnerdDZUw7ksJgflQauSX8xjLEXA148D6bUiVWsDyYkU0xmOK39Zbdvtu3mKSlf/HY/R/vNzlJr/giI5tKYokDTOw0vBgE+dui6th5hiGjwjDIcMCEwHuxjIE1CoqkoOzA3bHXU8SUd01VZHVxkqDbFg9GS+P1kexA/HZQl2+o0W2ED3WcorkkQdoUcvITfA9DHGOiK6+BL8MSb8L9L5sOR3qeDmKaxYIi+vfzcJUbKQmaOeN0pV34oXRalxgzsL3XVUczQlfZpPP3Y1eiDnTuWUr7x9xO5UgegajE/zsrc+8/m5tDFMVhnKe0PaHXeK16yV4TqRIMj8G
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199021)(4326008)(54906003)(66946007)(66476007)(76116006)(2616005)(66556008)(66446008)(64756008)(91956017)(41300700001)(8676002)(26005)(6506007)(6512007)(38100700002)(8936002)(186003)(6486002)(36756003)(2906002)(38070700005)(71200400001)(5660300002)(478600001)(86362001)(82960400001)(316002)(122000001)(83380400001)(66899021)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3BiS21jd2lVWUJiOWRjWThoRkxSbjJkT2lCam8zazNSZmdiakJ4VzltRjhi?=
 =?utf-8?B?UWgyRFRJVXRSWkFXRHp5elJXMGtXOEVEczg5cG1WbW5oUnFHWnhYYzhvN1B3?=
 =?utf-8?B?NTZNWWdoT0R6ZVExYWpIaGM0RjIxTm95QWxVQi9XSkpTZnZDb3ZwNmdMbEY0?=
 =?utf-8?B?MVBLWEEwVWkxcWI2cFYvN0J5VjRqUlNGZnhKUjRjTTFDSlNMQWo3RElDWGhC?=
 =?utf-8?B?QkgrbEs3dEJTMGdZOGN6Sk5ZY1BjU2ordjJoWjJ6NkV5RG9aZzlXQTM0aVRN?=
 =?utf-8?B?SEk3OWswQnEvMEZrOE9FQ0xPRjdTZVBpVVZ3R1M1RDNLRGZadDRJd0d0eHZP?=
 =?utf-8?B?YWZrVkRhWGx2UTNiOXJSSEl5V1NGTWhpanpueVpvMFNYZXBPbCtkakJBZy9r?=
 =?utf-8?B?ZjN2NmJ3SEtod25BYkc4bktBb1hDTzlEVkcyTHlMQWJ4WFVMSWFhdW5qTG5G?=
 =?utf-8?B?ZlFxUmtZUlgrM29ucVBlQmcwWFJ2UW1SVWZ0a2lWWTlXaHNyQVVQOGZqYm9y?=
 =?utf-8?B?UHluZURFQXN6Z3lPWDdmemhtR0c3ZTFFck45TWtOMENKS2RBaTAzWmZWVFpK?=
 =?utf-8?B?MFdrTkEra3F4VExQTEZPTi8vdGVKcGJlNmRJSEhnb3hxMXZMTmZ4UDREcVNE?=
 =?utf-8?B?MWU2eGZWZ1M4NUdnWjkvKzRFNHhnMFoybGYxd3NqZk9tTUFHQnNVcjhjVE1l?=
 =?utf-8?B?d0o3Y1hiaURYTnFKU3drZ1VFcU9RMHZKdDVYbkZ5cnJQeVpKSEFVZzFYaVNT?=
 =?utf-8?B?dFR4SE9LNzBGb0psMUUrblI3cytrQ2sxVXBudkRyREVMQnRScCswTTBrOTdL?=
 =?utf-8?B?TEU2MXYxRkFCN1lMRVFnYnV4azJRTHB1blBPQTlPZTRjMDAyblN3RFBYRTc5?=
 =?utf-8?B?Rlk1YjdrNjJHVlF1dzltb1N3bkJuSW8zRXpBZXdORGVSMkI0RTNRamMyQWdO?=
 =?utf-8?B?V29neTlnbU1oMDNCQ3ZTRTdUYWtZSkt5OXRCRHdDWXF1UkFJLzJzNHZuQmhR?=
 =?utf-8?B?bmtDaCtmRmxSM09wdnJBVXJ2WTJrRXM5TEI3NUc1bzNzVldET0tURE1EMmdS?=
 =?utf-8?B?TWJFNlFWMSs1VmRqRmNnSEpxblZzaVJIY3N6L1I5elVHdmdjWHlES2tvQWw4?=
 =?utf-8?B?TDJ6ZXlSYXlCV25JcEtJUlc1K0lLVnE4SHBvK2k1L0dXNURMUW1MQnZJeG9h?=
 =?utf-8?B?V3ZqdlZabFpiWXFabUYrZHR5blQ5K3JSVlNrdUs0eG1BK3QzUmtBNy9WMTdt?=
 =?utf-8?B?eEpzSlFqOWdzNGx0ZVpjQjE1RjR3R3lhcWlRWDZEcXVTazA2YllQYndOQWhr?=
 =?utf-8?B?b2REUW1KSHBram9MTnR3MUt3djd2MWRSdTdHS0IwaDZZQVkyQVUxWFFsalRV?=
 =?utf-8?B?blNGQ3grcnQzc1JSdjREMk04c1BQdWFtL1pNWmZ4SlRuZG14ZWtEc3Q0Mm80?=
 =?utf-8?B?R3VQVGlDWEhOR1NLNUNIbFpkYlgwNGpXYWVOeGMxOXlrdHhqbXkrOFFQd2hq?=
 =?utf-8?B?UE83RXFVUUloRXQvYkg4MGMxU0pYK3dtcHNPWmhkR0Uvd1VOVkdFaC9PdUUv?=
 =?utf-8?B?Zk5xM0RGblZ5Y3dBZFROSU1hRkJsSDA0OXJLUi9XMnFWb2QvQ3JncS9FSDZs?=
 =?utf-8?B?N0tHY2lwQlNtbWlVTXVUeFl1S0MwTTVkVUlOZDhVenJ6aTRXWGIzdWJTS29h?=
 =?utf-8?B?a2YydXFSRVp2WUd5Mm90VDBhNGNlSkNtdG1YZTJ5L3ZXVXlXeGhVbTJQUzNP?=
 =?utf-8?B?UDM3SUhnbUVsc1pDMC9JRjd0SjVseXdtVm15NnZvamFacE1MSHpscWNVRy9x?=
 =?utf-8?B?QnppcDdPWmQ4clJKTmM2RDhmY1VMbWRwVFV1U1U5YWRGeUppRXJ1MTYrTFM5?=
 =?utf-8?B?Z29OakRENzlwY1V2SnYxeFBwQkJTN3JsOEt5bVB2Y2ZmbCtnRnVMMU1TaEIx?=
 =?utf-8?B?TGszeVhxT3JpQW9GY0NWM0ZRSzVhVWhGb3lCMUliTFFHb2t0eFlaN05vekhs?=
 =?utf-8?B?Mi9NakExc1AyNHdQcVNOWlF5b2RudUhtb2NwR1hRY2FncEYrbmExVmVsWURt?=
 =?utf-8?B?ZmwvQUNpNGQxc0ZFbkVTVHVDdDJ4NzFTL0xaVzRwc0ZmVVlVWUpQOTVVWXV0?=
 =?utf-8?B?WVh0TC9sMi9uaytweHNwNDdBWUNzaGhDYVJ1YkY5UWwxQUlHTHhiSS9RWk5F?=
 =?utf-8?B?a2c9PQ==?=
Content-ID: <377641A354399043974D56B90D2D78C5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3881e9-fbbe-4da1-ae3b-08db50d262b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 21:14:33.2378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PEtXAXCZeHuoFozZcn7+DIoEjmwcHGcLUzF9p4gdNYoPDlkHAZpx/LoFfV0rWLwyJn5C4Iu8m8sod2YA5afOfU2xsOjfRCZb834LC1P2Uhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5605
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_141441_524926_A2B42AD0 
X-CRM114-Status: GOOD (  33.53  )
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

T24gVHVlLCAyMDIzLTA1LTA5IGF0IDA3OjQyICswODAwLCBKZXJlbXkgS2VyciB3cm90ZToNCj4g
SGkgSXdvbmEsDQo+IA0KPiA+IFdvdWxkbid0IGNyZWF0aW5nICJtY3RwaTNjWCIgbmV0d29yayBp
bnRlcmZhY2UgZm9yIGVhY2ggSTNDIGRldmljZSByYXRoZXINCj4gPiB0aGFuDQo+ID4gSTNDIGJ1
cyBiZSBhIGJldHRlciBmaXQgdG8gbW9kZWwgTUNUUCBvdmVyIEkzQz8NCj4gDQo+IEdyZWF0IHF1
ZXN0aW9uISBBIGZldyByZWFzb25zIGZvciB0aGlzIHN0cnVjdHVyZToNCj4gDQo+IMKgLSBpdCBp
cyBhIGNsb3NlciBtYXRjaCB0byBleGlzdGluZyB1c2FnZSBvZiBuZXR3b3JrIGludGVyZmFjZXMg
YW5kDQo+IMKgwqAgcmVtb3RlIGVuZHBvaW50cyAoc2F5LCBJUCwgQ0FOLCBldGMpOiB5b3UgaGF2
ZSBhbiBpbnRlcmZhY2UgZm9yDQo+IMKgwqAgcmVwcmVzZW50aW5nIHRoZSBsb2NhbCBoYXJkd2Fy
ZSBhbmQgc3RhY2sgc3RhdGUsIHdoaWNoIG1heSBwcm92aWRlIGENCj4gwqDCoCBwYXRoIGZvciBh
bnkgZGV2aWNlcyByZWFjaGFibGUgdGhyb3VnaCB0aGF0IGhhcmR3YXJlLg0KPiANCj4gwqAtIGEg
c2ltcGxlciBhZGRyZXNzaW5nIHN0cnVjdHVyZTogeW91IG9ubHkgbmVlZCBvbmUgKmxvY2FsKiBN
Q1RQDQo+IMKgwqAgYWRkcmVzcyAoRUlEKSBmb3IgdGhlIHdob2xlIGJ1cywgcmF0aGVyIHRoYXQg
b25lIHBlciByZW1vdGUgZGV2aWNlLg0KPiANCj4gwqAtIHRoZSBwcmVzZW5jZS9hYnNlbmNlIG9m
IGludGVyZmFjZXMgaXMgbm90IGRlcGVuZGVudCBvbiB3aGF0J3MNCj4gwqDCoCBjb25uZWN0ZWQg
dG8gdGhlIGJ1cy4gSWYgd2UgdXNlZCBhIG5ldGRldiBwZXIgcmVtb3RlIGRldmljZSwgdXNlcnMN
Cj4gwqDCoCB3b3VsZCBub3QgYmUgYWJsZSB0byBzZXQgdXAgdGhlIGxvY2FsIHN0YWNrIHVudGls
IGEgcmVtb3RlIGVuZHBvaW50DQo+IMKgwqAgaXMgYm91bmQgKGllLCB1c2Vyc3BhY2Ugd291bGQg
bmVlZCB0byBjb25maWd1cmUgZXZlcnkgaW50ZXJmYWNlIG9uDQo+IMKgwqAgaTNjIGhvdCBqb2lu
KS4gV2l0aCB0aGlzIG1vZGVsLCB0aGF0IHN0YWNrIHN0YXRlIGNhbiBwZXJzaXN0IG92ZXINCj4g
wqDCoCB3aGF0ZXZlciBtYXkgYmUgaGFwcGVuaW5nIHRvIHJlbW90ZSBkZXZpY2VzICh1bnBsdWcs
IHJlc2V0LA0KPiDCoMKgIHJlLWFkZHJlc3NpbmcsIGV0YykuDQo+IA0KPiDCoC0gaWYgdGhlcmUg
aXMgZXZlciBhIHByb3Bvc2FsIGZvciBicm9hZGNhc3QgbWVzc2FnZXMgaW4gdGhlIGkzYw0KPiDC
oMKgIHRyYW5zcG9ydCBiaW5kaW5nLCB3ZSB3b3VsZCBoYXZlIHRvIHJlLXdyaXRlIGl0IGluIHRo
aXMgc3RydWN0dXJlDQo+IMKgwqAgYW55d2F5Lg0KPiANCj4gPiBXaHkgYXJlIHdlIGZvbGxvd2lu
ZyB0aGUgbWN0cC1pMmMgYXBwcm9hY2ggcmF0aGVyIHRoYW4gbWN0cC1zZXJpYWw/DQo+IA0KPiBt
Y3RwLXNlcmlhbCBmb2xsb3dzIHRoZSBzYW1lIG1vZGVsOiB0aGUgbG9jYWwgZGV2aWNlIGlzIGFs
d2F5cyBwcmVzZW50LA0KPiB0aGUgZGlmZmVyZW5jZSBoZXJlIGJlaW5nIHRoYXQgbm8gcGh5c2lj
YWwgYWRkcmVzc2luZyBpcyByZXF1aXJlZC4NCj4gUm91dGVzIHRvIHJlbW90ZSBlbmRwb2ludHMg
YXJlIGFkZGVkIGRlcGVuZGluZyBvbiByZW1vdGUgZW5kcG9pbnQgc3RhdGUsDQo+IGJ1dCB0aGUg
bG9jYWwgc3RhdGUgaXMgcHJlc2VydmVkIHJlZ2FyZGxlc3Mgb2Ygd2hhdCBpcyAob3IgaXMgbm90
KSBvbg0KPiB0aGUgb3RoZXIgZW5kIG9mIHRoZSBsaW5rLg0KPiANCj4gPiBUaGlzIHdvdWxkIGFs
c28gc2ltcGxpZnkgdGhlIHNlcmllcywgYXMgd2Ugd291bGQgbm8gbG9uZ2VyIG5lZWQgIm1jdHAt
DQo+ID4gY29udHJvbGxlciIgcHJvcGVydHksIGFuZCB0aGUgZHJpdmVyIHdvdWxkIGp1c3QgZm9s
bG93IHRoZSBJM0MgY2xhc3MgZHJpdmVyDQo+ID4gbW9kZWwgd2l0aG91dCB0aGUgbmVlZCBmb3Ig
bm90aWZpZXJzLg0KPiANCj4gSXQgd291bGQgc2ltcGxpZnkgdGhlIHNlcmllcywgYnV0IHdlIHdv
dWxkIGJlIHB1bnRpbmcgYSBsb3Qgb2YgdGhvc2UNCj4gY29tcGxleGl0aWVzIG92ZXIgdG8gdXNl
cnNwYWNlLg0KDQpUaGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbiAtIGFuZCBpdCBtYWtlcyBwZXJm
ZWN0IHNlbnNlLCBJJ20ganVzdCB3b3JyaWVkIHRoYXQNCml0IG1pZ2h0IGJlIGRpZmZpY3VsdCB0
byBtb2RlbCBjZXJ0YWluIHVzZSBjYXNlcyB3aXRoIHRoaXMgc3RydWN0dXJlLg0KDQpTcGVjaWZp
Y2FsbHk6IA0KDQoxKSBUaGlzIGlzIGEgc2ltcGxpZmllZCBleGFtcGxlIC0gdGhlIEVJRCBjb2xs
aXNpb24gY2FuIGhhcHBlbiBmdXJ0aGVyIGRvd24gdGhlDQpuZXR3b3JrICh3aXRoIGJvdGggSTND
IGRldmljZXMgYWN0aW5nIGFzIGJyaWRnZXMgYW5kIGhhdmluZyBtdWx0aXBsZSBNQ1RQDQplbmRw
b2ludHMgYmVoaW5kIHRoZW0pLCBib3R0b20gbGluZSBpcyAtIHdlJ3JlIGRlYWxpbmcgdHdvIHNl
cGFyYXRlIG5ldHdvcmtzLg0KU2luY2UgdGhlIG5ldHdvcmsgaXMgYSBsaW5rIHByb3BlcnR5IC0g
ZG8gd2UgaGF2ZSBhIHdheSBmb3J3YXJkIGlmIHdlIGdvIHdpdGggYQ0Kc2luZ2xlIG5ldHdvcmsg
aW50ZXJmYWNlIGZvciBJM0MgY29udHJvbGxlciBpZiB3ZSBuZWVkIHRvIHdvcmsgaW4gYW4gZW52
aXJvbm1lbnQNCmxpa2UgdGhpcz8NCg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICBOZXR3
b3JrIDENCiAgICAgICAgICAgICAgICAgICAgICAgICArLS0tLS0tLS0tLS0tLS0tLS0tKw0KICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICB8DQogICBOZXR3b3JrID8g
ICAgICAgICAgICAgfCBkZXZpY2UgZWlkIDB4MTIgIHwNCistLS0tLS0tLS0tLS0rICAgICArLS0t
LS0rICAgICAgICAgICAgICAgICAgfA0KfCAgZWlkIDB4MTEgICstLS0tLSsgICAgICstLS0tLS0t
LS0tLS0tLS0tLS0rDQp8IGNvbnRyb2xsZXIgfA0KfCAgZWlkIDB4MTAgICstLS0tLSsgICAgICst
LS0tLS0tLS0tLS0tLS0tLS0rDQorLS0tLS0tLS0tLS0tKyAgICAgKy0tLS0tKyAgICAgICAgICAg
ICAgICAgIHwNCiAgICAgICAgICAgICAgICAgICAgICAgICB8IGRldmljZSBlaWQgMHgxMiAgfA0K
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICB8DQogICAgICAgICAg
ICAgICAgICAgICAgICAgKy0tLS0tLS0tLS0tLS0tLS0tLSsNCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgTmV0d29yayAyDQoNCjIpIFRoaXMgaXMgdGhlICJub3JtYWwiIGNhc2UuIDB4MTEg
c2VuZHMgTUNUUCBtZXNzYWdlIHRvIDB4MTIgKGJ5IGlzc3VpbmcgSUJJIHRvDQp0aGUgY29udHJv
bGxlcikuIEhvdyB3aWxsIHRoZSByb3V0aW5nIHRhYmxlIG5lZWQgdG8gbG9vayBsaWtlIGluIG9y
ZGVyIGZvciB0aGUNCm1lc3NhZ2UgdG8gYmUgcmV0cmFuc21pdGVkIG9uIHRoZSBzYW1lIG5ldHdv
cmsgaW50ZXJmYWNlPyBXaGF0IGlmIHdlIGRvIG5vdCB3YW50DQp0byBmb3J3YXJkPyBXaGF0IHdv
dWxkIGJlIHRoZSBkaWZmZXJlbmNlPw0KDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgIE5l
dHdvcmsgMQ0KICAgICAgICAgICAgICAgICAgICAgICAgICstLS0tLS0tLS0tLS0tLS0tLS0rDQog
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgIHwNCiAgIE5ldHdvcmsg
MSAgICAgICAgICAgICB8IGRldmljZSBlaWQgMHgxMSAgfA0KKy0tLS0tLS0tLS0tLSsgICAgICst
LS0tLSsgICAgICAgICAgICAgICAgICB8DQp8ICAgICAgICAgICAgKy0tLS0tKyAgICAgKy0tLS0t
LS0tLS0tLS0tLS0tLSsNCnwgY29udHJvbGxlciB8DQp8ICBlaWQgMHgxMCAgKy0tLS0tKyAgICAg
Ky0tLS0tLS0tLS0tLS0tLS0tLSsNCistLS0tLS0tLS0tLS0rICAgICArLS0tLS0rICAgICAgICAg
ICAgICAgICAgfA0KICAgICAgICAgICAgICAgICAgICAgICAgIHwgZGV2aWNlIGVpZCAweDEyICB8
DQogICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgIHwNCiAgICAgICAg
ICAgICAgICAgICAgICAgICArLS0tLS0tLS0tLS0tLS0tLS0tKw0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBOZXR3b3JrIDENCg0KVGhhbmtzDQotSXdvbmENCg0KDQo+IA0KPiBDaGVlcnMs
DQo+IA0KPiANCj4gSmVyZW15DQoNCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkz
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtaTNjCg==
