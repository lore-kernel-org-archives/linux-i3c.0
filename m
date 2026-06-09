Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1676ECD8CA8
	for <linux-i3c@archiver.kernel.org>; Tue,  9 Jun 2026 07:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Y2jUNOMDMo32/VxImeRjU/jVckXsEAyrX3hVyYs66nE=; b=F/5k0MYZLPGld62PGozc4p5Q9V
	ZRGestfYdBZ4rrUy07bxqTWS8nSy7vpomeb03K8ECwAWKLRw1IgUe0TjlzFK4hPcloCHkWSZwZ7VE
	fdgutfcekdjlchn6kz6zrgyEbadr8dUYufllk2+R6kzDCuxdIijPjQDTtzOHw2crEbMbXFmrHZ2SQ
	NqmhCbesHHT0Wu49nMSjeHbOekfYntLfEg7WxRpjP/ArKcmmX1en1V9qLirH7FUcSh1GQWvX7raCf
	6vjwtzE8ps3LSWa23zov6pr9Dfr5VZ3xG77/Vtot4fG6FyFdpSXjWxdOpauwtqwpFf0votnyhMoDi
	8aeSCGZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqVs-00000004wEZ-3Ggi;
	Tue, 09 Jun 2026 07:04:40 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqVq-00000004vxs-23Ft
	for linux-i3c@lists.infradead.org;
	Tue, 09 Jun 2026 07:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780988679; x=1812524679;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FPY0whv6ZC2hcAZf4snCCWJCDBfO4PdToIGv4gljfV0=;
  b=ReYoQVyXqJucuRX53PmZVR2vIeL2eJobEMCQcYZ//H1nCZY2diIlhUpd
   Fhcq5KSPDsQbmosa2q9RjwrzbuizeYmTfvx/iIsY1PHzm92QFBNZlnjCq
   YfQruFgHVIlQO/OWarirFeUVd4QqTSRgRqSkjowBGZ5FTc8BsloI3//O1
   aTUTFeYUSZTO10HYrNnv1T8gKmYFQTxCVZlnxNg8XIv05aE6yAqMrWAAl
   /tHXtu0tcQXYQTCEcvIfMALL75YYw1Pr2nw4oOR+LmdczSGO2X93yUtcY
   yN131lSCMoIGQbvLEkXDHrU4Rhlrma6gUCltINjK8InLQBkazssAfaj14
   Q==;
X-CSE-ConnectionGUID: 9rPh1/4BSF2MJXljjmNoBQ==
X-CSE-MsgGUID: OmIDRydXTRej8YSKkFUZdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="69274978"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="69274978"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 00:02:38 -0700
X-CSE-ConnectionGUID: eVrlsdTkTIqfg21V+FjhLw==
X-CSE-MsgGUID: /Q11k4OSReSgO1lnimr28Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
   d="scan'208";a="242836562"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 00:02:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 00:02:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 9 Jun 2026 00:02:37 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 9 Jun 2026 00:02:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZLFM6hAGBen8uptmQq6H3QMh7kIl1Fy3kl9lvigoU/XIiR5XRsCSf27xQj5GsJ8Ac0eBIos0Inmc663vO9W+/SYwqQlLl7l2HovXaPHpQbUJt9JSKByRhjoKUh3Cv1TIuZn7DC+yUZUl08pY/lAeJ+++/EKcMy7sudDAJGkKTUEZODlWFHusH5ysoOnKbdUW/B+QTdovAAfJgrAwqHuM9CgUDVZUoi4X8yJK196nTl4t/mClUpZTjw3CdQGS6WJkR8yyJvgBkWmieZXczX4CXk0ZDwp+llQH6qkmYuEfjt9vvSbLiZF/Sr/ugI7FjEijJG+pdIvswnOsmiob5jaLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJs6h6XeqbgJO9S7w8XHXlKL9k33s8m58NOBChpBaSE=;
 b=wTtM0I1rs5UK4PzQgPBx5FZ0Cab0njr367TtqvTHxFgi0pKDqbTjRtQIlg3+ecomzJ1OQ+JEQcJqVYa3r061BG6xKN1W14O5wWyv4W72i1E/5ZKrT8lOPekQAdgFkkngTYc9gzgY3yNIt/RpmpvN3ZDOVezfdVEbMnhl2JCQVa+gVReR9QVZQbuToaJYhzaX6y5C57pTxaoR30UxwD6CNppOp71t2gRbpM6IZ/qVZIe5gHU/s9GgK9+48Kq5HU+jm2NsVlnFQWhvPy36Xctcwff9+KOIrqDXtJfqj7H3O09LIdJUYZX3Y9f66T2MXkAGyG8CxyK0IEPF0Ut21I/n7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by BL1PR11MB6051.namprd11.prod.outlook.com (2603:10b6:208:393::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 07:02:29 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 07:02:29 +0000
Message-ID: <e604ba9d-4165-46a2-919d-5c7369aaed5e@intel.com>
Date: Tue, 9 Jun 2026 10:02:25 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/7] i3c: master: Prevent reuse of dynamic address on
 device add failure
To: Frank Li <Frank.Li@oss.nxp.com>
CC: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>,
	<linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260608075801.16111-1-adrian.hunter@intel.com>
 <20260608075801.16111-4-adrian.hunter@intel.com>
 <aib_vqOxucvU1J10@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aib_vqOxucvU1J10@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZPR01CA0316.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::14) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|BL1PR11MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: b111ea38-2edf-41c0-8e50-08dec5f511ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4143699003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 9hp1IAjzCc6zXz3niu158/JoK7VlcuMotGqAhfzJVnB2nNOmbaoJSL0OUIRPf4ttkeJzC8SpqwNZYf9r5BeWN1qK9pF5YANVyEbwPGK5lBCMuC3BqLLoJ9VM9PlMZz6pVAtCQOOfO2qYejNUq2MzIXHO55rcLEPaUCyM0KrDrwL7DUJOwGyDj21KUXWhlu3vGnZBm0vlyjZ395S3IY653j919oDKNA9LgK30f+6nOSdiJxltX4sUaHu8IDaUrlgmid04ZUfOw1KGiNqAqier/lldqrFjvfGZAFEpKK9lCPOhjhptgADsBU4getEjHlTxTWx0HEE4WVYmy95ZU/Ew9rFHvbbU0XD+DONkjMHfVtglhEusbozj09c2kljrE74i3xCdE7Rarb4s6wK8YRzzcUD3wxoRo+ILk7kaYyKAgSzltE+plDGHF0MD+swEiMZ/vwn72B92qBMHrlr39VuUzG9uCPqcAnPgV1NfBGjTqq/baeXZPOeQbnkgeT2CD1+l+duiiyVmIuailA9HZnqqK2hml+rWybIkDQlnizK+pOaHhPdRD0blc37VWOhj8HizIdAcaKstmcKNlorjwYsiPoqr4DIW/Oz5Q/RJjZGjkrRjcgLeeiK25VdeQRAn5ELz5XvjggOLFuE+2z9AVTjfxOCW/zEO8HMfsSBcfh6Isko9HVzz/UVkVWq4MOfOue2K
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4143699003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXF1N2tSMU90Yk5aZkplZXZVQmRJYW52Y0l4YmdiRUoxK1BLR0FVSTZCYWN5?=
 =?utf-8?B?VEZjN3dqWjdQRDR1ZHErbEFpYm9KblRFOUNWU1QyRFVMbkJuRGZqRC9vSGxV?=
 =?utf-8?B?TUZmY0JQMFpKcWMwUDBPeDIzNVFyNGxuYkQraFQ5dy9Ya2o3UEMyeFV1azV5?=
 =?utf-8?B?Z2pMQTFiNVlIVDl0N1hHbUZHd2FMZHM0amhONy9VUHRKakFrVkNkVU5uY1FN?=
 =?utf-8?B?WGZEZVdjTWFzUyt4MXIzcFZ0M2tQR0Z4Z0VWUzRYNDk0RlExdlNlQWdFdFhr?=
 =?utf-8?B?SXE5RVdnKzQwei8zVGxjQjM4aTEySE5QQjdNNi9NWkVCVVJHT2R2MWtyQmxL?=
 =?utf-8?B?OTB3c0xIdXhqbW1xTDhBRGN3cVlVWDdTVlZxU0NGRkU4QmJML3R0WDlUVjZ3?=
 =?utf-8?B?cFhOdTFxMVpkRUpzd0Z0UzE0OVhhZGVjZG5MZ0ZrWmc2OS93REdJME9vM0Q4?=
 =?utf-8?B?dCtORzdSWlN3TEMxcHIyTFRCZHJJZWcwbG1OSCtObHVGV3hJbFBCWUxzQm1Z?=
 =?utf-8?B?a3Nhd2xCV2p2N3h4UlVwQlpYR05zRzNXZnhUTU0vUTBRMEJJL0xQN2hKcjl4?=
 =?utf-8?B?N0RpUGhtSTQ3bkFDOE11Qm9BYi9DSTZTd2Fna3pxK2JJTlVxOGpjY0V5QTNh?=
 =?utf-8?B?cDBHUzRoSzFGZXhzL053bENUSXAzcXBmbEFEd2tVcFdUU2Y5NVIzVUVuNlBr?=
 =?utf-8?B?ZUhnMVlUSmVQNHJWNXhEZ3E0TkVOWDU1TjVIaDUzQ1ZCMEhBL09PSTdMaktW?=
 =?utf-8?B?bFVqM0dMY3BPNHcxSGZOVEtVaExtQi9Tem0wOGJMR3NuWnNXSUw0bXhScTQ2?=
 =?utf-8?B?ckRoajFkTTRmMU11eTNqVTJzQmZyTlRUZFpubkc5T25sMEtvMHZWTklqTGlI?=
 =?utf-8?B?dnpaZzErNUFyTnpxNkZkNlRDUWlMUGpHaDhuTTEwTGkzOE42QzFrcUx0VTc0?=
 =?utf-8?B?QzNzMWxnL3BYTWhnaVpubW53bXlHS0V3K08wdTh2TnNXZUFjMEJPUmFYTCtl?=
 =?utf-8?B?YU5KeWlHV2J2YzRadXRZN3I2QkVWb0Z2ampPcHBKQ3FZVnJMeFlGQkREMm5k?=
 =?utf-8?B?L3ByYXcwV3dtVFBVdkhsMVp1YzZKYWJWYWFaYXBNVGowdzRMTFVqY0FsL3Rt?=
 =?utf-8?B?MFRhc04wcnhVNUpXaG01MmZTWDZUUXNCTTh0aU9SZHdyWHpYRkFhcDkyOTdQ?=
 =?utf-8?B?NGhuek51TUt5TzVpVkhRQWxCQ0daTHp1eEcyU3VMQlBOSjlaTTN0Qm9PbDdK?=
 =?utf-8?B?UlorMnY2UUNPMWcyeWplQnpFd1VjNmRnUHBRUHhVNFJuUzZBbE9wR09BRkw4?=
 =?utf-8?B?MjRFNURhOFZmWlFRR1hQdUJ3bEVobUVOeHNMaDJoYS9wN0t5aXB5MkpFeGdi?=
 =?utf-8?B?YTZldU9xdzZ0RFFaUHRmTVpLYUwxRWRVWjlXUUw1QzBrdzViNjB5b1BRbTJ4?=
 =?utf-8?B?L3JrWlNXQUtKdTVEMUd3dnpJa2hxZzlwS210UVluWERiOXJRTXZqTmQxaStB?=
 =?utf-8?B?RHZwTDdZWVVMM0ovSlhHVkdvbW9ZVXkrY3lVQWk0OGxrZmVsNWFiNXZVM2ZY?=
 =?utf-8?B?bDVVZG9tK1Y4WFVBT2xWNWNLbFFYRk5Sdm1lQURHVVJoVzlNTFZJOUt4cjdP?=
 =?utf-8?B?Y0U1ZnNib0duUytFcVZ1K0F0NXNibXJOdm1OQnRDTGFXUkdtTjMySS94dUpZ?=
 =?utf-8?B?RDE3TmduMFNlanUwYTlFZlEwVHZ5anJyNElhRTRKN2lzbUdydWJZU1lza0R3?=
 =?utf-8?B?Z0FlaTZZVmdOdnNrbzFLQ0JSUklUMWUrZ0RmSkh1S0VoWnUxb3Yxdi9PM2pk?=
 =?utf-8?B?dlZ6VXlvRlJoVU1CZW9GZGwxYitzZUphZ3ZvR3d3NE56T0o2a1YxdWhPWWpm?=
 =?utf-8?B?ckRqMi9GT1dRYUlCVS9MMWN6REpzL3hDOGdoQ3d5bmlDVWdYNWdxUUVIanpO?=
 =?utf-8?B?OGhjeTRnNE1kamk4YUl1NXgwLy91c2RDeUZHV0NjRmFZZXh5WjFDK2NqbXhJ?=
 =?utf-8?B?b0lZSi9jUWlRTXFoWjlUb1B3ZDV3aTRCTW5UZTFrTkowTC9TQlRPR043WWg4?=
 =?utf-8?B?RUtDYnJrMHo2bkFvRlNra0l4R2V3R0hvcWg1bmI4MHg3MDNyNS9DL0l0QUNt?=
 =?utf-8?B?ajhtWnZidlhiUFVTTmQzdmFiMjJPSytZenZDcy9iYWVBZ0s0WmVqTEZlUk9N?=
 =?utf-8?B?UWI5aXM0anQzSnE1MWF1dWhtTWIxM1dmWGpib1VZNllpaDdZdk5TdytHdmZu?=
 =?utf-8?B?SVBLK2RFcnV4MEVPWnNJVEEvWEhVdHNvaE1nNlB1UE5EbVlCa3RaWVJYWnJR?=
 =?utf-8?B?ZmkxdUg1QUFKcmR1TUxiZDQ3TldjTmJRK2VGTzRCMnB3NVAwck5CWnRZVVpR?=
 =?utf-8?Q?5j72LRUfCHF5bLL8=3D?=
X-Exchange-RoutingPolicyChecked: aZINWZYyQW9bfTkUcw6D+v9oV78NGkregSuf6dHFMj+zGI6/0FjTimWbgN7mkZ9dF3+fyyR/NQWsXwPh9Sr1mCUlhRKt3BEqgQoR7jqGP2a30JYGt1zEBgLxF+9UFE9dFzwpJbSp4JHMcmRWAtAM0sm3LKJIHhO9jwzZiBPd2St5RrAZIEurBiKeCKZJYRFKly3vwI0DktlCOzxUt37QtgZ8fWd/2dZsNrRvvt1ncMehVZxiff8tQr+HLJsIEHdRNMFcoSDfO04ziKrMkK7HOUrce4RIQkcc9Zy2b/lJu7K+sI2qocygcz7qsAIHKXVDgdLYNryXmdKR0cBevPv97g==
X-MS-Exchange-CrossTenant-Network-Message-Id: b111ea38-2edf-41c0-8e50-08dec5f511ec
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 07:02:29.3682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GegK2rTCx8wM58VdbQp/qY1kR7E45WwhrHolV2n6C3Mi/zGwbauwtAqPHsAgPKJgHGm7qffGtzjykvs79o3MLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6051
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_000438_551110_F3D8DB36 
X-CRM114-Status: GOOD (  21.75  )
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

On 08/06/2026 20:45, Frank Li wrote:
> On Mon, Jun 08, 2026 at 10:57:56AM +0300, Adrian Hunter wrote:
>> i3c_master_add_i3c_dev_locked() is called after a device has already
>> been assigned a dynamic address.  If the function fails, the address
>> remains marked as free and may be reallocated to another device,
>> leading to address conflicts on the bus.
> 
> There are other error patch, which also free dynamic address. And if add
> dev failure, should it send CCC command to clean device dymatic address?

Between bus init and bus cleanup, there is only i3c_master_add_i3c_dev_locked()
as far as I can see.

Also, Direct RSTDAA is deprecated starting v1.1 and v1.1+ target devices are
meant to NACK it.  So that is not an option going forward.

> 
> Frank
>>
>> Ensure the address is not marked as free on failure, by updating the
>> address slot state to prevent the address from being re-used.
>>
>> Emit an error message to inform of the failure.
>>
>> Opportunistically remove the !master check because it is impossible.
>>
>> Fixes: 3a379bbcea0af ("i3c: Add core I3C infrastructure")
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>
>>
>> Changes in V2:
>>
>> 	Fix 'if (IS_ERR(newdev)' error path.
>> 	Be defensive and do not change the addr_slot_status if it is not
>> 	free, and update commit message accordingly.
>> 	Amend commit message to note removal of unnecesary 'if (!master)'
>> 	check.
>> 	Add Fixes tag.
>>
>>
>>  drivers/i3c/master.c | 19 ++++++++++++++-----
>>  1 file changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>> index f87bf0099d3c..7b60b0c7f646 100644
>> --- a/drivers/i3c/master.c
>> +++ b/drivers/i3c/master.c
>> @@ -2345,12 +2345,11 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>>  	bool enable_ibi = false;
>>  	int ret;
>>
>> -	if (!master)
>> -		return -EINVAL;
>> -
>>  	newdev = i3c_master_alloc_i3c_dev(master, &info);
>> -	if (IS_ERR(newdev))
>> -		return PTR_ERR(newdev);
>> +	if (IS_ERR(newdev)) {
>> +		ret = PTR_ERR(newdev);
>> +		goto err_prevent_addr_reuse;
>> +	}
>>
>>  	ret = i3c_master_attach_i3c_dev(master, newdev);
>>  	if (ret)
>> @@ -2472,6 +2471,16 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
>>  err_free_dev:
>>  	i3c_master_free_i3c_dev(newdev);
>>
>> +err_prevent_addr_reuse:
>> +	/*
>> +	 * Although the device has not been added, the address has been
>> +	 * assigned. Prevent the address from being used again.
>> +	 */
>> +	if (i3c_bus_get_addr_slot_status(&master->bus, addr) == I3C_ADDR_SLOT_FREE)
>> +		i3c_bus_set_addr_slot_status(&master->bus, addr, I3C_ADDR_SLOT_I3C_DEV);
>> +
>> +	dev_err(&master->dev, "Failed to add I3C device at address %u, error %d\n", addr, ret);
>> +
>>  	return ret;
>>  }
>>  EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
>> --
>> 2.51.0
>>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
