Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACE8D73E88
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Jan 2026 20:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=amhsbqWkS4pCl3fkXPLaxB+2C+mrrG5r6tfLvGoxJZw=; b=vm0qTwDdp4IcTE3i6FbT+ZENcn
	6SLE3r/6Sl5ygprvjw0t2L9ZJos8TT0qhdxY768ZzE4fUQ9GKtxiGmx11YAKBoT8J09KVHUrfZjzb
	dI0nz3o5a7cj5HfPqIGg1RQCiA+MWXo4ciXH+1SpjUm9liIPe5tdvVqLeeJe0B6sk/EuP/qPV5Qqo
	fNqR2fjhYsnUUnJbMucwlCGN3/6YeWhoa1XX4MAxdXmQDHoBrLLU+doO2T9B1oLswvAa6S7OBbGLX
	4PAAbifBgHk3FYze89X/5/KHs1eIsWp7FdWyKP0fAUoUw8/3dSEOQFVURBh3eJ9tCyvjWABIs3jkW
	WaIvvfjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlYqx-00000000dBa-2670;
	Thu, 29 Jan 2026 20:42:59 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlYqv-00000000dBB-13I7
	for linux-i3c@lists.infradead.org;
	Thu, 29 Jan 2026 20:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769719377; x=1801255377;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nHKKDmLCUfTA+nNFvxw0CzhQUlL91vF/eqfWAbt5SeM=;
  b=NTPP5FyDXzyKPBkXZA/PJCSNAkj8bL+mgFEM9YCEiwBVtIWcNZe8sl4Y
   ldsPcT2xiTcrllj9VZziecVMwcUVaSNj7lC8swl9lJCwZYUb4Gd8AqjGq
   mRewHme+IBkQpe+jt5/MV6VWD4aTKQLKM+RmC5Ddj/DVF/bRLUldNSyIn
   6c9+CRJ5EFwnmFAkVdN4SvNNdjUW/KYXV/4Vj+ScD41maZ58wLS7Smqq+
   58O6YJtRM+ZdaCJ7AjxloQ6mUU/oth0fA2R7ZcRqZM+eXBbu9wUk4VAou
   gMt0rMW6UHvRF7YoE90k14RUNo0yzGvDQ+eRTHPAHNCRHnylLXL2RdHh4
   Q==;
X-CSE-ConnectionGUID: fXT2NSyNTa2kjUIcSsq4YA==
X-CSE-MsgGUID: jObmMOV1TEyxg5ir9IWq1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="81705924"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="81705924"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 12:42:56 -0800
X-CSE-ConnectionGUID: Qvg+9ccHRueIE+y75yDm2w==
X-CSE-MsgGUID: DoQQajIVQUKj9ZNEbpFOdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="239401158"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 12:42:55 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 12:42:54 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 12:42:54 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 12:42:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFSDKqHSO9In30tqVpFhqkRl2DQfvNk25puxeiZELuXh/ZYD6gLcFEt+NhW3xKkK2XDG4v1W2LKCnp+Nr6ShEywMe8DFtfN/kKhPZgJnV32SQnINaRWNoHUxwt9slB82rwdsFX+FfwwemZyptFvC2NBaTNSZyJFps7sQgFjav1GlupXpNpq9d1yIfEnNnNJbm14PFh2PYSP91gn8293r60AwrPFmcwVaxy6k3vNyFLS6Xgnd7GCfE5qZ9gBHuUZ13G2QGyg/n1AfsOK084aP1BEN2Cddt849aeuGDB4UIQ8MSP/oLBpKtTJLOAWyqrgI2Ys0bg7Jz8RR+oXx7kqbSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgZo7u4kqiu47QC1Pbk2m2xHLgE240U2XprgYRA2YiE=;
 b=eIQoahFepGpYb0VwQkYoQujIjJHEha+nm9c1g8pUy22PPbmrIjBIuT8ntQ2cI6gN2Bo54QLXK55rrCRsQcq/74xZdzqTimC0UpoS5xMD0f16IXYv0kHkcetwhZT7rK5Q/MJj5TbzUsfZSxSb2mEcHae2EZYE+w3S/ikKUhP6hrkC9P2h/iwhCV08QW19JjvmH3J4KvULb604aPhXVRYn7mHcvcNaGx0oZ+3m1l6kHc1Nk+ZCqmRk/ym+Q7MCw2DuJt+TDRfGFGh6UUMSe4fkdMs6ECAOycx8W+iZ4F8ZsBvbLdcTzi+ID/OzONkrxVVsPnC7l1YbHnlz6GDSBfWFTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7215.namprd11.prod.outlook.com (2603:10b6:8:13a::13)
 by DM3PPF1721FD39C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f0a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 20:42:53 +0000
Received: from DS0PR11MB7215.namprd11.prod.outlook.com
 ([fe80::9201:63e9:3175:5392]) by DS0PR11MB7215.namprd11.prod.outlook.com
 ([fe80::9201:63e9:3175:5392%6]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 20:42:53 +0000
Message-ID: <1db7b04b-ee65-4791-8db5-0dffc7befca2@intel.com>
Date: Thu, 29 Jan 2026 22:42:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] i3c: master: Mark last_busy on IBI when runtime PM is
 allowed
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>
References: <20260129181841.130864-1-adrian.hunter@intel.com>
 <20260129181841.130864-4-adrian.hunter@intel.com>
 <aXu7UduYCweVLxdK@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aXu7UduYCweVLxdK@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DUZPR01CA0058.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::12) To DS0PR11MB7215.namprd11.prod.outlook.com
 (2603:10b6:8:13a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7215:EE_|DM3PPF1721FD39C:EE_
X-MS-Office365-Filtering-Correlation-Id: cff641c6-69e2-4023-1d20-08de5f76f95a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ci9mTEtpZGxqSWRtSXAvVkRteDN0YWg1dGo4NlFXWDVONmJaWW5WR1FZaUxm?=
 =?utf-8?B?TDhoOWpiekhhN3BFRytyNU8rZURsd3BPQzBPVnZsZXJmWFlTUHpRdFdMTWJk?=
 =?utf-8?B?SWpJeUVaRVNOY3E5MzJiNnQrbnMwNU1qTE8vQnk4V1FUTzlVdWJRYUJINGRq?=
 =?utf-8?B?QndHV1ZSZ1Y4UGsxdTRhWGZSa1JiVFk2L0hGOHBGVkRzUU9HSGdxVnZUSmZT?=
 =?utf-8?B?TWN4NTF1aHpzZzdsVUpnMFVCN0wvVDZnSEdGU3hnTDEvUmFieWVRK3lmcXI5?=
 =?utf-8?B?cXZqZy9odlNqSE1CQVBTUlFTWW0vNlpBWktEU1lwQnF2ZHluNzhEc0dNYnB5?=
 =?utf-8?B?Ri9iVlh6bWM5NThMVDhkMU9XN3FZWFZBUXVXVVIrTlBhcUpQeVkyT1EyQUJB?=
 =?utf-8?B?dm1oc3JFa0JVR3FZU1hqbnplV2x4MS9HVk13ZkVpY0Fmdm5XamtVL0xJRXBz?=
 =?utf-8?B?T01IT0FzVWxxM1cvY2FlRWQzcURUOFVaeXdVSk9oblJ5UkcvbmxaYTdQemcz?=
 =?utf-8?B?aHhZaVdpWFIwM056OHBtVU9vd1pNdHBlRHp2VGVETW1vNkFhTkVZc1hmQ2JW?=
 =?utf-8?B?cVkyMEZicmpnSHJ4NzZhNE43dkVvdSsvUTJ0bE0zNDVvRkdJQ2I0Ky9YZXlG?=
 =?utf-8?B?WVhyWTFRNmJkM0YxM2pHN21NUDBKYmdOL3VDRGQ4dXA1bG1DT29raWV1bXQ2?=
 =?utf-8?B?bFZ0dXhuTVByREJRWlliNTJqQ2tYR1lhM0kzblI4c09rK0Z4Zkx0MXA1Umlu?=
 =?utf-8?B?ejFTd3JhUHF2bC9WNVRWczFoTWw0NGFkL1p3YTVKWG1mSzlYYy9KZkxmMjk4?=
 =?utf-8?B?dlJPbnFyMDFxQVpURXdPeWRDakVMZ2NrNkNocjZra1BpejFrZmVZRC8xWDNW?=
 =?utf-8?B?Q2NFNDk3blh5TWp6SlpqK00xQlpRSnNiMmlENlF5OEVRYkFiNTN4RW14TnAr?=
 =?utf-8?B?bSs3VFd1V1JtZ1U5TEJnbm5WVEVQS3hMWW5jb3BjdkhMU0lDVTZNcmg4V3Iz?=
 =?utf-8?B?aTh2OFQ4MDM3OTYvY204TytNVmdOS2ljUFlzMjB2TC9hcGZtVzZwM1NtSFJv?=
 =?utf-8?B?bUtUeHcvZCt4ZUdPdkV5cHBuSkJ4dWhYZzFlZzdxUjY2NnZtZ1RmcmEyNU5s?=
 =?utf-8?B?d25PYVp0V2FtUC9wNmpCeHlMbEhqYUd2K3RPdG1CaS8xcGo5VUhWWHZxL2Jy?=
 =?utf-8?B?clZQOXBRSVFMLzBtL3MxQ3RORWdoVlNPcTJTQmR1TU1Jd3RlRmtOaStTSUVK?=
 =?utf-8?B?R1BLVGtManRiU2tySDMwZWhVU2l3UURzZTlqMnpnK2ZIR3p5U0svbmlMSERZ?=
 =?utf-8?B?NXZhbFUyYVJheU9oREZIbXNseFVNVkN6OHl1VXBBd1J3RW41ekFRUFRVZnEz?=
 =?utf-8?B?SXVSMllBTGZWYS9PQ1pDN2Vwd0YrNGdTNHU2a3V0c2tGRHgrTkNuYVErSG9n?=
 =?utf-8?B?WHU3RjMzSmdoZ0ErU0FFUEczZXRjK3pWZ3B4MldjYVlJN0p3OWdkdlJZTXVT?=
 =?utf-8?B?TjhLNjhYN2FuZHhJVm1aVnhDbitvcTRyaFAvVWdHWTdGOTZWS0ZuVHpSS2Zi?=
 =?utf-8?B?ZDh3ZHJtb0RtUXcvZTdBcXhQdjJVMDE4WEJwMDhPazdIb0VJRFpGQTRRLzh2?=
 =?utf-8?B?SGlBREg0MVRLSHRyYTZvbDZDcmFNRWFxR2NWeFMyKzZjQ1lUVXVSaUlxSmxU?=
 =?utf-8?B?eW9LRGlDeERGUTdZdW0xV2NIcWdqOGZXRGRYZmFtMjFhTnNHcEtsUTJnYzN6?=
 =?utf-8?B?bk91azBlSFhOYTliMEw1WFBWMVk5YVRmM0pRYVYxODlreGNpY0IraUsvZzNW?=
 =?utf-8?B?U2NWYkJUNmJJRHNqNE1WMzBGeit2SCtkekVzLzNQUkZVUTBjS3FDT2xXQnFH?=
 =?utf-8?B?dmFOeC8vOFk1YmZubEVsSExsV3RxSEpEV25USUs3cHluMElXQmFNc0JDREZ3?=
 =?utf-8?B?dGk4dmw1U0tRZktTV040b1V1emUva1VnNnZyM016VTYraytHeDFvWVR0WGR6?=
 =?utf-8?B?Mm9jWGhBZ01raG80TW9UMnJ4VE5Nd05NU2hDVndrYWVKRXZTRkdsOWlhWER0?=
 =?utf-8?B?YXMyUTRRK1BJWlloWko1QW54aDNjVm9IMUI4VWtKVEhDUXYvc09FclQzZU5V?=
 =?utf-8?Q?zxcA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7215.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUhpVE9ncUhDQTNQbXZQSWI1Tll0dlJUclpKMWN1b0VjOTh2cUlVeVlHS1FS?=
 =?utf-8?B?Y0NwRDY1ZkRRTlhPRm4xNStlRTk0YytzOHIrMlBaWEVXWDNiemZoWWRNTDEy?=
 =?utf-8?B?Um0yclRydlp5MzkwZTN3dEcvSXpxMFYzMjN4VWJScklLUVBTT01yZUt4azRo?=
 =?utf-8?B?ZUR1d0M0Wng0a2lPRGdYbmpNcllxbXpDWWoxUzdJbXQreE5HK2d2N1lqU1Vn?=
 =?utf-8?B?QUNXTzFWSFYrMEc0ZzVPMks5Z3VWUzl0VHdpdURFajhTSEhxbmQ5NVRlVDF0?=
 =?utf-8?B?b2ROcC9TMC9jOFliTmdZcDRwWGJUS0NvSE9tazN1NDRDazl6b3dhcHViUWlL?=
 =?utf-8?B?Q3V4b0hSdTFsVWhNYk1YR24zTVJiMHBiVHlGSkppTjJhcEk3UHBNOXllVmox?=
 =?utf-8?B?WlZodVZjTUVJRm85ZVgzZitJc0FHT0NodkdvMytpUTVtalZ3SSthU2tPV2tj?=
 =?utf-8?B?S3hhbHBVSFBVUVRyaEZQdmhqcEozSzZFeFpETTBpZnRsL01WVmdYaG51Y1No?=
 =?utf-8?B?cXhxSkt0c2Rkc1J6bWFGeW9kOW0rWmdaRE5obXFXTXpldHY1Q1hsaUxwVXVm?=
 =?utf-8?B?eHRVUlIwQUsxcXNwM2pQWHgyVzBDbURRYU5XL2MzY0hHOHBkVStwMUNYdTc1?=
 =?utf-8?B?b2lzekdMcC9lTk1DcUZmbXQrQkI3YU5HczRReTBXY2hOM1AzdTlJODgzMUpZ?=
 =?utf-8?B?Mit6WnZQbDY2ZnF2R1ZVYmJwL2hKRHBFM3lDdE9iblZLdk1nQkNQb2JzaDIw?=
 =?utf-8?B?c2szQm1wTHJDeXJ2emhDOXFoZ0ExODBWQ1ZUa0Z3UGRaeGxlWlVGcDZFWDhG?=
 =?utf-8?B?SUlXZGx1UFpVVEpQdHkyaHE5ZW02SHJuOXhSQkwzUUh4dEwwVDVKdWJJN1lJ?=
 =?utf-8?B?eGxVWmFsUlkrc085cmZhM3N1WnYvYjVoTWRUaERPUFlzRWN3WGdIVkZoTGVm?=
 =?utf-8?B?bGZ0cGdrRUJHQ2taMFl4ZTViaHB1dDhZczd5dHZoemYyem5FTS9ROS9hUGZ3?=
 =?utf-8?B?U0FRK0JMT2NNYndXcmJFQTJoMUpyY0YzbjYvT01lWjAzNkNRdDd6RFNPajRu?=
 =?utf-8?B?a05KMDNJTElWQVZQTnRUM004NFM0aDlKTkJXK0V4SndmYktlUHlycGgvMllY?=
 =?utf-8?B?dnJpVzJPbkxIUlovQXUwQ09VMXRvUGNlSjFwSHJUWDZUS2docHF3MDJjUEQr?=
 =?utf-8?B?SDB6eEtQcGxjaW44aEZIclVtWHc0ZmFrdlZJSmlWVmZQZU1MZksraS9jNWls?=
 =?utf-8?B?VFN5Y2pGSGZtckQxdmF6ajVmeVZXUVgxNUxEWncrM1oxcTJ3Rml4bXExOE93?=
 =?utf-8?B?dUNkVWF4a1ZpcjNtRTFybGtsWStTSUpDN1dXallWNzgyWTNtMXdtVkRHYlpk?=
 =?utf-8?B?Z21CKzBJTU55a3VnQWtEcEhzSDZYK1grTld1azZRbWZIMnVkbGlQVENSU3RE?=
 =?utf-8?B?WTZxdFNqeTFIR2M4enZoQXR5RFpNVVA0bnpDd0VXVzJIeTV6NEplR3pQZVZE?=
 =?utf-8?B?VzZyZGVXcnJMYWhIbVZmQnlJcXYxM3ZOOEszRkJ1MXoyRWpmSzV6dmJ4TVUr?=
 =?utf-8?B?Nm5DclZneXZqcElFL3J1TmxFODVMV05IY0RqY2ZQUUc4NFhBVWhCMk9sY0JS?=
 =?utf-8?B?YUdIRmNQZXdLWVZrZ3pBS2NJY3ozd2tRbTBYTklVelNQNk5Kd2FIREFTNy9p?=
 =?utf-8?B?a2M4dHBUSWhQcDVTYlV2Kzg4SC9Nb1FLbEdVVW9ST1ozdTV5NlNZRFhMS2Q2?=
 =?utf-8?B?MlppNDVHeldEZnFGcndFTGpCOUVlU21HcVNRYTlhcDNhRk81Z3dBSnMra0hW?=
 =?utf-8?B?N05XSlE0cW54ZUJUWUExRm1FTi9TTHI3cGpnblEvMmhWNld4QTE1K21kcVhv?=
 =?utf-8?B?ZnVKNzMxZVZLQVBLc0owakMrTlpzenVDeUkwWDdGUVpsOWRsVUliQ282NEM1?=
 =?utf-8?B?cjJCWkt4dkhsWnNhNjdLbUdvckNyRWlOWURnY0VpL2RoQ2FZaXJrRGJodGZW?=
 =?utf-8?B?Q29kYVVlb3ozaHRNTzI5bmdsMWx1dHJaVTlKZWVxZXFleENXRWRhOWp6UVMy?=
 =?utf-8?B?V0Y1Nm5ERkQxMGJaRjVBdnNPN0VBeVhDTkJJQWRqSTU5a0krQmw2amEvY2ZI?=
 =?utf-8?B?U1dwc25Fbyt1OWJwYkU4czFTRkRINE1waXZITmFGeGg1UlhqZldHYVNsL3Bz?=
 =?utf-8?B?VXl4NFlINFIvaHZyWE1yRWxUL25UdUFZcm00eVRBUDRmWmhtU2JRVjJoT09Q?=
 =?utf-8?B?dUZ2cU5TRmRGdHVhUE52L2JrQnMrbzRKSmZxcnJXaU1DSW14eTV0N25xU1hD?=
 =?utf-8?B?ZDJGRTJSSi9yblZ1VzlNSnpkQzZ4Rm9yR3hzamZQYXdYV1k0dzIrZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cff641c6-69e2-4023-1d20-08de5f76f95a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7215.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 20:42:53.0172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7n9CCyETlZLdPWDmo7pej6XCYtY2P/DlsdXMg6H1pIim5XZvXTluqhpTeTkvP41HUwyGXZCoUI1CN6zsCw0OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1721FD39C
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_124257_321576_81F49364 
X-CRM114-Status: GOOD (  17.63  )
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

T24gMjkvMDEvMjAyNiAyMTo1NiwgRnJhbmsgTGkgd3JvdGU6Cj4gT24gVGh1LCBKYW4gMjksIDIw
MjYgYXQgMDg6MTg6MzdQTSArMDIwMCwgQWRyaWFuIEh1bnRlciB3cm90ZToKPj4gV2hlbiBhbiBJ
QkkgY2FuIGJlIHJlY2VpdmVkIGFmdGVyIHRoZSBjb250cm9sbGVyIGlzCj4+IHBtX3J1bnRpbWVf
cHV0X2F1dG9zdXNwZW5kKCknZWQsIHRoZSBpbnRlcnJ1cHQgbWF5IG9jY3VyIGp1c3QgYmVmb3Jl
IHRoZQo+PiBkZXZpY2UgaXMgYXV0b+KAkXN1c3BlbmRlZC4gIEluIHN1Y2ggY2FzZXMsIHRoZSBy
dW50aW1lIFBNIGNvcmUgbWF5IG5vdCBzZWUKPj4gYW55IHJlY2VudCBhY3Rpdml0eSBhbmQgbWF5
IHN1c3BlbmQgdGhlIGRldmljZSBlYXJsaWVyIHRoYW4gaW50ZW5kZWQuCj4+Cj4+IE1hcmsgdGhl
IGNvbnRyb2xsZXIgYXMgbGFzdCBidXN5IHdoZW5ldmVyIGFuIElCSSBpcyBxdWV1ZWQgKHdoZW4K
Pj4gcnBtX2liaV9hbGxvd2VkIGlzIHNldCkgc28gdGhhdCB0aGUgYXV0by1zdXNwZW5kIGRlbGF5
IGNvcnJlY3RseSByZWZsZWN0cwo+PiByZWNlbnQgYnVzIGFjdGl2aXR5IGFuZCBhdm9pZHMgcHJl
bWF0dXJlIHN1c3BlbnNpb24uCj4gCj4gbG9vayBsaWtlIHRoaXMgY2FuJ3QgcmVzb2x2ZSBwcm9i
bGVtLiBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkganVzdAo+IGNoYW5nZSBkZXYtPnBvd2Vy
Lmxhc3RfYnVzeS4gSWYgc3VzcGVuZCBiZWZvcmUgaXQsIG5vdGhpbmcgaGFwcGVuLgoKSXQgc2hv
dWxkIGJlIGVmZmVjdGl2ZS4KCnJwbV9zdXNwZW5kKCkgcmVjYWxjdWxhdGVzIHRoZSBhdXRvc3Vz
cGVuZCBleHBpcnkgdGltZSBiYXNlZCBvbgpsYXN0X2J1c3kgKHNlZSBwbV9ydW50aW1lX2F1dG9z
dXNwZW5kX2V4cGlyYXRpb24oKSkgYW5kIHJlc3RhcnRzCnRoZSB0aW1lciBpcyBpdCBpcyBpbiB0
aGUgZnV0dXJlLgoKPiAKPiBpcnEgdXNlIHRocmVhZCBpcnEsIGluIGlycSB0aHJlYWQgY2FsbCBw
bV9ydW50aW1lX3Jlc3VtZSgpIGlmIG5lZWRzLgo+IAo+IEFuZCB0aGlzIGZ1bmN0aW9uIGNhbGwg
YnkgaXJxIGhhbmRsZSwganVzdCBwdXQgdG8gd29yayBxdWV1ZSwgd2hhdCdzIGltcGFjdAo+IGlm
IGRvIG5vdGhpbmcgaGVyZT8KCkp1c3QgcHJlbWF0dXJlIHJ1bnRpbWUgc3VzcGVuc2lvbiBpbmNv
bnNpc3RlbnQgd2l0aCBhdXRvc3VzcGVuZF9kZWxheS4KCj4gCj4gRnJhbmsKPiAKPj4KPj4gU2ln
bmVkLW9mZi1ieTogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+Cj4+IC0t
LQo+PiAgZHJpdmVycy9pM2MvbWFzdGVyLmMgfCA1ICsrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYyBi
L2RyaXZlcnMvaTNjL21hc3Rlci5jCj4+IGluZGV4IGJjYzQ5M2RjOWQwNC4uZGNjMDdlYmM1MGEy
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+PiArKysgYi9kcml2ZXJzL2kz
Yy9tYXN0ZXIuYwo+PiBAQCAtMjcyMSw5ICsyNzIxLDE0IEBAIHN0YXRpYyB2b2lkIGkzY19tYXN0
ZXJfdW5yZWdpc3Rlcl9pM2NfZGV2cyhzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0
ZXIpCj4+ICAgKi8KPj4gIHZvaWQgaTNjX21hc3Rlcl9xdWV1ZV9pYmkoc3RydWN0IGkzY19kZXZf
ZGVzYyAqZGV2LCBzdHJ1Y3QgaTNjX2liaV9zbG90ICpzbG90KQo+PiAgewo+PiArCXN0cnVjdCBp
M2NfbWFzdGVyX2NvbnRyb2xsZXIgKm1hc3RlciA9IGkzY19kZXZfZ2V0X21hc3RlcihkZXYpOwo+
PiArCj4+ICAJaWYgKCFkZXYtPmliaSB8fCAhc2xvdCkKPj4gIAkJcmV0dXJuOwo+Pgo+PiArCWlm
IChtYXN0ZXItPnJwbV9pYmlfYWxsb3dlZCkKPj4gKwkJcG1fcnVudGltZV9tYXJrX2xhc3RfYnVz
eShtYXN0ZXItPnJwbV9kZXYpOwo+PiArCj4+ICAJYXRvbWljX2luYygmZGV2LT5pYmktPnBlbmRp
bmdfaWJpcyk7Cj4+ICAJcXVldWVfd29yayhkZXYtPmliaS0+d3EsICZzbG90LT53b3JrKTsKPj4g
IH0KPj4gLS0KPj4gMi41MS4wCj4+CgoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgt
aTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1pM2MK
