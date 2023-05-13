Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4488EC77B7F
	for <linux-i3c@archiver.kernel.org>; Sat, 13 May 2023 20:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rM97/rqq80Myce2xES5wZqA06aDccZ4tiETNEr6HR88=; b=0QnhTO/7Ft6eKF
	CfEp2XLebwssyAVn17sk6U92DkNgqPRAJnKsYk2yiXWfjwVUGK+dHhkCsnroVLpqBa8Pw8RgGtOTf
	XetlNUf2LswRll+cUsHdmko5vagY35d5rL0+367OhXup4a6eqAQeRL05S5q+bciToJM1cGSZJySJs
	Wzo3AVJ++CVkTAFYCmc+dM/N2iH96MUOLu0NjaR4BD/jfl9c94OJpgXsUpOrMkimPKARxqvFzHn/I
	x4gDDPi+T7CNK0tYaagizlw2mH1nv/lTl1s0PwKo9txtz2eL/sqUFWD8pSGhmAlkS2sZ7t08gZuQl
	C/UfwHxZVG3+eTQgj5lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxvkt-00FkL9-1R;
	Sat, 13 May 2023 20:22:15 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxvkq-00FkKS-0j
	for linux-i3c@lists.infradead.org;
	Sat, 13 May 2023 20:22:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684009332; x=1715545332;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=tdO31ZErO5GQ/FOeg56Uf+uG9OKDuqmiPZv1Mkx3Ky4=;
  b=Y15ZYjfU+GTKOV99CJ0/sLK3VuRM5yXbzrnpvQtebvsAftq4izXz7gjY
   F1QL4EjpFIr01PwLdXN/BRcJ/VBL1YXwzgC/xZGTeqOQf87SlayjqBzBQ
   SC8QmEPcaIG12CBN7rSDNuoKil4LcZkEI07g23o9ptNTzyuBZdwmZDtmO
   0WSxHV0HIUotTA+BBChotqLXdx5SNu1NOqkogJpZycPFOEMqGKkat32NX
   9svJx/cUQjsnt0yrnGshqmdKMx8WwPdizUSunWvj1blQy9AnlaxnTQAE3
   l9HGjg+zAiuh6qr3EYcPWNuKkBTXk6bp+v9P/JFqtFFK+byN5lQDLyj9/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="331354909"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="331354909"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 13:22:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="946970964"
X-IronPort-AV: E=Sophos;i="5.99,273,1677571200"; 
   d="scan'208";a="946970964"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga006.fm.intel.com with ESMTP; 13 May 2023 13:21:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 13 May 2023 13:21:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sat, 13 May 2023 13:21:57 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sat, 13 May 2023 13:21:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzmvAvwokKxLYWfeH4HsXRl/z+zOFXeO0pFujo43ZqtgUQquZBcuMQrCMjabDg/uDT9y9LuXe1/MFQqS49hx16tmvpG54qr+55KEJwj74m28Cw/tx+RpsL82Oi+p7q/BXAMFfcHrZoPzXUh4cYBzfBXgqdQTwZlDx1oibgzNRN01K41H0uS5rVK3C7ur/aDT2qhFAql5RumjMr8Ghe4oEUEjxIopFNxtxrAMD0HXUVdFv3J6HtmVDfYE64Bf40N1UKL/gXNjoZWXhMpF+pGn+dakulQhlLK9bO09tve6eTQtLoMhYCsWJR1B1bJQat6qOjo+NvPZQ/TZYXwIvQUxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdO31ZErO5GQ/FOeg56Uf+uG9OKDuqmiPZv1Mkx3Ky4=;
 b=dhawAxbCoJfhcsfuYPyvFWvDunsvp0P38CUoxWBuyvOLCxmQHcNd81s9yjZGhKJ+edp3bL+IJ77MH8yvS3yhs3K0U9ooRpmyJ8wAGWnuLA7cQU3MMsoQHwbti+h9ZiFLt3bomejU3Axq4QeuXMyB/bx33VNxLWjATSWrL8GH/H2RIJBIBDo2AKOi1W3RCfiBt8aTGr9rn6uwAvMQCkefQhG1gHj3sCJjK2etpc0rHPQJfE+u1Rlf+cq4UEuMj7ZhRKQlx7QeT1J35Fi2t3EsTNJMvucg+nrkUTgdEd0MIwnNyfM+Ci/OcSZ3+8q7VjlVbyyy1zPDzMAoJ2Rk3EGGlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5823.namprd11.prod.outlook.com (2603:10b6:303:186::12)
 by CO1PR11MB5185.namprd11.prod.outlook.com (2603:10b6:303:6e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.29; Sat, 13 May
 2023 20:21:55 +0000
Received: from MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::c91d:6ffc:c1a5:8c5d]) by MW4PR11MB5823.namprd11.prod.outlook.com
 ([fe80::c91d:6ffc:c1a5:8c5d%5]) with mapi id 15.20.6387.022; Sat, 13 May 2023
 20:21:55 +0000
From: "Winiarska, Iwona" <iwona.winiarska@intel.com>
To: "jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
	"matt@codeconstruct.com.au" <matt@codeconstruct.com.au>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"joel@jms.id.au" <joel@jms.id.au>
Subject: Re: [RFC PATCH 0/2] I3C MCTP net driver
Thread-Topic: [RFC PATCH 0/2] I3C MCTP net driver
Thread-Index: AQHZcLHslnrqCWg690u04c5fB2wYBK9Q1C2AgABX+gCAAWjxAIAAaGuAgAXSMgA=
Date: Sat, 13 May 2023 20:21:54 +0000
Message-ID: <ec88c12095acb199492674adb2f01e1a9c5a9425.camel@intel.com>
References: <20230413081139.15673-1-matt@codeconstruct.com.au>
	 <f741f271752a6b141667625676487311a877a3db.camel@intel.com>
	 <4127aa2454a33bccf666597c292943ded9ccaa5d.camel@codeconstruct.com.au>
	 <4f58f4be52613b2ca18a68ec2bd511b4014c9143.camel@intel.com>
	 <8a95f7c15e9961cdde6b49662cd7fd4aed5c0ab6.camel@codeconstruct.com.au>
In-Reply-To: <8a95f7c15e9961cdde6b49662cd7fd4aed5c0ab6.camel@codeconstruct.com.au>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5823:EE_|CO1PR11MB5185:EE_
x-ms-office365-filtering-correlation-id: c3a7a3fe-339e-4191-337b-08db53efb1e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O1qXQv4SAVlKQW8f5sdBCxnIabyGFtkeScR/UHooiQfkvuppK/vzocvT6GDSj41RGNbnVXgXzxDXDKamWupxMF6fFqffm/4f52be7rpYaEtL247BTccIr9PYKMerhc0dhla0bB9p+olKWtin/wttEmhKZeRdgJBZ9B5aDYi4V5iTHIMDN5mqXCs853gJXPf0LuQOmB/PR1o4jE8CaWRaRDvavfmMeYFqasqhq2024Sms7nXxE0l38yEO+iIuZkg/frmkkbpxr4hd2lj9WUQWPNub3D1Lqpd57dD6uD1Xh6ak92YW++tKzF9OY/Sw73wccoeyknE+mnEW8E/WcfEAvPODiNbWE3nmCMwFj9LgRPoa9rFcKkU1ZrwWyruK2xI8JwOhjGzfjb6UoD7u9XQitIscW9/WjW0ZcDRzYTv9bervxz9YupvZ+BO8nOdw/upWG+Y/xzIvB+ROfDltjGKZircE6SBEktyXJAE7yhkXJrs5PTCT/yY51GJgu0HG1qFqgQ9d5BORBgUWT/qO94F/fb9o0ifNwirYDn5tQ2RKzDonsX1cHJD05URUlsk9fjkBxnMvSMdcgCFNxPLoGvC8apGkO1Hs3b7a+e48na8U7QJpZUEAeIzEd6cjpXs9X3Oj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5823.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199021)(36756003)(38100700002)(4326008)(2906002)(8676002)(8936002)(5660300002)(83380400001)(316002)(86362001)(66446008)(66476007)(66556008)(66946007)(76116006)(38070700005)(64756008)(41300700001)(122000001)(82960400001)(91956017)(186003)(6512007)(6506007)(26005)(6486002)(71200400001)(478600001)(54906003)(2616005)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZzA5SGdScnhUYzRPSFlyOURDTDQvdEV2bXlyT3RXUkpkNmN4WnhOeWhSaWpI?=
 =?utf-8?B?c3ZGSUF1Ym82RnJPblRXV2VoSjZuWjh2VUYzdmdyZGVpUTZJcVZlT2x5VnhU?=
 =?utf-8?B?TnBxY2Q0K2FkM201OTNBYUhBS0svUk9FUlJTVmswTFdROGNMdGVvcmV0d0Rz?=
 =?utf-8?B?b2JYV2lWTlF1VkEwM0Y3NmtTbTVNOVI2RU80TkNEWFVubXE1ZHFHQzF1QTF2?=
 =?utf-8?B?aHBESEtpeWJpL045YTE3akJMaDZIM0t3NXRkZ3RmQ3pWVkFTSC9qa0pNc1F1?=
 =?utf-8?B?ZmdoS2ZJa1BBd0hvQzdJMzNiWWdkMWhBbmVKOTBGRXhTL0RiaTh0M1ptcmRH?=
 =?utf-8?B?ejh5ZDdaZkZtOGFZZExJRlpPdlU2WWgxRFRDejZTSzlydlQxSWxCOWZ1by9z?=
 =?utf-8?B?S3NWQUEvMmJxZlhsY2N5c0t0OTlPQXZRaDZPaFFxRUFiRkFBT2dZRW8wY2pY?=
 =?utf-8?B?Y2d5bCt3Z3h4cTg1UVBXYlRoTDNkRW1XRFpWODFWY2lWcVQ5VjFPM0pBbWUv?=
 =?utf-8?B?aitnMkJENnhKNUFOTjBTQ0RQSXZPNTlNOXdnay9PVndsQ3k4eGlSVEZwRzdt?=
 =?utf-8?B?TnBremF1MXJCNEc3UDYweml0M3hrRUwzU0lUWjl5eG9IT1NZelc4TmFPK1F1?=
 =?utf-8?B?S01FNWdESXBqM2xxemV3d2V0ZzlLcUZveWJscXpJNG14MTIrWmFvZ3lyN2Nr?=
 =?utf-8?B?WWgrbWwweHk5NXVMS0ptdThuYS9wd2Q2TER4TnBNaXRpTmxoK1ZYcHltclVo?=
 =?utf-8?B?MkVQTXhxc1RpN1YzRnRLVExDY2xCcFIrL2g0b29UZmRBVUhjdXlHYlp0RU9p?=
 =?utf-8?B?WXB2bE9JTlBOOUFQcXVFakVlZkpkL2tvdGhoM0hFbDZ4c2dhbmNpcVBCYVdY?=
 =?utf-8?B?ZVIveEk3UEF0eENYRXFObndvd0dwQXFPenA5cTl6S0JYd25uSnE4YngvZ2J0?=
 =?utf-8?B?T2k4djlobWhDbUNRb1pZVExVUGRJdDl5aEMwTS9pV1RjV0pNZWNBUnJBeUIy?=
 =?utf-8?B?Y2V2YWVOVWkvQVhLbzc4TDZiczFHWTBVS3dlSXllMTRHMVlIbnlYOWF6M1Nm?=
 =?utf-8?B?TUM3RlNaZFY4WEtqNld5TzhvVDJQcytwQnN0blljSkFoWnlvQnI4Q04vZk9x?=
 =?utf-8?B?NFkxUG4yNzcrRllHMXg3YlRvVm5INXdUclpxd1NlK1l2MnR1S2dCWmsvZlJE?=
 =?utf-8?B?bGVDNHNMMC92QWtNbWdERjhUS3BhUVhiY01mUk94ZHJ6cFpUNitHajFJWEx4?=
 =?utf-8?B?VlVmdUFEK3NWbURHZldMeWtxWStXd3AySCt1TW1qRFcyT1RNbWNWZlJZRkpE?=
 =?utf-8?B?amNGTzRkbG1zU25VTThJVEl6dmZjNWdUUGdIY3RCMEdaZ1hjSndROEMzOGhm?=
 =?utf-8?B?MVJwNmU1OGxFZC9wU0cyZ3pISzdNUkRmeWlyNTZwWTdPYXQvUi9HcC9OTVlK?=
 =?utf-8?B?b2c0RHpTOEo5WTRDSk1JdHBxT1dRaXN1U1ZFbDczdG9OSXgwYnJGcGRTSm8w?=
 =?utf-8?B?NldFQytYU3d4OW8ycUgzMnAwT1lnMW8zZWd3d05xL05UbmowaWVBeGJocVRI?=
 =?utf-8?B?VHplYU5xaWNHQVpRcXpUSWF0ZlpJbEFZWk9lcGF0K0pTSFdXM1c2dDJOQ213?=
 =?utf-8?B?UkRrWlhXN2NUOVlOU2FiQVNSckpGTXgxcSs2Tmx4L2VSMm02Ry9mcFF3VDA3?=
 =?utf-8?B?STFURzlMK0tHcy9KdytsRVlTQXdIUzBxYzNnSGN6aUo1MWNsUTVTSlFHL2lK?=
 =?utf-8?B?Q1hydlJxM1pqRFB1Z2lqVkRybnkxR3Fha2xMUW9XR1d5Z0R5Zm9ZMXNIZmZ6?=
 =?utf-8?B?bDNlWkl5V1o1eklLWWJtTEJYamN2eFkwSzY1R2piZkZ1VTk4UkloT3RTRytW?=
 =?utf-8?B?d2p6ODFXZ1NhS0M1QXlFZUZLYi9vT3hQS3pldVg0aEJ2dEp1UEp4dVp4blNQ?=
 =?utf-8?B?V1IrODhSWlRmVW42bldpbUQ1anU2L0ZNL2pnK29kRzJ2eDhISk9LeERDbDRH?=
 =?utf-8?B?Z2UyZGo1VDY3ZGJoOGQzNS8vRE93aWJkQTdVVUFzYzJmc1hWWmV1b2pFcDZD?=
 =?utf-8?B?Z2JOUmZUZ3VYdTFGL0dTdDdYaysyMTlETHBXQzMwNEFoUEJxVnJ1TndyNFBX?=
 =?utf-8?B?Z3BSZjRnTFl1UzRST1Z1c2dBUDN0Q01IcWRrVHZWc3BBck1pYlJsNkdueHNC?=
 =?utf-8?B?Qmc9PQ==?=
Content-ID: <C9D8945BB1366642AB9B984AC1A94027@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5823.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a7a3fe-339e-4191-337b-08db53efb1e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2023 20:21:54.9416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VbAs9E/YwrEqWZxzWkDa6WS6OpWlNkMbl69pmERTStlA1kpJ+1MdOtc1K33wfgbHBiRaeGpnRWibfi6xdyDCe7+J/3VaDtyvqUqaoVsPRco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5185
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230513_132212_379681_683EBE5C 
X-CRM114-Status: GOOD (  31.98  )
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

T24gV2VkLCAyMDIzLTA1LTEwIGF0IDExOjI4ICswODAwLCBKZXJlbXkgS2VyciB3cm90ZToKPiBI
aSBJd29uYSwKPiAKPiA+IFNpbmNlIHRoZSBuZXR3b3JrIGlzIGEgbGluayBwcm9wZXJ0eSAtIGRv
IHdlIGhhdmUgYSB3YXkgZm9yd2FyZCBpZiB3ZSBnbwo+ID4gd2l0aCBhCj4gPiBzaW5nbGUgbmV0
d29yayBpbnRlcmZhY2UgZm9yIEkzQyBjb250cm9sbGVyIGlmIHdlIG5lZWQgdG8gd29yayBpbiBh
bgo+ID4gZW52aXJvbm1lbnQKPiA+IGxpa2UgdGhpcz8KPiA+IAo+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTmV0d29yayAxCj4gPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKy0tLS0tLS0t
LS0tLS0tLS0tLSsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4gPiDCoMKgIE5l
dHdvcmsgP8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IGRldmljZSBlaWQgMHgxMsKgIHwKPiA+
ICstLS0tLS0tLS0tLS0rwqDCoMKgwqAgKy0tLS0tK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfAo+ID4gPiDCoGVpZCAweDExwqAgKy0tLS0tK8KgwqDCoMKgICstLS0tLS0tLS0t
LS0tLS0tLS0rCj4gPiA+IGNvbnRyb2xsZXIgfAo+ID4gPiDCoGVpZCAweDEwwqAgKy0tLS0tK8Kg
wqDCoMKgICstLS0tLS0tLS0tLS0tLS0tLS0rCj4gPiArLS0tLS0tLS0tLS0tK8KgwqDCoMKgICst
LS0tLSvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IGRldmljZSBlaWQgMHgxMsKg
IHwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4gPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKy0tLS0tLS0tLS0tLS0tLS0tLSsKPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IE5ldHdvcmsgMgo+IAo+IFNvIEkgd2VudCBkaWdnaW5nIGFyb3VuZCB0byBzZWUgaG93IHRoaXMg
Y29uZmlndXJhdGlvbiBmaXRzIHdpdGggdGhlCj4gTUNUUCBzdGFuZGFyZHMuIEEgYml0IG9mIGJh
Y2tncm91bmQsIHdoaWNoIEknbSBzdXJlIHlvdSdyZSBhbHJlYWR5Cj4gZmFtaWxpYXIgd2l0aCwg
YnV0IGp1c3Qgc28gd2UgaGF2ZSBhIHNoYXJlZCByZWZlcmVuY2U6Cj4gCj4gVGhlIE1DVFAgQmFz
ZSBzcGVjIChEU1AwMjM2KSBoYXMgYSBkZWZpbml0aW9uIGZvciBhICJNQ1RQIGJ1cyI6Cj4gCj4g
wqDCoMKgIDMuMi43Cj4gwqDCoMKgIGJ1cwo+IMKgwqDCoCBhIHBoeXNpY2FsIGFkZHJlc3Npbmcg
ZG9tYWluIHNoYXJlZCBiZXR3ZWVuIG9uZSBvciBtb3JlIHBsYXRmb3JtCj4gwqDCoMKgIGNvbXBv
bmVudHMgdGhhdCBzaGFyZSBhIGNvbW1vbiBwaHlzaWNhbCBsYXllciBhZGRyZXNzIHNwYWNlCj4g
Cj4gV2hpY2ggd291bGQgbWVhbiB0aGF0IHlvdXIgdHdvIGRldmljZXMgdGhlcmUgYXJlIG9uIHRo
ZSBzYW1lIE1DVFAgYnVzLAo+IGdpdmVuIHdlIGhhdmUgc2hhcmVkIHBoeXNpY2FsIGFkZHJlc3Mg
c3BhY2UuIE91ciBhcHByb2FjaCBmb3IgdGhlIGtlcm5lbAo+IE1DVFAgc3RhY2sgaXMgZm9yIGEg
bmV0ZGV2IChpZSwgdGhlIGludGVyZmFjZSkgdG8gcmVwcmVzZW50IHRoZSBzeXN0ZW0ncwo+IGNv
bm5lY3Rpb24gdG8gYSBidXMuCj4gCj4gV2hpbGUgdGhlcmUncyBub3RoaW5nIGV4cGxpY2l0bHkg
ZGVmaW5pbmcgd2hldGhlciBhIE1DVFAgYnVzIGlzIHJlcXVpcmVkCj4gdG8gb25seSBob3N0IG9u
ZSBNQ1RQIG5ldHdvcmssIGFsbCBvZiB0aGUgZXhhbXBsZSB0b3BvbG9naWVzIGluIERTUDAyMzYK
PiBzZWVtIHRvIGFzc3VtZSBzby4KPiAKPiBUaGVuOiB0aGUgTUNUUCBJM0MgVHJhbnNwb3J0IEJp
bmRpbmcgc3BlYyAoRFNQMDIzMykgaW50cm9kdWNlcyBhCj4gImxvZ2ljYWwgYnVzIiB0ZXJtLCBi
dXQgd2l0aCBubyBmb3JtYWwgZGVmaW5pdGlvbi4gVGhpcyB3b3VsZCBjb3ZlciB5b3VyCj4gbW9k
ZWwgYWJvdmUsIHdoZXJlIHRoZSB0d28gZGV2aWNlcyBhcmUgb24gZGlmZmVyZW50IGxvZ2ljYWwg
YnVzc2VzLCBidXQKPiB0aGUgc2FtZSBNQ1RQIGJ1cy4gVGhlcmUncyBhbiBleGFtcGxlIG9mIHRo
YXQgaW4gRmlndXJlIDMuCj4gCj4gSG93ZXZlciwgdGhlcmUncyBzdGlsbCBubyBjbGFyaWZpY2F0
aW9uIG9uIHdoZXRoZXIgdGhlc2UgbG9naWNhbCBidXNlcwo+IGNhbiBiZSBvbiBzZXBhcmF0ZSBu
ZXR3b3JrcyAoYW5kIHNvIG9wZXJhdGUgd2l0aGluIGEgc2VwYXJhdGUgRUlECj4gc3BhY2UpLiBJ
biBmYWN0LCB0aGUgRmlndXJlIDMgZXhhbXBsZSAqcmVxdWlyZXMqIHRoZSBsb2dpY2FsIGJ1c3Nl
cyB0bwo+IGJlIG9uIHRoZSBzYW1lIG5ldHdvcmssIGFzIHRoZSBUb3AgTGV2ZWwgQnVzIE93bmVy
IGV4aXN0cyBvbiBhIHNlcGFyYXRlCj4gbG9naWNhbCBidXMgdG8gaXRzIG93bmVkIGRldmljZXMu
Cj4gCj4gW1RoZXJlIGFyZSBhbHNvIGEgY291cGxlIG9mIGluY29uc2lzdGVuY2llcyBpbiB0aGlz
IHBhcnQgb2YgRFNQMDIzMzsKPiB0aGVyZSdzIGEgcmVmZXJlbmNlIHRvICJicmlkZ2luZyBiZXR3
ZWVuIG5ldHdvcmtzIiwgd2hpY2ggaXNuJ3QgcG9zc2libGUKPiB3aXRoIHRoZSBkZWZpbml0aW9u
cyBvZiAiYnJpZGdpbmciIGFuZCAibmV0d29yayIsIGFzIHdlbGwgYXMgYSBmb290bm90ZQo+IHRo
YXQgY29udHJhZGljdHMgdGhlIGRlZmluaXRpb24gb2YgYSBNQ1RQIGJ1cy4gSSdsbCBzZWUgaWYg
SSBjYW4gY2hhc2UKPiB1cCBzb21lIGNsYXJpZmljYXRpb25zIHRvIHRob3NlXQo+IAo+IEFueWhv
dzogaXQgZG9lc24ndCBzZWVtIHRvIGJlIHByb2hpYml0ZWQgYnkgdGhlIHN0YW5kYXJkLCBidXQg
SSdtIG5vdAo+IHNlZWluZyBtdWNoIGluIHRoZSB3YXkgb2YgYWxsb3dpbmcgaXQgZWl0aGVyLiBJ
J20gaGFwcHkgdG8gZ28gYnkgdGhlCj4gYXNzdW1wdGlvbiB0aGF0IGl0J3MgYWxsb3dlZCwgYnV0
IGl0IGRvZXMgc2VlbSB1bm5lY2Vzc2FyaWx5IGVjbGVjdGljIHRvCj4gbWUuCj4gCj4gQmFjayB0
byB0aGUgZmlndXJlIDMgZXhhbXBsZSwgYW5kIGFzc3VtaW5nIHdlIHdhbnQgdG8gcHJlc2VydmUg
dGhlCj4gZXhpc3RpbmcgY29uY2VwdCBvZiB0aGUgbmV0ZGV2IGJlaW5nIHRoZSBjb25uZWN0aW9u
IHRvIGEgYnVzOiB0aGlzCj4gKnJlcXVpcmVzKiB1cyB0byBpbXBsZW1lbnQgdGhlIG5ldGRldi1w
ZXItYnVzIChyYXRoZXIgdGhhbgo+IG5ldGRldi1wZXItcmVtb3RlLWVuZHBvaW50KSBtb2RlbCBh
cyBwcm9wb3NlZCBpbiB0aGlzIHNlcmllcywgYXMgdGhlcmUKPiBpcyB0aGUgc2hhcmVkIGxvZ2lj
YWwgYnVzIGJldHdlZW4gbXVsdGlwbGUgcmVtb3RlIGVuZHBvaW50cy4KPiAKPiBJbiBvcmRlciB0
byByZXByZXNlbnQgeW91ciB1c2UtY2FzZSBvZiBtdWx0aXBsZSBsb2dpY2FsIGJ1c3NlcywgSSB3
b3VsZAo+IHByb3Bvc2UgdGhhdCB3ZSB1c2UgYSBzaW1pbGFyIG1vZGVsIHRvIGhvdyBsb2dpY2Fs
IGV0aGVybmV0IGludGVyZmFjZXMKPiAoaWUsIFZMQU5zKSBhcmUgYWxyZWFkeSBpbXBsZW1lbnRl
ZCBpbiBMaW51eC4gVW5kZXIgdGhhdCBtb2RlbCwgd2UgY291bGQKPiBhbGxvdyBuZXcgKGxvZ2lj
YWwpIGludGVyZmFjZXMgdG8gYmUgY3JlYXRlZCBhcyBzdWJvcmRpbmF0ZSB0byB0aGUKPiBleGlz
dGluZyAoYWN0dWFsKSBpbnRlcmZhY2VzLCB3aGljaCB3b3VsZCByZXByZXNlbnQgdGhlIHN5c3Rl
bSdzCj4gY29ubmVjdGlvbiB0byBhICpsb2dpY2FsKiBidXMsIGFuZCBwcm92aWRlIHRoZSBtYXBw
aW5nIHRvIGEgTUNUUCBuZXR3b3JrLgo+IAo+IEZvciB0aGF0LCB3ZSB3b3VsZCBuZWVkIGEgYml0
IG9mIG5ldGxpbmsgZGVmaW5pdGlvbiB0byBhbGxvdwo+IGNvbnN0cnVjdGlvbiBvZiB0aGUgbG9n
aWNhbC1idXMgbmV0ZGV2LiBJICp0aGluayogd2UgY291bGQgdGhlbiB1c2UgdGhlCj4gZXhpc3Rp
bmcgbmVpZ2hib3VyIHRhYmxlIGRlZmluaXRpb25zIHRvIHByb3ZpZGUgdGhlIHBhcnRpdGlvbmlu
ZyBvZgo+IGRldmljZXMgb3ZlciBsb2dpY2FsIGJ1c3Nlcy4KPiAKPiBIb3dldmVyOiBJIHdvdWxk
IHRoaW5rIGl0IHdvdWxkIGJlIG11Y2ggc2ltcGxlciB0byBqdXN0IHB1dCB0aGUgdHdvCj4gZGV2
aWNlcyBvbiB0aGUgc2FtZSBpM2MgYnVzIG9uIHRoZSBzYW1lIE1DVFAgbmV0d29yaywgYW5kIGFz
c2lnbgo+IGRpc3RpbmN0IEVJRHMuIFdoZXRoZXIgdGhvc2UgZGV2aWNlcyBjb3VsZCBjb21tdW5p
Y2F0ZSBjYW4gYmUgZGVmaW5lZCBieQo+IGJyaWRnaW5nIHBvbGljeS4KClRoZSBvbmx5IHJlYXNv
biB3aHkgSSBiZWxpZXZlIGl0IHdvdWxkIGJlIHBvc3NpYmxlIGZvciBzb21lb25lIHRvIGNvbWUg
dXAgd2l0aApzdWNoIG5ldHdvcmsgbGF5b3V0IHdvdWxkIGJlIHRoZSBsaW1pdGVkIGFtb3VudCBv
ZiBFSURzIGF2YWlsYWJsZSBpbiBNQ1RQIDEueCwKaW4gd2hpY2ggY2FzZSBwdXR0aW5nIGV2ZXJ5
dGhpbmcgaW4gdGhlIHNhbWUgTUNUUCBuZXR3b3JrIHdvbid0IGJlIGFuIG9wdGlvbi4KCkknbSBi
cmluZ2luZyB0aGlzIHVwLCBzaW5jZSBJIG9yaWdpbmFsbHkgY29uc2lkZXJlZCBkZXZpY2UtZHJp
dmVyIG1vZGVsIHRoYXQKZ29lcyB3aXRoIG5ldHdvcmsgY29udHJvbGxlciBwZXIgSTNDIGRldmlj
ZS4KSSB0aGluayB0aGlzIGlzIHRoZSBvbmx5IGNhc2UgaW4gd2hpY2ggaXQgY2FuIGJlIG1vcmUg
Y29tcGxpY2F0ZWQgdG/CoG1vZGVsLgpJIGp1c3Qgd2FudCB0byBhdm9pZCBhIHNpdHVhdGlvbiB3
aGVyZSB3ZSBwYWludCBvdXJzZWx2ZXMgaW50byBhIGNvcm5lciwgYW5kIHRoZQpWTEFOLWxpa2Ug
YXBwcm9hY2ggc291bmRzIGdvb2QgdG8gbWUgKGlmIHdlIGV2ZXIgZW5kIHVwIG5lZWRpbmcgaXQp
LgoKPiAKPiBPbiB0byB0aGF0LCB3aGlsZSBzbGlnaHRseSByZS1vcmRlcmluZyB5b3VyIHF1ZXN0
aW9uczoKPiAKPiA+IDIpIFRoaXMgaXMgdGhlICJub3JtYWwiIGNhc2UuCj4gPiAKPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5ldHdv
cmsgMQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICstLS0tLS0tLS0tLS0tLS0tLS0rCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfAo+
ID4gwqDCoCBOZXR3b3JrIDHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCBkZXZpY2UgZWlkIDB4
MTHCoCB8Cj4gPiArLS0tLS0tLS0tLS0tK8KgwqDCoMKgICstLS0tLSvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHwKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKy0tLS0tK8Kg
wqDCoMKgICstLS0tLS0tLS0tLS0tLS0tLS0rCj4gPiA+IGNvbnRyb2xsZXIgfAo+ID4gPiDCoGVp
ZCAweDEwwqAgKy0tLS0tK8KgwqDCoMKgICstLS0tLS0tLS0tLS0tLS0tLS0rCj4gPiArLS0tLS0t
LS0tLS0tK8KgwqDCoMKgICstLS0tLSvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
IGRldmljZSBlaWQgMHgxMsKgIHwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKy0tLS0t
LS0tLS0tLS0tLS0tLSsKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIE5ldHdvcmsgMQo+ID4gCj4gPiBIb3cgd2lsbCB0aGUgcm91dGlu
ZyB0YWJsZSBuZWVkIHRvIGxvb2sgbGlrZSBpbiBvcmRlciBmb3IgdGhlIG1lc3NhZ2UKPiA+IHRv
IGJlIHJldHJhbnNtaXRlZCBvbiB0aGUgc2FtZSBuZXR3b3JrIGludGVyZmFjZT8gV2hhdCBpZiB3
ZSBkbyBub3QKPiA+IHdhbnQgdG8gZm9yd2FyZD8gV2hhdCB3b3VsZCBiZSB0aGUgZGlmZmVyZW5j
ZT8KPiAKPiBUaGVyZSBhcmUgYSBjb3VwbGUgb2Ygb3B0aW9ucyBoZXJlOgo+IAo+IMKgKiB3ZSBz
ZXQgYSAiZm9yd2FyZGluZyIgYm9vbGVhbiBmbGFnIG9uIHRoZSBuZXR3b3JrLCB3aGljaCBzcGVj
aWZpZXMKPiDCoMKgIHdoZXRoZXIgb3Igbm90IHBhY2tldHMgd291bGQgYmUgZm9yd2FyZGVkIGJ5
IHRoZSBjb250cm9sbGVyIChhY3RpbmcKPiDCoMKgIGFzIGEgYnJpZGdlKQo+IAo+IMKgKiBpbmRp
dmlkdWFsIHJvdXRlcyBjb3VsZCBiZSBjb25maWd1cmVkIHdpdGggYnJpZGdpbmcgcG9saWN5OiBp
biB0aGlzCj4gwqDCoCBjYXNlLCB0aGUgaW5wdXQgaW50ZXJmYWNlIGFuZC9vciB0aGUgc291cmNl
IEVJRHMuCj4gCj4gVGhlIGZvcm1lciBpcyBkZWZpbml0ZWx5IHNpbXBsZXIsIGFuZCB3YXMgd2hh
dCBJIGhhZCBvcmlnaW5hbGx5Cj4gaW50ZW5kZWQsIGJ1dCBtYXkgbm90IGNvdmVyIGFsbCB1c2Ut
Y2FzZXMuIEknZCBiZSBpbnRlcmVzdGVkIGluIHlvdXIKPiB0aG91Z2h0cyB0aGVyZS4KCkN1cnJl
bnRseSwgSSBkb24ndCBzZWUgYW55IHVzZSBjYXNlcyB3aGVyZSBhICJmb3J3YXJkaW5nIiBib29s
ZWFuIGZsYWcgd291bGRuJ3QKYmUgZW5vdWdoLCBidXQgd2UgY2FuIGdvIGJhY2sgdG8gdGhpcyBp
biB0aGUgZnV0dXJlIHdoZW4gd2UgYWRkIGJyaWRnaW5nCnN1cHBvcnQuIAoKVGhhbmtzCi1Jd29u
YQoKPiAKPiBDaGVlcnMsCj4gCj4gCj4gSmVyZW15CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlz
dApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
