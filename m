Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F38CD2F347
	for <linux-i3c@archiver.kernel.org>; Tue, 13 Jan 2026 17:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dxu6SyZQcUrKq5nCiLHR5VKXcVuP3kGNAb+jHHWM/oM=; b=lsnDsXbE+alXbQ5tp35D37GtE0
	39vGmt994gTunx0UXxLO0UDmB3v5bsl+ZX76N+oO8QexboALEGmgHHcUIkzmxPwaR0E0g3fOrjNj4
	0ahG5YxmVYXbXQ/XbWPcQbPT2A10ACepDCP0qX4Ax3vFUDqURyop72g0BQTPBP/UBtdhDpgCWXHd5
	KctY+YWwyBbJE3yATWs7ej20/u5Tpm9Vs369+P3TEivdBT0VN8ngl5ygxlYCWRWg7ZkUG+EvprQ56
	x1+MZisBojgfffzBg4esszDWyOrlB0poVlB/UQR3iooEsPiSw3h9e79ZlgQcoY/+usIwTcAl1WS9e
	zHWHhbxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiAr-00000007Wfl-0VcL;
	Tue, 13 Jan 2026 17:27:21 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiAp-00000007WfQ-1eTQ
	for linux-i3c@lists.infradead.org;
	Tue, 13 Jan 2026 17:27:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768325239; x=1799861239;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QiLcr9c80lc5WVYEja8pRe6Bh6PP/QAB8k+O5RbNnJo=;
  b=GI3Salzj22PKahOmNRlS22cTEYqEjP09Bqh9be1vhA63RCnUy83riWk0
   QFgiw86ic8YMxUGO45gvBGo8tTCGbXLUHHi8XvsURtTSFQqhAK7yIzGf+
   28CdjpbTOO/jBpYeMVVTbBYrjEPQPDZ7/Y4cRFAD1K1UXvbvPD6AU6ejg
   RB9Xni/wlrj2XctOToTO3oPnTbEXj2WVvB/JVisr8bkJLFKnxF+89DgV9
   fyzIRRAIxg0fbv7q+xDk7gQgf2+bBxDP5enNyflNXIKoWU2W72+Tk2n/P
   Q44GQtveFw7v8tdDt3TtVaJ+7P9Qp0ww7r/K4lfi8jxolEjHEvHdpstXr
   g==;
X-CSE-ConnectionGUID: Evpa5F+IQ0uJC5BMS7l7cA==
X-CSE-MsgGUID: DHq5A9WwSaybCkpuIfvxUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69672137"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69672137"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 09:27:17 -0800
X-CSE-ConnectionGUID: /mePXyyfRCiKOYtv7uUeZQ==
X-CSE-MsgGUID: 060Mi2e7Re+WUjgZPLxd8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="209282644"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 09:27:17 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 09:27:16 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 09:27:16 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 09:27:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUUIw37CBq8VfG4c8VJcRcDMzL5dqTTFmILv2JKlOlWN9FA5h0B4850s1d/qo68PbRripFergmhu5sAkWzvugqAhWVGXtC0XT0mnu5szekL6CYDvA3SkXpem4jrwPrhMZaiKh5s7WxXoLGWctNXtJKH/krDf37UJhF2GR5Ph0HQ2DIpWiq/ZI2VUBvf8yft2/mt/2mtEoUAa50abmt7N4SMIr8GitOtNsx6knt7TilgvfuYlXWA7u+/p8MURnRZ+P1tTOleFMKBLZoQ90xMAwoblPlgmR0Om7UdBcvif57rLOzFlHxtI8Pt61ZTh/I6i7KX/UMcQhkFcPKJsYkMM6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSYva9T+W9KxNFhyjLhZDJ9koIc351HxT17bYWIIpUM=;
 b=HVMKv1XNj1sTocw2085pJmM5MmLolhCruUVZNS3f2Z9AaxwRqcguxBU8LpRywrDOqX1+MOuIBuNKNhF0EdRnqbZq22pWA3gXC+kwt2gBJqomD6QrMftf0rjzZ2E4mca0k5kEiGVFnBKvAibOMxq5uUPt4nJPCA1kYKwuNNiYBmQilnUZaPeSzagZ/curmZiejC7Yqs02LCHkbd84k3YwZhxYOac3oJnH9A1fKheBuZGLx7A9iiHAHfvDq/sm7DKtxhFvRxEK7fnt0RHucfsVroJUYSxofts1vOV+vMiYwVfTYp34XVQ4sXl7r1oAm23TQf273wgY+XSP6nS1ZQBsCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CY8PR11MB7747.namprd11.prod.outlook.com (2603:10b6:930:91::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 13 Jan
 2026 17:27:09 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 17:27:09 +0000
Message-ID: <e23f5cbf-7a1f-41d0-88fb-b8e4b9426113@intel.com>
Date: Tue, 13 Jan 2026 19:27:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 16/21] i3c: mipi-i3c-hci: Factor out core
 initialization into helper
To: Frank Li <Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Aniket <aniketmaurya@google.com>,
	<linux-i3c@lists.infradead.org>
References: <20260113072702.16268-1-adrian.hunter@intel.com>
 <20260113072702.16268-17-adrian.hunter@intel.com>
 <aWZyjxkuXEb2CH11@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aWZyjxkuXEb2CH11@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: DU2PR04CA0237.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::32) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CY8PR11MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: c51d12db-45f7-4e92-2d54-08de52c8faff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|18082099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1hKd3dQckp1V0lsUzNrUFNnQW0xTkg2elRqY01od0FaeFBvQVZCRVQ5ZW1y?=
 =?utf-8?B?VWsrcnBIdnd6RGJ6L1EyV1NCU05DbDRNYjU1c3Z5NXV4QjBtRk1Pd0RtYi92?=
 =?utf-8?B?TzlTbEQ5QUhYSm1FbU15N2VRRDllS00xaU1nTzdrMHNsSWZhMEthZGpPdkZM?=
 =?utf-8?B?cnVLMnVua21JS0Q0T2FrQW5nNlhpK3AxZ3dHdE83TS9QYWwwRlE4QkJSVEY4?=
 =?utf-8?B?aldjZGhEajBoYlh3cEVDRmgzdCtwUW1KTUZaNXo4SkZIdFVqRXJ1SGtRSEpO?=
 =?utf-8?B?Nzhia21IK3FkaEJrKzlhcWVtOWxrd1BJTzlPQXpGNmVEOE83TmdvQWYwc2J5?=
 =?utf-8?B?SlhncHBqaHNYazQ2Ukp3Um9zL1dIZ0czM2VROE5tR3E1TVJuejQ0dGUxOGNK?=
 =?utf-8?B?Kyt3MTNIci94eDVUYXJhcnFGY2JKdm14ajNoSVMzcUZaYjdWTGRNcS9hQVlj?=
 =?utf-8?B?STk5dC9maExGSUF3SGtNYVQxeHkxSzZPazRHVis2RHUzZFhWd1ZkL0xwTitW?=
 =?utf-8?B?V2YvUlRBZUE2SmY5TWJzMVJPU1BTaXZyY3hqdW9OcUNERjk5emVJaEZqM1Zl?=
 =?utf-8?B?YzNnZk5nS2NwMldHcU44SGtnc2ZmaXFoMEhxZEZxM2RUR2ZXdWNuMVhWQW5p?=
 =?utf-8?B?Y0pxNVVyeVV4SDFKb2tYUHp6UCt4bm1BOG9XbkY5cUNIYXFaTFZsNEZTSTZQ?=
 =?utf-8?B?VUcvUlJmai9XU1dISVFjemM2bXQ0dFdlMDdKKzZjdlhVNkNDT01NRGNNU3ph?=
 =?utf-8?B?Z2lxN29zNnNQRFFUa2RjdkRDZjVlTzZFd25jMldsN2xvN3hYd2FkdUcxL1JH?=
 =?utf-8?B?RHJXUVArUzhKUmMzT1pEL0VtUDVKbWxYMXo2S2t6THhsK3FWYUNJcjRiTEM4?=
 =?utf-8?B?aXFiS2tyUkNYVTc4TEZMRlQwRDc5cjFESi9SSll2V0NRNzhhOHJNZkxMZFo0?=
 =?utf-8?B?eVk0SDl3N2xuTHNhWUNTOEpNdVNERWpycnpjbkQwajFONlVQK2JMRUNKbUVp?=
 =?utf-8?B?SUE3aWR4UlRHUy9hSzJ4dXYwWlZTcTIvM3BCYjN1d04vaDhRTURaS2lWRjRI?=
 =?utf-8?B?WHRJbTVuS1FjMEpwZEdTQUNRTnZwT3ZLNzRrTE5tUGFGUzZoWTA0dTdYdjZq?=
 =?utf-8?B?WnVkV3hiWHlubkVDVVVoN09JMkZrZ0wzTFZqZE1RZVM3R3NwYndTK0hTdXda?=
 =?utf-8?B?aVMvUHRGMU1kTENYSXRNbXpiaGtMVUx3Y3R3NHdIWHd1RjdTY0dmRVFJZ2g0?=
 =?utf-8?B?VjBaZmpnQ1NxYlRYOHF2WDh2VUZLd0lVdXhHYk0wd0Uzd0hyRWJ5djZ5cUdN?=
 =?utf-8?B?Qys1Qml5YkRoME1LcGJ1VlNxek1ZZ0swOUo2TzZ6c1kxektSR1Nsb29YTzZ1?=
 =?utf-8?B?SHIxWGVtbjhvMVFjVFIrNEcxWGprb1g5UURDMHJhVTd4Y001VmxoQjFnclhO?=
 =?utf-8?B?MGtHY0lTOHJoQURldW5CVXpKUTJBZWhTVkY1ZVpYSlcrR2VFdnNTVWpGem1N?=
 =?utf-8?B?bnM3SzB2RHZpaG5PQ2gyblRJaDZtR3UyWHl0MVFxaDBFYnlNVy9XM0VqMkhZ?=
 =?utf-8?B?b0pEZ2Z3YWNnWXRZVTB0TS8wMUQrUzdoNU1NcXNzcnZQK0hLalo0UGZQVjgz?=
 =?utf-8?B?U3hoT3hQWDlGdlZwR0FQbjI1Lzl3dzZnbHhyWnJuMGNtVnZNVjhDR3AwLzdv?=
 =?utf-8?B?QjFCMnhGdUk2ZlVQRHlaVVRtSk1oZlNvYjVwZ0RBWjB5K2NnTGVCeENnMlpq?=
 =?utf-8?B?aWtrVzFPMGo0eHZMWFVrNEh4NlNOWUFNbE85a0hXR1JoN1BjandTZjlpNnB0?=
 =?utf-8?B?VUlsSjgxOXRiR2UwY0RIZjQwUHMxbFRtejYvTFB4aHlaZHlXQlh4eXNpVlZT?=
 =?utf-8?B?NkFQTS9sTlc0N0czd3RSSUpVc2ZzdEpsNGZTRGtESG9jRStOUGNoWURQSXR0?=
 =?utf-8?Q?8udR6E8t0ns/ELSZYjjOyvRE9yH0Q2VR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjJZMTN2R2FQUjFqN1BzVndHVU5Zd01ORERrS0RoNlNjQ0Q4WTlVWFRMaERF?=
 =?utf-8?B?VFo3SWR1bzZsSncvYlpvMHhjbm02STVFZ0F5VjlzN3FVTElaUEVISGQ5V1J4?=
 =?utf-8?B?WXgzaVRJb2VsSlVQc3U3TTR0MkR0Rkh0VkFaQ3B5VGZYc0F4U2ltUkxYVzg0?=
 =?utf-8?B?MmxlSDFwQW51OHpjQjlORmUweEVwSzhsVzVKSEF2V29FSmVBWU8yT3Zad0pE?=
 =?utf-8?B?b2U2Yk8wQlhtY1luNU9nZUc1K2VNUHd6TmxYRVp6aXpGV2hSaElaTXBnMXpl?=
 =?utf-8?B?cXpiR3hKblUwclJoR3VTTHN2bjhVOXN2TnVMVFdGRkN2UGRSQU93UjlmWEJK?=
 =?utf-8?B?a09pdlkxMTFGRDBObExiKzVsMXRISUptUE9VNnR5cVB2azN0dDA2R3Y0QmZI?=
 =?utf-8?B?eGhOUm9rQ1hxTjlrN2VUVmJiVThTZTZnLy9LNUNORXFJNFY0YnY3ajEyNlNm?=
 =?utf-8?B?QjFXN0c1dW1qOExLQ1ZBWTNhOWl3Z2g4WDFzaFBkQ0RyTnBMcmR2ZGZqemNp?=
 =?utf-8?B?ZUdzbTdBTDdnSmZXVnI4NHhmQVZ2aXFtOG1KRnk5Y2t3clVCVnByRFFBcnJZ?=
 =?utf-8?B?cisxQnhBMk9BeU1seUtRNHR3STNqKzB6ZWNpOE9JckdNSC9vYnJMSGQ0bXZx?=
 =?utf-8?B?THc3ckszVThQTmhLOE1JaVh0RW50K0NidHhWVFBiVHZXYVJ2em5wZGZmUlZQ?=
 =?utf-8?B?anpTeVFXeklnZ1ZTTGpRU0hMMXBzVXdINDdpUkVxakFaMnY4RC9ZZ3RHSGpz?=
 =?utf-8?B?ZmdERjRNRllIZ2h0SENpZUpNalBLVnd4bXhnQWFVMWdtYmVGTEpRUWZTWGhk?=
 =?utf-8?B?bG54T1RLRXhGTHRzOTA4QWcySXJTQ2RrczFyM01BNy8vK0V2TDFDTDJaTHE2?=
 =?utf-8?B?aXJlcWREY2d0Z3pKNnF2UVBNbEF6aDRRRmFRaFZNSTBqc3R4ODdQcUpUL0RL?=
 =?utf-8?B?SDhpSS8rLzRhdGFIZ2Y3MHI1Zi9jaG8vMVY0UHZpMUxkbENZU2ZBRldOUkdx?=
 =?utf-8?B?bHAxYjk1eStsRHI5UmVFL0Z0VVdUcTlTWHhhRnVTdXJ1a1QzbHh5bk5nOFp2?=
 =?utf-8?B?VjdpdXNuU2ZPRzR1NXNWYWRVVm1oR3p5WUZKb0tWTHFRZURIUmFnKy84RkxC?=
 =?utf-8?B?Qk1hKzJDalM2RmJKdXVnTFpGSitYVkhwOEhIUzh3bGlNaDdRdEt2TXhqQmw5?=
 =?utf-8?B?Zm90TjFGWUkxVGQ3c3hPTExQZ3QyaVFUUGdLcksyZVowNXF6TysvVmp4cGZq?=
 =?utf-8?B?eVZ3WUh5ck10bjV4U2FzU29mblNqUzJ1RlFCbXNtNWxNUnBlQkRiVHdUcW9n?=
 =?utf-8?B?ck5lc2hSd0pSU1JnalZweExuOGRnNWhOYjdtMDV0NTZ0NGxLNTBWT2ZScGpt?=
 =?utf-8?B?Z21SZHp6elJyZ21MZWxrWU9LUTRGSG9KT0drMU85QzBUK0toeit2OWtQcVln?=
 =?utf-8?B?K0FncmpUblErTGt2TFhVSmxZMmErbHdLZ0lMTlJtRDJEOFRRbmJkQ0lkTDl2?=
 =?utf-8?B?b1RaQlB5dm1QdUlKVGpmcnNQZmZMWmw1T1JZdlZpTWRNRmRmK0FNcjdjbFZE?=
 =?utf-8?B?TW5ONDlsZU40VkhNYlZ2Ylh0VHlJY3gxSGdpQzFZZ0UyMDA5QTE0dnFGblFV?=
 =?utf-8?B?SXhzR09YTlJJSXoxSGV0UXoxNHFMQVdWVzJ0NEl6ZS9zN1pETzRaWCtuUGdo?=
 =?utf-8?B?S1JFRGc5OGlBTm5tcStDcFBjZ3JKRFVqSVhGODJUOGp6Z1RYL1RIL0lWL2Rr?=
 =?utf-8?B?eWJvbTZNZ1N1ZUZka3B3UTVYVXp0bnNYTW5ZM2IxaUNsNWthNm8rZCtTRmVJ?=
 =?utf-8?B?UUZKM0hWOGFqRWRqVFZXVDA2cVpsZzZVeE9sMGxMeDNudHNxRVJkdk82RUVm?=
 =?utf-8?B?NHhBWFFHU0M3TExHcmNLNis5b2szcnhIS1F5V2M4cHN5Y2RidGNENjY1SnE4?=
 =?utf-8?B?NWs0b3VrYXpSZFNxQUpOUVJKeUlzZ2FSU2lPYzc2SEt6VE5HSWUvdGtEQ3Jw?=
 =?utf-8?B?QTZHcytMTUVrVDZGMUQ1Ukg5Nk1adFFzRHJTNTJvT3FWUmlsUnNQK1l6RVVF?=
 =?utf-8?B?WWVFYU5jVTV5K1c2Qk4zRTV4VGNKbFc2cTRhQ1J0UW5WZ1RGdm5rT1RkSE5w?=
 =?utf-8?B?SzFsbFlPM1RMM0pVVkVwb0FpWDJCQlcwZ1hPOVFlalppcU10dDdQTjNOai95?=
 =?utf-8?B?MGcxNG9nQTd0WTlOSC9wTk8zSVRtb01XcjJ4QWZMMEdZWTZpWHJXUWM4UWdj?=
 =?utf-8?B?UHlmaTc1ZmF2VkdnamgwN0ljc09jQ2FJQUY2aGw3Ujg2d3lUK1c0TXRQVGJ5?=
 =?utf-8?B?UHAvNkVEMmtGdVF3VzJ2Ukl0L2NGeGhDczN6aUVXVnY2VFRtWGJKUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c51d12db-45f7-4e92-2d54-08de52c8faff
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 17:27:09.3031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/2Nhxd6zLc37IYbqN9VHog2oX1p8natdwlM3LW3U9dE0qY9h9/WW4pYeZrGmhsGrDZ3XD+p6XfeNk12gzt3oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7747
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_092719_460315_D677A458 
X-CRM114-Status: GOOD (  16.89  )
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

On 13/01/2026 18:27, Frank Li wrote:
> On Tue, Jan 13, 2026 at 09:26:57AM +0200, Adrian Hunter wrote:
>> Prepare for future reuse.  Move core initialization logic from
>> i3c_hci_init() into a dedicated helper function,
>> i3c_hci_reset_and_init().
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>
>>
>> Changes in V3:
>>
>> 	Move I/O mode setting if I/O mode already selected, to a
>> 	separate patch
>>
>> Changes in V2:
>>
>> 	New patch
>>
>>
>>  drivers/i3c/master/mipi-i3c-hci/core.c | 142 +++++++++++++------------
>>  1 file changed, 75 insertions(+), 67 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
>> index 569c8584045a..8b8e3952d41d 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
>> @@ -639,6 +639,80 @@ static int i3c_hci_set_io_mode(struct i3c_hci *hci, bool dma)
>>  	return 0;
>>  }
>>
>> +static int i3c_hci_reset_and_init(struct i3c_hci *hci)
>> +{
>> +	u32 regval;
>> +	int ret;
>> +
>> +	ret = i3c_hci_software_reset(hci);
>> +	if (ret)
>> +		return -ENXIO;
>> +
>> +	/* Disable all interrupts */
>> +	reg_write(INTR_SIGNAL_ENABLE, 0x0);
>> +	/*
>> +	 * Only allow bit 31:10 signal updates because
>> +	 * Bit 0:9 are reserved in IP version >= 0.8
>> +	 * Bit 0:5 are defined in IP version < 0.8 but not handled by PIO code
>> +	 */
>> +	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
>> +
>> +	/* Make sure our data ordering fits the host's */
>> +	regval = reg_read(HC_CONTROL);
>> +	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
>> +		if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
>> +			regval |= HC_CONTROL_DATA_BIG_ENDIAN;
>> +			reg_write(HC_CONTROL, regval);
>> +			regval = reg_read(HC_CONTROL);
>> +			if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
>> +				dev_err(&hci->master.dev, "cannot set BE mode\n");
>> +				return -EOPNOTSUPP;
>> +			}
>> +		}
>> +	} else {
>> +		if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
>> +			regval &= ~HC_CONTROL_DATA_BIG_ENDIAN;
>> +			reg_write(HC_CONTROL, regval);
>> +			regval = reg_read(HC_CONTROL);
>> +			if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
>> +				dev_err(&hci->master.dev, "cannot clear BE mode\n");
>> +				return -EOPNOTSUPP;
>> +			}
>> +		}
>> +	}
>> +
>> +	/* Try activating DMA operations first */
>> +	if (hci->RHS_regs) {
>> +		ret = i3c_hci_set_io_mode(hci, true);
>> +		if (!ret) {
>> +			hci->io = &mipi_i3c_hci_dma;
>> +			dev_dbg(&hci->master.dev, "Using DMA\n");
>> +		}
>> +	}
>> +
>> +	/* If no DMA, try PIO */
>> +	if (!hci->io && hci->PIO_regs) {
>> +		ret = i3c_hci_set_io_mode(hci, false);
>> +		if (!ret) {
>> +			hci->io = &mipi_i3c_hci_pio;
>> +			dev_dbg(&hci->master.dev, "Using PIO\n");
>> +		}
>> +	}
>> +
>> +	if (!hci->io) {
>> +		dev_err(&hci->master.dev, "neither DMA nor PIO can be used\n");
>> +		ret = ret ?: -EINVAL;
>> +	}
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Configure OD and PP timings for AMD platforms */
>> +	if (hci->quirks & HCI_QUIRK_OD_PP_TIMING)
>> +		amd_set_od_pp_timing(hci);
>> +
>> +	return 0;
>> +}
>> +
>>  static int i3c_hci_init(struct i3c_hci *hci)
>>  {
>>  	bool size_in_dwords;
>> @@ -708,43 +782,6 @@ static int i3c_hci_init(struct i3c_hci *hci)
>>  	if (ret)
>>  		return ret;
>>
>> -	ret = i3c_hci_software_reset(hci);
>> -	if (ret)
>> -		return -ENXIO;
>> -
>> -	/* Disable all interrupts */
>> -	reg_write(INTR_SIGNAL_ENABLE, 0x0);
>> -	/*
>> -	 * Only allow bit 31:10 signal updates because
>> -	 * Bit 0:9 are reserved in IP version >= 0.8
>> -	 * Bit 0:5 are defined in IP version < 0.8 but not handled by PIO code
>> -	 */
>> -	reg_write(INTR_STATUS_ENABLE, GENMASK(31, 10));
>> -
>> -	/* Make sure our data ordering fits the host's */
>> -	regval = reg_read(HC_CONTROL);
>> -	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
>> -		if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
>> -			regval |= HC_CONTROL_DATA_BIG_ENDIAN;
>> -			reg_write(HC_CONTROL, regval);
>> -			regval = reg_read(HC_CONTROL);
>> -			if (!(regval & HC_CONTROL_DATA_BIG_ENDIAN)) {
>> -				dev_err(&hci->master.dev, "cannot set BE mode\n");
>> -				return -EOPNOTSUPP;
>> -			}
>> -		}
>> -	} else {
>> -		if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
>> -			regval &= ~HC_CONTROL_DATA_BIG_ENDIAN;
>> -			reg_write(HC_CONTROL, regval);
>> -			regval = reg_read(HC_CONTROL);
>> -			if (regval & HC_CONTROL_DATA_BIG_ENDIAN) {
>> -				dev_err(&hci->master.dev, "cannot clear BE mode\n");
>> -				return -EOPNOTSUPP;
>> -			}
>> -		}
>> -	}
>> -
>>  	/* Select our command descriptor model */
>>  	switch (FIELD_GET(HC_CAP_CMD_SIZE, hci->caps)) {
>>  	case 0:
>> @@ -762,36 +799,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
>>  	if (hci->quirks & HCI_QUIRK_PIO_MODE)
>>  		hci->RHS_regs = NULL;
> 
> these parts have not move into helper funciton.  Is it safe to use
> "hci->RHS_regs" in helper funciton?

These parts are initializing things that never need to be
re-initialized.

RHS_regs is the MMIO address of the Ring Headers section
for DMA, if there is one.  It is normally setup only once and
never changed, but the quirk above sets it to zero to prevent
DMA from being used.

The I/O mode (DMA or PIO) is selected during probe and never
changed.

> 
> Frank
> 
>>
>> -	/* Try activating DMA operations first */
>> -	if (hci->RHS_regs) {
>> -		ret = i3c_hci_set_io_mode(hci, true);
>> -		if (!ret) {
>> -			hci->io = &mipi_i3c_hci_dma;
>> -			dev_dbg(&hci->master.dev, "Using DMA\n");
>> -		}
>> -	}
>> -
>> -	/* If no DMA, try PIO */
>> -	if (!hci->io && hci->PIO_regs) {
>> -		ret = i3c_hci_set_io_mode(hci, false);
>> -		if (!ret) {
>> -			hci->io = &mipi_i3c_hci_pio;
>> -			dev_dbg(&hci->master.dev, "Using PIO\n");
>> -		}
>> -	}
>> -
>> -	if (!hci->io) {
>> -		dev_err(&hci->master.dev, "neither DMA nor PIO can be used\n");
>> -		if (!ret)
>> -			ret = -EINVAL;
>> -		return ret;
>> -	}
>> -
>> -	/* Configure OD and PP timings for AMD platforms */
>> -	if (hci->quirks & HCI_QUIRK_OD_PP_TIMING)
>> -		amd_set_od_pp_timing(hci);
>> -
>> -	return 0;
>> +	return i3c_hci_reset_and_init(hci);
>>  }
>>
>>  static int i3c_hci_probe(struct platform_device *pdev)
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
