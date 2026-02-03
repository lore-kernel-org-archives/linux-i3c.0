Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36470E8784C
	for <linux-i3c@archiver.kernel.org>; Tue,  3 Feb 2026 16:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=weReoeh7QQVMWuYnk+Sj3axVRFtQC4ip4xOwcXwZayU=; b=YdcSllXxfsau+j4xbpvi0IGtCI
	8ZJ9ep1GADSVBoKbZguDEMjga8t8gdXl/QGd3F1Em7sTxtUtRe+U04u+keLd6RSlI++10TRPNC9Gq
	C7ovzXN6KlH7E/OsVXZFf0IT6SFet2+LtmK7Le9DOyj7DNYUe3o3HhASmnBREL1qAZPwuUKjbo0ZR
	8h13+qIJKfimkdkoRCe7JhbAexHNXxd6sFijVuTEe9fDSJaT76V1gGIb4nETDzd5me4s4l2uUYUWk
	/JGzZyXg5q/iduiIhKHxgdhY+yIY1hhPnOXnJCRtKOivkDCo1c81pqbbLInFIesZsy8bBcurWbYHL
	xFGgVywA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJiw-00000006zuE-3tz8;
	Tue, 03 Feb 2026 16:57:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJiw-00000006zu4-0qtV
	for linux-i3c@bombadil.infradead.org;
	Tue, 03 Feb 2026 16:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:CC:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ns+Vra0zIZ9RItn99IeDf0f0FCdw6SgciIEq5r2wETw=; b=S5+XB95QGtCGJYCgJ/1EH1mo3X
	Kylz5zG8D11pBBHU/Mb2OpusNjEsMIPRQ/znhzFnoxb3DEBKhgro7XHAL40r4tZemYt2TRvzp7K7I
	48twN9qDplH8iS5G3QWSFIdxVT+ZnhRP6Jajpb3P2ZmhHcecuG3V1w9ES7Vg/hP60zqzZEUodCdTJ
	jpg7TrguPlJUFGs2wWACQAYVp3lQXdmDYTpohGbWz4yMsc0H9SVTYaGUY+tjClyY0036K95xMtgaE
	n5/bTPlXdVWZd9RrbcQrCSRR03c4IdFzOTXWb8y+/IanqDcP5FG5OAFHfEfn3MO1pnpQxla/0N85e
	YWPthb6g==;
Received: from mgamail.intel.com ([198.175.65.14])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJiq-0000000GeYn-3Xtm
	for linux-i3c@lists.infradead.org;
	Tue, 03 Feb 2026 16:57:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770137874; x=1801673874;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cvglmhVE4U+NT9oOtOyx37JZcyTmYDVDDDZdIH6PpwY=;
  b=RCePRUIK4soztpEc22Yz6PZtfmICjlM4UwMbxZO68TxRYsaIeDL1FxNc
   ocbvyKJOWOK86ahEviqImd/7qLwvcZXNE1LSq7Me96VUGY9UOVzD87Ot9
   R2gDNyAT1v6yTTWyf+tZcP4AgmCNVaR++s/BhCielyjRlEANgmXAIbVtb
   9QLIEaMe/CJRMMLm78bPyT8LnLIVEP+C3Ak3LxkHViqXTX8wzKmmvLX7e
   dKFU5wrQTBwb9pwFSI2jDBc/xqKnIGUppMSysIz1LW1+9hJoU8BW/YTlN
   QWnWxqtNvcG3ZuwKonzEONr/bOWRygzNLnaNvbhtILwMoKFpvCiIFMIzi
   g==;
X-CSE-ConnectionGUID: JDlfRNBNQNKTTu0YmsXEnA==
X-CSE-MsgGUID: rmMvaIWgSSaatjn9gGbLNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75167631"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="75167631"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 08:57:47 -0800
X-CSE-ConnectionGUID: xWTqekugQyOKaqQKl9kS6A==
X-CSE-MsgGUID: /UQyoYSyTrmtuB2jyKyYwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="214382311"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 08:57:45 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 08:57:45 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 08:57:45 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 08:57:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNlKrC3AcFiviTC6jlfeewfDoacQaqi1+l8/c1LiYDbP4JGnBzxCTMDy5t3CftMTRtIWJt8PxbWD3YEFR8w9ViNITODICxFK3UpduEyEOuPj4mQn6h9O1bm2g9o+lhhlwy0UHiWoDU/zhozzpvfmhSxLNOhDjUWITD/PK/YQNH4SUELliwWBTygV+v6DNySIHg+cM6rP3LdKwwzU99UGioT1T0alU3FaYr5DuzjwmkDvmOLq81o/w6GsDsxufUs+cg6GnTgGaWTKKc2Wdhg982PDLoUTnLPlo/r/gvqYOkoiWy6dSTAnj6IX/ItURem45vHf6qdEOMfF05ALEpA05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ns+Vra0zIZ9RItn99IeDf0f0FCdw6SgciIEq5r2wETw=;
 b=HFAf9n8xabky02Jiv9wqFpeO0OeKV+Fh02Gm6u5sRwIgFOYTM/vpGIz7WcF8/iTCfGhV8aUbx0kN4cgcizDS0EHsQaTz7fUqSSOVfKsQJwXJ1gEZpfibzCr2/3wziz6Ra4bJv5YV5Mv32aBF9E0mlBTRo37JR5DYGjrAJJdSS7g+sgYnOlIBWjVLBrqIZX8IID4ksP2RNPKYxnKdsfB921/gJeyrBEDetS+IY2sk5/K+e/O3xA0fZdUSgiOZZ0aH2YLqKdTAr9An7/2rGfC9krLvE/H0yDRxo7wSXu2A7uxIernFEqpgwyPNEFYy03tpUzihSlYFWvfDqsXwzYmXsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by IA1PR11MB7199.namprd11.prod.outlook.com (2603:10b6:208:418::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 16:57:42 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%6]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 16:57:42 +0000
Message-ID: <a6525228-2abf-4177-acc7-858843941ba4@intel.com>
Date: Tue, 3 Feb 2026 18:57:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] i3c: mipi-i3c-hci: Allow parent to manage runtime PM
To: "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, Frank Li
	<Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>
References: <20260129181841.130864-1-adrian.hunter@intel.com>
 <20260129181841.130864-6-adrian.hunter@intel.com>
 <aXu8TiFpMiIVk5Iq@lizhi-Precision-Tower-5810>
 <dd681a97-de37-436b-b09e-5173c1de2f24@intel.com>
 <aXvKZK8tTnCDGzth@lizhi-Precision-Tower-5810>
 <a8a608c8-c6ce-415b-ac02-db1246edb15e@intel.com>
 <aXzIeLLDxsmzUhI+@lizhi-Precision-Tower-5810>
 <09622627-2ff3-4fb7-80f2-686d6474e417@intel.com>
 <aYDP847mgleQBF5Y@lizhi-Precision-Tower-5810>
 <eb335daa-ab6b-4cff-bea2-90160892bc8f@intel.com>
 <aYIbZ3PwiKUfp/eL@lizhi-Precision-Tower-5810>
 <73f7fc6b-d3cc-46d0-a07b-45c2a4190434@intel.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <73f7fc6b-d3cc-46d0-a07b-45c2a4190434@intel.com>
X-ClientProxiedBy: LO2P265CA0235.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::31) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|IA1PR11MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: 14e31fa6-8c3c-4b72-a08d-08de63455893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3NZbGNzVVBqUDh6Yyt5WkVyN2RaZzAwcmJYYUZiR1hIem9mTE85Q3NKMnJh?=
 =?utf-8?B?N3ZVSEZXdnExZWhHZHU0NWpUV3ZBejFZajM4VzRwU2dIREZiNkVYQ1BnQVc2?=
 =?utf-8?B?cjJDaElraDFxN1Z2ZlJWNWhXK1N6cjRMb29IdnhmT3Y5NG1LaURjdmJwWHJL?=
 =?utf-8?B?NzZ1bmRXK2hxbmJ6eHp1UXNIUWpYQmI1S3NYdVVBSnBjeXh4bVo5K0RsNWg0?=
 =?utf-8?B?czFKTjRGa2tXZHFXQUlWSzJjckZKUTE4ZzZzb2pRRUVMT2M0ZnlPazBkalY0?=
 =?utf-8?B?U3Bhd1I5Mk1QZjNYWVlBVkdGSDB5a1ArWk1JbGVLbm4zQlZxU09jT0xQSm5s?=
 =?utf-8?B?VVdKQzFVcEhPZm9mdVFpMjZ1c2tzSERQWmZTQjBWSHhoWC91M2lZWC9UTUlJ?=
 =?utf-8?B?ZmVMRGxaUlFIKy9LWFFQZ3FVV0FyN2REcm5BSnRIWWNMcU5CZVFiN3RUa1lB?=
 =?utf-8?B?dG02VnZKUEJFVFZkbkZrMktDR3NiZGt5eU9GSXNmTVI2dE56MWpIUytkVHdX?=
 =?utf-8?B?SnQ4aWc1NjdBcGY1SVl4dXIvVlB3WS9ZaW5PakVtMnF2Mk1ReVA0SXRKYk1n?=
 =?utf-8?B?UFFoQ254ckR1WWlXM1lMSVRWd0ZFMGJtb0xaZDhLZFozaUYyZmFUZFFMeExx?=
 =?utf-8?B?RitJNzV4WkVhZWs2L1hpaE1WeTBNWnFGQktHa2hIMFNiNXB6RFcvbnVFY1Jr?=
 =?utf-8?B?WE1jVTViNzVRNHVSaWIxalZzL2YwY2dwdldNNmQrRm1ybS9BVjdjd3JMOEEv?=
 =?utf-8?B?Y25kZ2FUdTZRUWRKQ3ZwZkpJMVFwWjV3em1rODNteUtxNElYL3ppbkRodzhW?=
 =?utf-8?B?L1NDYWVLZGxjQzJrWkxYRTZMVlUyS1VlWU9FWll5Z3dzVVYvalhVTGhYbXkr?=
 =?utf-8?B?eW5YeGJ0eUtxeVNwUUdnU0pFVWlmYk9teHY1UUJkRm00RjErZVllNGw3TFJm?=
 =?utf-8?B?eXFscnNZLzdDOU9RUzRRQ3BOVEpLb08xVUtDMW4vdHVUdklXRVlrMlNLT2pV?=
 =?utf-8?B?Nktjdi8yQmVRcEwzUVZYaWJkT2sxNmtIVmNpMzg2b0FXSzBubDlHQy9JZWlO?=
 =?utf-8?B?eW1tRGZnS0N3NzY0bkZra0hIellWenNET1BVTjBicWhlZk1CQVcyK1NhNWcz?=
 =?utf-8?B?bG1oWndOMCtuS2FQckRNWEM5dG9TL09KdzRXbWV6NWFEaU1jWU1jSkdQaC9Z?=
 =?utf-8?B?T0Y3MWd1elkvZnNYRnR6cEdGcEVPcGUzNmJJRFAxb2s2YU1rWGZNM0hvdEc4?=
 =?utf-8?B?K1NjdGtZc0NBeFlmZVJRd3BKdHNOUkcybXhOVUwzY20zVjZKdjFqRGh1aDZi?=
 =?utf-8?B?UTlGOVhzWXRZWDRYdlZYdE0wTE50em9qaUhBK0t6Z2lBWi9ORkdCNlRpTW9s?=
 =?utf-8?B?R1pBVFp0ZEJScXRBZVNaN3lWQk1sTEZmeHlRb3hxNDJSQ1FFKzUwMHZnTFpm?=
 =?utf-8?B?S2xlNkNCdzhta05naDhKalZkc1dINkY3QmtsM2ZuNlNnYTBEUFlpVitBS1Jx?=
 =?utf-8?B?ays3NjY4MjhCREk4SWNQN21tVytveWFCZmJQN2tSRTdIR2pONllGalI4RWF4?=
 =?utf-8?B?NXVMUnhRMXBFblNvVHAyVEFscW0wTmU4QVpjbXpZT0VXUzdYdFVzdysvNmtR?=
 =?utf-8?B?Ty8xelN6bTR2eHRUUHh3M2htR3JDVEhBMWNUb25NK3I1QXlCVVNPMHR4aFBO?=
 =?utf-8?B?eGFwRmhQbUJudkQ0YVF0VWw3bjFGTHl0TjUybnJ2U1IrQXN4QkJ5b2RWZk5T?=
 =?utf-8?B?L05EUW5OTWVUL29xSXNOOThlVTdId0s5WmxpWW5DaDNTVkJNVFFpbWwwTEIw?=
 =?utf-8?B?NDFDMjBBZ1A0Rk1ucXUzM21heTMrN1JsODBzL1ZWMWYxN2JFRnZ3RGlqVVZt?=
 =?utf-8?B?bmpwYll0eHA2SldCczRPdjdHNXJQUkxYSnJRNFp3Znl2eVBuQXovR3JFc2ZL?=
 =?utf-8?B?S2x0TGxvUE5yYllHSjJUbVZrc3RYVUNWMGMzdG50RzNmRUhIYi9TSGhWYnZ0?=
 =?utf-8?B?cVo0OGl5dXk1cmkrWDZzaE5wQXlaVERxam04M0JjSmRtMEtTUUpjeVNVQnlR?=
 =?utf-8?B?SmkwMzVVa2U0aFZSZno3QmpOZ2lMWlQ3eWdoc0o3cEFBS3lLZFpSRlZENlJG?=
 =?utf-8?Q?iPbw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dk1ZckNaSGMveWYrWm5nRUtLcUNqOFJJbHA1UzV0enIreE1CT2loZS9nRVJK?=
 =?utf-8?B?TXMyRjQ3Q3QzcDNpb2d3aWVOS0FmbmNTVHExaWlVRGFxVlc5UDJSRHdSSlF2?=
 =?utf-8?B?MVkzRWF5TzhScSsraGtMbzF1Rk9TZ2tsTGxld0dRTXVMb2xRakJtek80bk5R?=
 =?utf-8?B?cmZLVGF1SnVSenJzbnc0bU05aGhYdW92TDNWaGpyb1AxZnlHc1BHVGFDVkEy?=
 =?utf-8?B?aXZFVDBna29rTjZRMzhmNmJHNTBnbUh5VzJUQXF0bzViWlA4WkhBS0ttNlNI?=
 =?utf-8?B?UlIySmtrc3kxUHh2RXBkWUJBNS9ySXFYWTlHODBkT00yMEYwODdTNDdIaVNC?=
 =?utf-8?B?REdXbWYrdGlObDBvdE5HOGtybHp3VXFzUUZrMXh6VXRzMDBsTjBWSXFPQitw?=
 =?utf-8?B?aUNsbG1oTktxS1pLTklMa0x5dU5mUmpjVnd3cGw2T0dKYzNMeFZFMEdZRmht?=
 =?utf-8?B?M1dPTnVJaVJYSDFBOTlCa3dGQmZxWURYWjVzbGF5T0xzMGk5ZXFNVzhMcnU4?=
 =?utf-8?B?L0ZRSDhWUjhCUlVKcjJZZ0FEQklTMDgvSDRuTzNGUE50Z05oZ3FyQmRHdGZK?=
 =?utf-8?B?TDU2MUZMdHBnR0NPWkhYTmJVbnZzb3BReERHOWsybDRzcXU5Q1p2Tmk2L1h3?=
 =?utf-8?B?TnYrTTJiMVU1WUxoRmcwUXJHUmIyNHB3UmFqallHQ0lmdEpSQ29oVm5kSFZk?=
 =?utf-8?B?S0ZRVEJtN0hDMWdTM2xqYkVlUU0wYmNmQTlHM1ZJTzJjMTZFUGpnSm05OWYv?=
 =?utf-8?B?VE14QnEwMzlrT3J0WkFpUVlkME9OYnY0aGFHVzc4UnhGSENHLzJzU01NREll?=
 =?utf-8?B?R2cwQUxQWk5LaWk3RnJibXNFVGRzQ0huc0lWYS80cVVTL3ZyMzVtbXFwZGlP?=
 =?utf-8?B?OEZ6T0ZpWDRQYlQ3R282eTJYbWIzQ2taVEVjSUJHNmJVWW1uc3lNU2pOOHox?=
 =?utf-8?B?YVhESUpkdUNQYlNiNWFKdHdXdDhkcWs5dkNmTVdLNFlmYkg1WHY1cTZjNjc2?=
 =?utf-8?B?c2FFMm8vVHhVVVljVnlmb3Q3MDNrb0tycWZtYUxqR3Nyb3N2aFVTOTh1TGI5?=
 =?utf-8?B?UmdYN1UwbDBmTUxYQzkwRERkaGwrQXpPVmlWeXNBb0dOS3ZTb3Evd3JaQy9M?=
 =?utf-8?B?U2c4RHRmUjl0REtuK3pLVVRjdFpZY2o5bHZXL2xPRWZmVmdtdE5VT1VMcHBa?=
 =?utf-8?B?WERPSk5wNzdGdmRtMnU3KzJ1anYxWTZVbGtISGtyMVRiYnExaUovbVRPZzdz?=
 =?utf-8?B?RVlYeWJlRE42V2V6ZHZJRU1DWUV3bjU1N0dQL0hETHpVRDY1UldpVHhmK2ZY?=
 =?utf-8?B?ZVRuUVRJZ2daeVVqRDVCRmcxNWhQNWladkR3SGw3U0FjNTMxWHJhUC9FTnBa?=
 =?utf-8?B?cXBLYXNtVk9oaXcwR0hwNWNtM1J1eThsMkx2L2FXblhhNWl6ZFd1anFNTXFO?=
 =?utf-8?B?N2ZNckwrcnFLM0FDMzhCYVNORHFnUXVYVnpUak5MZ01Fa20yL3BFLzBrNUhJ?=
 =?utf-8?B?WTNRN2NnV0F6cW9ZMGYvUUJJdnV1ekkzMGVqQS9HZjZmcjZ2aGFYSitnSW80?=
 =?utf-8?B?TitwTkV5K1lFZHEzVkhTVnBWWVZ6UnlLWDlQd3VBSVpraE9GZkYxdGJ3eUN5?=
 =?utf-8?B?OE42TlhhN1dTc2NneERkRHFudzhNc2lpcEx0THRBZEQ3TjNxTk8yRWRYaXNK?=
 =?utf-8?B?bHk5VXVLUUxUbStoVTNOVjVGVGRwWE00aUNaRzEzOVBIQTBHMVo0aUhKeWoy?=
 =?utf-8?B?THAxY0xOQ1lxczVVc04raWhsb08xd0Q0NEZBbnhZMWFCYWQ4ckc4ODdmam1v?=
 =?utf-8?B?cWpMYjYvNHI4VERhWm9LOWxSUEJERkpQeDEvZHJrWDRZRURqNmdLUjRxSEpK?=
 =?utf-8?B?OHhidksxRXVLVnVEY0xhWjgrbkdwOXpHbWJEYXJVTTJBK3diWCt6VE1UNWJs?=
 =?utf-8?B?dUF2L29ETUlHU3FhSnJ5ZS9sWUh6NHgxeEtqaCtuOHNlVGh5YjMxLzhkSXFM?=
 =?utf-8?B?dVZQQ1lmNE1jeWluWWFBUFRXc0tPRVIycTlpSjJuTGF2RzhFeU9iWFdCT0NO?=
 =?utf-8?B?TENnNG8wcWZueG4rZEQ3ZytHREppUGR2eWhtNS8wN1NFZEdVemRuZjlWNXFH?=
 =?utf-8?B?RTBVRXMvVW8vS3A4bk1EQXJzRmZDWkxRRWlTOHRrUTRsVlpVRUhLZTZwZnY0?=
 =?utf-8?B?WG8zTWFOYmpMaGJSK211Yk0vRlRxMlVUbjlOZjBkN3N4a3BVSGx2MnNIcjBF?=
 =?utf-8?B?eXlMY0hEeEQyVGZxcTROOHA4eXBtMmZPaVBQS1djSVhoL0d0SSt5bHhOTTI5?=
 =?utf-8?B?YU9XeVZyS2Vya0tPUTNxQzhlWUluZDVGMWFtWDBCVFQwZTVQSVo2Zz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e31fa6-8c3c-4b72-a08d-08de63455893
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:57:42.5487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7q1X69SLd14MBxq73b2dueZ1xMb2qZ7V7NqgW+/9Kpl3KEIQFYOnNq/I9+y6nqUgqfwUSeqP5PjJFLJ1kKqtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7199
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_165753_553687_F8E97A58 
X-CRM114-Status: GOOD (  11.99  )
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

T24gMDMvMDIvMjAyNiAxODoyMiwgV3lzb2NraSwgUmFmYWVsIEogd3JvdGU6Cj4gCj4gT24gMi8z
LzIwMjYgNDo1OSBQTSwgRnJhbmsgTGkgd3JvdGU6Cj4+IE9uIFR1ZSwgRmViIDAzLCAyMDI2IGF0
IDAyOjU0OjQ0UE0gKzAyMDAsIEFkcmlhbiBIdW50ZXIgd3JvdGU6Cj4+PiArIFJhZmFlbAo+Pj4K
Pj4+IFJhZmFlbCwgdGhpcyBpcyBub3QgYXQgYWxsIHVyZ2VudCwgYnV0IHdoZW4geW91IGhhdmUg
dGltZQo+Pj4gcGxlYXNlIGhhdmUgYSBsb29rIGF0IHRoaXMgcGF0Y2ggc2V0LsKgIFRoZXJlIGlz
IGFsc28gc29tZQo+Pj4gbW9yZSBleHBsYW5hdGlvbiBiZWxvdy7CoCBJcyBpdCBhY2NlcHRhYmxl
P8KgIElzIHRoZXJlIGEKPj4+IGJldHRlciB3YXk/Cj4+Pgo+Pj4gT24gMDIvMDIvMjAyNiAxODoy
NSwgRnJhbmsgTGkgd3JvdGU6Cj4+Pj4gRG9lcyB5b3VyIGRldmljZSBIaWVyYXJjaHkgbG9vayBs
aWtlCj4+Pj4KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFBDSSBkZXZpY2UKPj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfAo+Pj4+IMKgwqDCoMKgwqDCoMKgIC0tLS0tLS0t
LS0tLS0tLS0tCj4+Pj4gwqDCoMKgwqDCoMKgIEhDSTHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEhD
STIKPj4+PiDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4+
Pj4gwqDCoMKgwqDCoCBJM0MgTTHCoMKgwqDCoMKgwqDCoMKgwqAgSTNDIE0yCj4+PiBZZXMgYW5k
IG5vLsKgIFRoZXJlIGlzIG9ubHkgMSByZWFsIGRldmljZSA6IHRoZSBQQ0kgZGV2aWNlLgo+Pj4g
SXQgaW1wbGVtZW50cyB0aGUgTUlQSSBJM0MgSENJIHN0YW5kYXJkIHdoaWNoIGFsbG93cyBtdWx0
aXBsZQo+Pj4gSTNDIGJ1cyBjb250cm9sbGVycyBpbiBvbmUgZGV2aWNlIChpbiBvdXIgY2FzZSAy
IGNvbnRyb2xsZXJzKS4KPj4+Cj4+PiBUaGUgUENJIGRyaXZlciBtaXBpLWkzYy1oY2ktcGNpIGNy
ZWF0ZXMgMiBwbGF0Zm9ybSBkZXZpY2VzLAo+Pj4gb25lIGZvciBlYWNoIGNvbnRyb2xsZXIuwqAg
VGhlIHBsYXRmb3JtIGRyaXZlciBpcyBtaXBpLWkzYy1oY2k6Cj4+Pgo+Pj4gwqAgRHJpdmVywqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBEZXZpY2XCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEJ1cwo+Pj4KPj4+IMKgIG1pcGktaTNj
LWhjaS1wY2nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDAwMDA6MDA6MTEuMcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFBDSQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgL8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4g
wqAgbWlwaS1pM2MtaGNpwqDCoMKgwqDCoCBpbnRlbC1scHNzLWkzYy4wwqAgaW50ZWwtbHBzcy1p
M2MuMcKgwqDCoMKgIFBsYXRmb3JtCj4+Pgo+Pj4gTFBTUyBJM0MgYWxzbyBzdXBwb3J0cyB3YWtl
LXVwIGZyb20gaW4tYmFuZCBpbnRlcnJ1cHQgKElCSSkgdmlhCj4+PiBQQ0kgUE1FLsKgIFRoZSBQ
TUUgb25seSB3b3JrcyB3aGVuIHRoZSBQQ0kgZGV2aWNlIGlzIGluIGEgbG93IHBvd2VyCj4+PiBz
dGF0ZSAoRDNob3QgaW4gb3VyIGNhc2UpLsKgIEFsc28gdGhlIFBNRSBpcyBlZmZlY3RpdmVseSBz
aGFyZWQgYnkKPj4+IHRoZSAyIGNvbnRyb2xsZXJzIGkuZS4gYW4gSUJJIHNpZ25hbCAodGhlIGNv
bnRyb2xsZXIncyBTREEgbGluZQo+Pj4gcHVsbGVkIGxvdykgZm9yIGVpdGhlciBjb250cm9sbGVy
IHdpbGwgY2F1c2UgdGhlIFBNRS4KPj4+Cj4+PiBUaGF0IG1lYW5zIHRoZXJlIGFyZSBvbmx5IDIg
dmFsaWQgY29uZmlndXJhdGlvbnM6Cj4+Pgo+Pj4gwqDCoMKgwqAxOiBCb3RoIGNvbnRyb2xsZXJz
IGVuYWJsZWQgdG8gcmVjZWl2ZSBJQklzCj4+PiDCoMKgwqDCoMKgwqDCoCBQQ0kgZGV2aWNlwqDC
oMKgIEQwCj4+PiDCoMKgwqDCoMKgwqDCoCBDb250cm9sbGVyIDHCoMKgwqAgRW5hYmxlZAo+Pj4g
wqDCoMKgwqDCoMKgwqAgQ29udHJvbGxlciAywqDCoMKgIEVuYWJsZWQKPj4+Cj4+PiDCoMKgwqDC
oDI6IEJvdGggY29udHJvbGxlcnMgZGlzYWJsZWQgdG8gZW5hYmxlIFBNRSB3YWtldXAKPj4+IMKg
wqDCoMKgwqDCoMKgIFBDSSBkZXZpY2XCoMKgwqAgRDNob3QKPj4+IMKgwqDCoMKgwqDCoMKgIENv
bnRyb2xsZXIgMcKgwqDCoCBEaXNhYmxlZAo+Pj4gwqDCoMKgwqDCoMKgwqAgQ29udHJvbGxlciAy
wqDCoMKgIERpc2FibGVkCj4+Pgo+Pj4gSG93ZXZlciwgcmVwcmVzZW50ZWQgYXMgcGxhdGZvcm0g
ZGV2aWNlcywgdGhlIDIgY29udHJvbGxlcnMKPj4+IHJ1bnRpbWUgc3VzcGVuZCBhbmQgcmVzdW1l
IGluZGVwZW5kZW50bHkgZnJvbSBlYWNoIG90aGVyLgo+Pj4gV2hlcmVhcyB0aGV5IGVmZmVjdGl2
ZWx5IG5lZWQgdG8gcnVudGltZSBzdXNwZW5kIChvciByZXN1bWUpCj4+PiBhdCB0aGUgc2FtZSB0
aW1lLgo+Pj4KPj4+IFRoZSBwcm9wb3NlZCBzb2x1dGlvbiBpcyBmb3IgdGhlIFBDSSBkcml2ZXIg
bWlwaS1pM2MtaGNpLXBjaQo+Pj4gdG8gdGFrZSBvdmVyIG1hbmFnaW5nIHJ1bnRpbWUgUE0gZm9y
IGJvdGggY29udHJvbGxlcnMsIGNhbGxpbmcKPj4+IGludG8gbWlwaS1pM2MtaGNpIHdoZW4gaXQg
aXMgc2FmZSB0byBkbyBzbywgdG8gc2F2ZS9yZXN0b3JlIHN0YXRlCj4+PiBhbmQgZGlzYWJsZS9l
bmFibGUgdGhlIGNvbnRyb2xsZXJzIG9uZSBhZnRlciB0aGUgb3RoZXIuCj4+Pgo+Pj4gQ3VycmVu
dCBzaXR1YXRpb24gKEkzQyBuZXh0IGJyYW5jaCk6Cj4+Pgo+Pj4gwqDCoMKgwqBQQ0kgZGV2aWNl
wqDCoMKgIFJ1bnRpbWUgUE0gZW5hYmxlZCwgZGVwZW5kZW50IG9uIGNoaWxkIGRldmljZXMKPj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUENJIHN1YnN5c3RlbSBjb250cm9scyBQQ0kgZGV2aWNl
IHBvd2VyIHN0YXRlCj4+Pgo+Pj4gwqDCoMKgwqBDb250cm9sbGVyIDHCoMKgwqAgUnVudGltZSBQ
TSBlbmFibGVkIHBsdXMgYXV0by1zdXNwZW5kCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEkz
QyBzdWJzeXN0ZW0gcnVudGltZSBQTSBnZXRzL3B1dHMgdGhlIFBsYXRmb3JtIGRldmljZQo+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBSdW50aW1lIHN1c3BlbmQ6IGRpc2FibGUgYW5kIHNhdmUg
c3RhdGUKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUnVudGltZSByZXN1bWU6IHJlc3RvcmUg
c3RhdGUgYW5kIGVuYWJsZQo+Pj4KPj4+IMKgwqDCoMKgQ29udHJvbGxlciAywqDCoMKgIFJ1bnRp
bWUgUE0gZW5hYmxlZCBwbHVzIGF1dG8tc3VzcGVuZAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBJM0Mgc3Vic3lzdGVtIHJ1bnRpbWUgUE0gZ2V0cy9wdXRzIHRoZSBQbGF0Zm9ybSBkZXZpY2UK
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUnVudGltZSBzdXNwZW5kOiBkaXNhYmxlIGFuZCBz
YXZlIHN0YXRlCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJ1bnRpbWUgcmVzdW1lOiByZXN0
b3JlIHN0YXRlIGFuZCBlbmFibGUKPj4+Cj4+PiBQcm9wb3NlZCAodGhpcyBwYXRjaCBzZXQpOgo+
Pj4KPj4+IMKgwqDCoMKgUENJIGRldmljZcKgwqDCoCBSdW50aW1lIFBNIGVuYWJsZWQgcGx1cyBh
dXRvLXN1c3BlbmQKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSTNDIHN1YnN5c3RlbSBydW50
aW1lIFBNIGdldHMvcHV0cyB0aGUgUENJIGRldmljZQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBGb3IgZWFjaCBjb250cm9sbGVyOgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IENhbGwgaW50byBtaXBpLWkzYy1oY2kgKHdoZW4gaXQgaXMgc2FmZSkKPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJ1bnRpbWUgc3VzcGVuZDogZGlzYWJsZSBhbmQg
c2F2ZSBzdGF0ZQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgUnVu
dGltZSByZXN1bWU6IHJlc3RvcmUgc3RhdGUgYW5kIGVuYWJsZQo+Pj4KPj4+IMKgwqDCoMKgQ29u
dHJvbGxlciAxwqDCoMKgIFJ1bnRpbWUgUE0gZGlzYWJsZWQKPj4+Cj4+PiDCoMKgwqDCoENvbnRy
b2xsZXIgMsKgwqDCoCBSdW50aW1lIFBNIGRpc2FibGVkCj4+IENvbnRyb2xsZXIgMS8yIGlzIGNo
aWxkIGRldmljZSBvZiBQQ0kgZGV2aWNlLgo+Pgo+PiBTbyBmaXJzdCBwYXRjaCAiaTNjOiBtYXN0
ZXI6IEFsbG93IGNvbnRyb2xsZXIgZHJpdmVycyB0byBzZWxlY3QgcnVudGltZSBQTSBkZXZpY2Ui
Cj4+IGlzIG5vdCBuZWNlc3NhcnkuCj4+Cj4+IFlvdSBjYW4gZW5hYmxlIGNvbnRyb2xsZXIgMSBh
bmQgMiBSdW50aW1lIFBNIHdpdGggZHVtbXkgb3BlcmF0aW9uLgo+Pgo+PiBXaGVuIGNvbnRyb2xs
ZXIgMSBydW4gdGltZSBzdXNwZW5kLCBwYXJlbnQgUENJIGRldmljZSB3aWxsIHJlZHVjZSByZWYg
Y291bnRlcgo+PiB3aGVuIGNvbnRyb2xsZXIgMiBydW4gdGltZSBzdXNwZW5kLCBwYXJlbnQgUENJ
IGRldmljZSB3aWxsIHJlZHVjZSByZWYgY291bnRlcgo+Pgo+PiBPbmx5IHJ1bnRpbWUgcG0gcmVm
ZXJlbmNlIGNvdW50ZXIgb2YgUENJIGRldmljZSBpcyAwLCBQQ0kgZGV2aWNlJ3MgcnVuIHRpbWUK
Pj4gc3VzcGVuZCB3aWxsIGJlIGNhbGxlZCwgeW91IGNhbiBkbyBhY3R1YWwgZGlzYWJsZSBhbmQg
c2F2ZSB3b3JrLgo+IAo+IFRoaXMgc291bmRzIHRvIG1lIGxpa2UgaXQgc2hvdWxkIHdvcmsuClNv
LCBsaWtlIHRoaXMsIHRoZW4/CgoJUENJIGRldmljZQlSdW50aW1lIFBNIGVuYWJsZWQKCQkJRm9y
IGVhY2ggY29udHJvbGxlcjoKCQkJCUNhbGwgaW50byBtaXBpLWkzYy1oY2kgKHdoZW4gaXQgaXMg
c2FmZSkKCQkJCQlSdW50aW1lIHN1c3BlbmQ6IGRpc2FibGUgYW5kIHNhdmUgc3RhdGUKCQkJCQlS
dW50aW1lIHJlc3VtZTogcmVzdG9yZSBzdGF0ZSBhbmQgZW5hYmxlCgoJQ29udHJvbGxlciAxCVJ1
bnRpbWUgUE0gZW5hYmxlZCBwbHVzIGF1dG8tc3VzcGVuZAoJCQlJM0Mgc3Vic3lzdGVtIHJ1bnRp
bWUgUE0gZ2V0cy9wdXRzIHRoZSBQbGF0Zm9ybSBkZXZpY2UKCQkJUnVudGltZSBzdXNwZW5kOiBk
b2VzIG5vdGhpbmcKCQkJUnVudGltZSByZXN1bWU6IGRvZXMgbm90aGluZwoKCUNvbnRyb2xsZXIg
MglSdW50aW1lIFBNIGVuYWJsZWQgcGx1cyBhdXRvLXN1c3BlbmQKCQkJSTNDIHN1YnN5c3RlbSBy
dW50aW1lIFBNIGdldHMvcHV0cyB0aGUgUGxhdGZvcm0gZGV2aWNlCgkJCVJ1bnRpbWUgc3VzcGVu
ZDogZG9lcyBub3RoaW5nCgkJCVJ1bnRpbWUgcmVzdW1lOiBkb2VzIG5vdGhpbmcKCgoKLS0gCmxp
bnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
