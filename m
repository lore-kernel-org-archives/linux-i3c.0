Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964F9D58E7A
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Mar 2026 08:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=W3h9sSEtzo0bV0fGgYec7GfB0sRwjfwarE+NBVyPmCo=; b=Jp0m/QPIxW30rnyjw0595DpI0S
	n+nroow5NH/4Op8HsqoYD3+nOBPQtsN2JFLPEgf6ZXqdtv6t1mN8BJH2U7CZAs/DGqzvL2fOSBwux
	Wzi0116j4PnuDgJ+6ARCE22S95RGeA/ClWg0YpLhe1JQaN3tGYQYQSvG4J9Jx1bh2kZEdvgSayJcx
	8B1nEgjVVDWBPoWZuntP2nkqQ+iZPsWJdDUsHupwER3/xLsEHW2NeYgL+doVDENNQfrMK/Inr403o
	EJTpGJExjuZ79koCGhBDSwh+Ukn0x6a+HUZlSCERhNcYempkbHgoHDauGnwKo+f4GDbASZJHuiLGy
	UCp+FNjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyuE-0000000CXfM-1Kof;
	Mon, 02 Mar 2026 08:45:34 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwyuC-0000000CXet-1EeQ
	for linux-i3c@lists.infradead.org;
	Mon, 02 Mar 2026 08:45:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772441132; x=1803977132;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XnpTQmX0ChCJ4Rq07Ugva8g+uELn06gv6nfJwfUj4Cc=;
  b=AQy8IeOC+nRg4zGctVWEOyLQZPqu7KALixjUWvW2B354hTUpPcWDnY7T
   1cz+cZ6Ni9NCnDtzwaQHXk9IzYB3hm8XZ6BmEXAr/VXtJBOgm82J9urIc
   GoB9LbF0XM6RKnwatDSTJ5JX6dvi7ToAWsP/46xw85hsvVIBgGXwzU1E5
   RgPhULw5U69jwzKj0aOCG/4E9BHLVD5Wo0anpiNpy9RpYsQRMdmErlfl7
   ivKhnd4jOyiV39kiff4Jild99H9UMQcbDjCP/v43CDrQp4hsVaPBJXEuT
   HtF6otigpSHdBm7/9vX9F5yvEVa7HnmVJzY4WwzgUXwD6K2hvBLxxcyPw
   Q==;
X-CSE-ConnectionGUID: Icdqt8VGSja+6/gfYQwQsg==
X-CSE-MsgGUID: KbSqVg9gSMGhtKvJo2IZ+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="73406847"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="73406847"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 00:45:32 -0800
X-CSE-ConnectionGUID: MVeIhUiCSESiK9P9KbIyDQ==
X-CSE-MsgGUID: 2Wmjbi1uQnmok2DNKTES8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="214829441"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 00:45:31 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 00:45:31 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 00:45:31 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 00:45:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCisS8RkR90iNe1AvZyNDruvOSvEHhbB9VtrEJwBYwkGc0NWxpOPHGFriPbTjri+6hFSOUxAnxFc67mdhL3eWjc2/Y0EsDpIjuebvQIL/A9UD01MAaXf27suKTzOx7rybUcaDErZJXtGnxOof4RPErEhmnm2fhAYnzsmL0dVRRlf1qUCZ/A/Hmme2aInaWSNxTBdWF+oSJ1j9hVz5ErE8K77zp9cKpqp4pQ06/191Eu5FyfLDLzcRa8AKcKIU2fK1dFpEPE7yq3xQRYOxOEDs8ooytr7Ag86dVkuccYaiWv4n3T31FpAMjR4vI0EGqE3sPfxeD0vN1/NqqGj2JOvAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpAjzULLAN5xVDZHzsdhWVoF/VwauiDwKl21TPy5S2w=;
 b=M5qwSxLYtDAgYRx/IYgdg3Wl6NqXdRsIheDlYtmgpcv9EUR68g2UPN2ZPUh6fGqIkSRMQSgf7iYBI8FF/7z/C3vfN2RMEzB6E1I+S8x1BWRMxw2xnU6JULBorAB3wrhWZJVRtAg8//sCtHkR+evfk1GGQqe8juai7Mv+/5urK/Es+gURhRrhrF8edIcv108Jg+zCUDoGVE4Z6GhHHADfIe4tqHo9dMZhKmWDYsXQ0nB6Q4mQp2aSCV9SgEQWakdqWOD7XCzmmy12zUYJJcZK4kjbhZ8dAJzfIqFOTtjKP+A0l8t7FaGjdOpcsQoby1rlh713zXp+HmpU9ufWGeeNGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by DS4PPFC60125F65.namprd11.prod.outlook.com (2603:10b6:f:fc02::4b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.19; Mon, 2 Mar
 2026 08:45:29 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 08:45:29 +0000
Message-ID: <27e5c912-1541-4acc-ab29-1e16a15113e7@intel.com>
Date: Mon, 2 Mar 2026 10:45:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] i3c: mipi-i3c-hci: Fix race in DMA error handling
 in interrupt context
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-11-adrian.hunter@intel.com>
 <aaHI9A2LTJKHo5Rz@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aaHI9A2LTJKHo5Rz@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZPR01CA0063.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::13) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|DS4PPFC60125F65:EE_
X-MS-Office365-Filtering-Correlation-Id: b76a520b-cbe9-461c-df59-08de78380eb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: aPWOsceT/Xrf0jFe6MRSokFO3+Y8EJ4Xg7wyI5zHw15emaGLYlsuDvGvYxHg8iys5rLLI8u1ribqUFNebEvyo2/qduZUWc2Kfj4ya151L5d+QJY9fuvJYffTojzW4GOsFfnRrEZgRuZIg6oNVUkeW/z1hRReigk34sI0gAGiSYRrv1E/jrEQONsH3i47ppLCQIBm4OPkWZMCSGU7cpnC2mRZKOTPspB+f7kzj3O6ckupU/b3p8HEndCjF+7m3ZY4IZ3BK12dciMfoKCLl4gRWglsW0PrQFgF2w5OiokFxJM+p7gJf17hPn6Rc+bITsWMOxJcJGBSSmcFLv+NnHlTgvR9FlU8sn8J0CL9Ush7dFsTwVyepoWwaMwYhMHruhsV9hE7CEdHziSV11PvugFy6suCW2pprlsBKnyDjj2CIlov3hQXEy36m4yTyZgehvIagg0he3KXMAc9vW5Ry9gFq4iIYKvZV3F7Q6IFga30PHEInwjrkdvNBuPin6flmJPz4gSs5T0sOOGzs8gnv8MkIQ8eqnlfpMj1RQ+/TzxUkj5oZ0czVJKVjRoyynuz+5Ob/Akkj62LHwsaYGxVW14JTqDopW2vPDsL+EaLzjrUnaYGH1OAPfQM+h0+Ib0hsRn6+FhmqNOcFV4/VouDHnRKZxX0CVFvUH5ayDOlA/G0yF5NIcVTa3i7TH34yumEXbydiBLrzbJQlLYt0bmQvt3g5fYJAcyLY6F1kIidLjepWGs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlNLaXZzTmpRZFhvWDNDak1XK0o1WnI5SnpxdXBkdU9VbGxhTlA2RWkyRCsz?=
 =?utf-8?B?TWgwQlhkeEJPV2Y5R2hKbzlkWTBYc0p2U1IveG00ZmNUYlpYNnY4Ty9TY2Ft?=
 =?utf-8?B?T2lQWXFsbnp3R0JyZmJMRUJxVDBkejRmR0dFVC8weG00dE9WYVBzTUZrZEpX?=
 =?utf-8?B?WGZsS3lCSlZPU0UzTCtaaFNIN09BU0p3cW5KR3NiTGRjNFlyMGIydStJYmhu?=
 =?utf-8?B?b3Bvak1SdXlEelVyWEE2bWd3RlIwRGNva0JhcmtlMHZicndDZlFabWRkT09E?=
 =?utf-8?B?d2gzQlp0aU4wN2YrYWVlNFNMTFJEb0RIRkxrZXJRVjdqR3ZpdC96NnFVckgx?=
 =?utf-8?B?b1pVMTJQeC9Bb3J6Y1BwRHVXREpTTkhldnp6NmQ4ejlQTzRneUJiZDNkZUVj?=
 =?utf-8?B?elZ4enBqZjEzNHBLcGRKNlh1K3hZY2lmS0NOVlBQVWFlaXFiTnBSOWZtc1V3?=
 =?utf-8?B?cGgvd05ibVdMN1BIOWtzWWk0eTN0WHRCeGFZaFlUSXA0RDYvdjRESHZlVDIz?=
 =?utf-8?B?cVNQdlpzUnVCc2dweHFyamxEdzBYSEpIQjdveDhtQURxREozeVp0ZXRHM3JX?=
 =?utf-8?B?YVYzY1FKYlE3cjJsMWFNdGgwVDRoSVk1Ym52bmNoenZ5Q3pNTlJoRytHaStL?=
 =?utf-8?B?Tm5OMjVHOGxjejMzWERQSzhwL0d1Q1FSYXgvMkNnRXFCa3V4ZXc4OEtKN0VY?=
 =?utf-8?B?K3hqMUcrVG1NUHVrazJ0emQxaWJxYXFSYk00SGk3d3dBdTVtcHRZQmNJYVBQ?=
 =?utf-8?B?N01XQzFCZWNhSTVwQi9sQlpmMFZET3pXSVNKV09OazJzUGVzYVlEaDduTHVu?=
 =?utf-8?B?L3VRVi9XZThGUkFKTVhvem5wWGs0Wlp1RlVQaDhJZWlpZVdmVHh2VjZsNXND?=
 =?utf-8?B?M0NBU0UrcGpkR1hqb3FLY3c0TlhrVzdNcVRUczBsN3FKcC85VlF0UlFuVldD?=
 =?utf-8?B?Q1dTallVbWxtQ3lFTCtzTktLb1NwRUovRzc5Mm9JUjIzN1F3SFkrQlpBWWYv?=
 =?utf-8?B?QnRiZW5LMkVxN2ZOYXN6RmhraXpDM1ZuVmVIaElXamhEMkNKWm5zN3MwMHRF?=
 =?utf-8?B?enVRcnY0RjlVM0ZLWmkrOHhaUkk3UFRBVlhrNnNmcytyaUtOZllNSXB3bEEv?=
 =?utf-8?B?bVd4T2lZTDZ2NTlWTG1ZRHdjaHJ4NW1jaWU0ZnpHZENMdmJYWjRRVUxzWGdB?=
 =?utf-8?B?SWdmZi9heHQvdGVEYlpBTlhseTFOMTMyZGpRRmZxS05CNk41Uk5RYzdiNlpu?=
 =?utf-8?B?UExwQ0pMRmhndVU0b1BSTnpjTE5MUnR1enRMQTN6QUk5UUZKd1lVbndZdkFa?=
 =?utf-8?B?VTRSR3B4NGxlR3BBRGRNY2YrSGJCOEovSk5UNnNwNnRheXV0V295QjlXUlFK?=
 =?utf-8?B?azVrbmp4R3d5d3Rac1o2L2xVaHluZjdqT3p4aDAyaFhOY2sxaG42ZTJtRlZn?=
 =?utf-8?B?VDNuQjFna0JONlhWemhTdVd6ZzUvU0RLT0RKbXk3My9iR21MRWpPeXJvK1Vw?=
 =?utf-8?B?UStaczVCbDRWVEs1VDFUcFhZNU5jTkJYcktKYkZuSGduM0FWdDRHK0FwVFdR?=
 =?utf-8?B?QXhnU2x1UDlPdmhRdWc4ZTlYSFFzWUlKQk5DaTBlNENnc04xREhYMmdrQU1L?=
 =?utf-8?B?OEJINTdZY2hQTS92RFBRQnQvcWJFZXpqbEM4R1QwazBDZVB1cE9aVURCNWJ1?=
 =?utf-8?B?NU1Xb2JGQVp0clpFdXhNZTVXRkJvS3ZsN3k5QnViMVdnaEZycDh1Rnlibkg1?=
 =?utf-8?B?OENrNjVRRGhKbXQ5YnJyOGZEdG9BZ3JBdWpjMERNd0M3cEkzbmhFTWZLeHMv?=
 =?utf-8?B?UWxhLzU5TUU1Zlg3c0thRlo3d01BVmlCSk1zMDFoTHNQYmk2cHhBM2xENHc5?=
 =?utf-8?B?eWV3NU1yOUJxNTJ0cXMwcHBkUFlyRE1yQnYwNFQySnI5NTV2dlYzQ0RVdEwr?=
 =?utf-8?B?S1BpcXdTZThodkNsc3V0SUFxNGJRcGNYYzZyd1RxenJIbVRMNkpQai9LYUg3?=
 =?utf-8?B?N0grek50bFAwc0FpcVlRVGJ2WjBzVlU0aHhjTkRDQjIvclZKQ2I4b1UxWFZM?=
 =?utf-8?B?Q1hQd3ZQOEdXOCszSXAza3BLR3FJRXErVFlHTUJ5TlZYR3RMbDFlYXBOVGV2?=
 =?utf-8?B?dFF2TUNWSGF1RUhZWkFFOGZwYXdFdUdTNWtrVWtDbDJhczJlS3I2VmJPMm1u?=
 =?utf-8?B?NGZOYVpqb05QbVhJNGt1R0tnclBYNHVMM0VVcmF2RDhwZ0ZBTjc0MFBpZkV1?=
 =?utf-8?B?cGJROGFZOVE1ZkRYbld5c3dLZUNLSHEvWTRDL2VKUXNyV2RBcno1ZkpCcElo?=
 =?utf-8?B?dlgxamdHZDUyT3huTjcycFEvK0ZlRnRzTEZnVjZqc2tTaitCSXFOV1QySGJM?=
 =?utf-8?Q?0JmCbUuAly2SuzLg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b76a520b-cbe9-461c-df59-08de78380eb9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 08:45:29.5865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvnsoNmgi4775Dr0kph5F7rPSa7HOH7H8aRM3U1BOmGacmLrZ7T32AIwBmGwb1B7kUXLZZH39E8PAKCZYtD2Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFC60125F65
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_004532_410461_5569EA74 
X-CRM114-Status: GOOD (  23.25  )
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

On 27/02/2026 18:40, Frank Li wrote:
> On Fri, Feb 27, 2026 at 04:11:47PM +0200, Adrian Hunter wrote:
>> The DMA ring halts whenever a transfer encounters an error. The interrupt
>> handler previously attempted to detect this situation and restart the ring
>> if a transfer completed at the same time. However, this restart logic runs
>> entirely in interrupt context and is inherently racy: it interacts with
>> other paths manipulating the ring state, and fully serializing it within
>> the interrupt handler is not practical.
>>
>> Move this error-recovery logic out of the interrupt handler and into the
>> transfer-processing path (i3c_hci_process_xfer()), where serialization and
>> state management are already controlled. Introduce a new optional I/O-ops
>> callback, handle_error(), invoked when a completed transfer reports an
>> error. For DMA operation, the implementation simply calls the existing
>> dequeue function, which safely aborts and restarts the ring when needed.
>>
>> This removes the fragile ring-restart logic from the interrupt handler and
>> centralizes error handling where proper sequencing can be ensured.
>>
>> Fixes: ccdb2e0e3b00d ("i3c: mipi-i3c-hci: Add Intel specific quirk to ring resuming")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>  drivers/i3c/master/mipi-i3c-hci/core.c | 19 ++++++++++++----
>>  drivers/i3c/master/mipi-i3c-hci/dma.c  | 31 +++++++-------------------
>>  drivers/i3c/master/mipi-i3c-hci/hci.h  |  1 +
>>  3 files changed, 24 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
>> index 9cfe12fb9a0e..741f543aae68 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
>> @@ -223,10 +223,21 @@ int i3c_hci_process_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n)
>>  	if (ret)
>>  		return ret;
>>
>> -	if (!wait_for_completion_timeout(done, timeout) &&
>> -	    hci->io->dequeue_xfer(hci, xfer, n)) {
>> -		dev_err(&hci->master.dev, "%s: timeout error\n", __func__);
>> -		return -ETIMEDOUT;
>> +	if (!wait_for_completion_timeout(done, timeout)) {
>> +		if (hci->io->dequeue_xfer(hci, xfer, n)) {
> 
> It is also an error, why not call handle_error() here.

It is different between PIO and DMA.  DMA has an extra need to
restart the DMA ring after an error.  PIO does not need that,
so for PIO ->handle_error() should do nothing, which is not the
same as ->dequeue_xfer().

> 
> Frank
>> +			dev_err(&hci->master.dev, "%s: timeout error\n", __func__);
>> +			return -ETIMEDOUT;
>> +		}
>> +		return 0;
>> +	}
>> +
>> +	if (hci->io->handle_error) {
>> +		bool error = false;
>> +
>> +		for (int i = 0; i < n && !error; i++)
>> +			error = RESP_STATUS(xfer[i].response);
>> +		if (error)
>> +			return hci->io->handle_error(hci, xfer, n);
>>  	}
>>
>>  	return 0;
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
>> index 323c5ead82a5..4951fd0a63ac 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
>> @@ -613,6 +613,11 @@ static bool hci_dma_dequeue_xfer(struct i3c_hci *hci,
>>  	return did_unqueue;
>>  }
>>
>> +static int hci_dma_handle_error(struct i3c_hci *hci, struct hci_xfer *xfer_list, int n)
>> +{
>> +	return hci_dma_dequeue_xfer(hci, xfer_list, n) ? -EIO : 0;
>> +}
>> +
>>  static void hci_dma_xfer_done(struct i3c_hci *hci, struct hci_rh_data *rh)
>>  {
>>  	u32 op1_val, op2_val, resp, *ring_resp;
>> @@ -880,29 +885,8 @@ static bool hci_dma_irq_handler(struct i3c_hci *hci)
>>  			hci_dma_xfer_done(hci, rh);
>>  		if (status & INTR_RING_OP)
>>  			complete(&rh->op_done);
>> -
>> -		if (status & INTR_TRANSFER_ABORT) {
>> -			u32 ring_status;
>> -
>> -			dev_notice_ratelimited(&hci->master.dev,
>> -				"Ring %d: Transfer Aborted\n", i);
>> -			mipi_i3c_hci_resume(hci);
>> -			ring_status = rh_reg_read(RING_STATUS);
>> -			if (!(ring_status & RING_STATUS_RUNNING) &&
>> -			    status & INTR_TRANSFER_COMPLETION &&
>> -			    status & INTR_TRANSFER_ERR) {
>> -				/*
>> -				 * Ring stop followed by run is an Intel
>> -				 * specific required quirk after resuming the
>> -				 * halted controller. Do it only when the ring
>> -				 * is not in running state after a transfer
>> -				 * error.
>> -				 */
>> -				rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE);
>> -				rh_reg_write(RING_CONTROL, RING_CTRL_ENABLE |
>> -							   RING_CTRL_RUN_STOP);
>> -			}
>> -		}
>> +		if (status & INTR_TRANSFER_ABORT)
>> +			dev_dbg(&hci->master.dev, "Ring %d: Transfer Aborted\n", i);
>>  		if (status & INTR_IBI_RING_FULL)
>>  			dev_err_ratelimited(&hci->master.dev,
>>  				"Ring %d: IBI Ring Full Condition\n", i);
>> @@ -918,6 +902,7 @@ const struct hci_io_ops mipi_i3c_hci_dma = {
>>  	.cleanup		= hci_dma_cleanup,
>>  	.queue_xfer		= hci_dma_queue_xfer,
>>  	.dequeue_xfer		= hci_dma_dequeue_xfer,
>> +	.handle_error		= hci_dma_handle_error,
>>  	.irq_handler		= hci_dma_irq_handler,
>>  	.request_ibi		= hci_dma_request_ibi,
>>  	.free_ibi		= hci_dma_free_ibi,
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/hci.h b/drivers/i3c/master/mipi-i3c-hci/hci.h
>> index 6680b8640c5a..0f5e5bad9fb1 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/hci.h
>> +++ b/drivers/i3c/master/mipi-i3c-hci/hci.h
>> @@ -121,6 +121,7 @@ struct hci_io_ops {
>>  	bool (*irq_handler)(struct i3c_hci *hci);
>>  	int (*queue_xfer)(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
>>  	bool (*dequeue_xfer)(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
>> +	int (*handle_error)(struct i3c_hci *hci, struct hci_xfer *xfer, int n);
>>  	int (*request_ibi)(struct i3c_hci *hci, struct i3c_dev_desc *dev,
>>  			   const struct i3c_ibi_setup *req);
>>  	void (*free_ibi)(struct i3c_hci *hci, struct i3c_dev_desc *dev);
>> --
>> 2.51.0
>>
>>
>> --
>> linux-i3c mailing list
>> linux-i3c@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-i3c


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
