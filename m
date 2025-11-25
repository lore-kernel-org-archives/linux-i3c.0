Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98547D0E6E5
	for <linux-i3c@archiver.kernel.org>; Tue, 25 Nov 2025 14:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wVFsS/nN8QxUIukDDbliqBYw0V4eOHuP2018NxlA2Jc=; b=olmUCaTp0jhsp7YCwGhjCC/gCr
	0iL+c94Y4ldL3UuY1SQepKev6WfLDTHqVaTe18HWfBQmdLc17qdw9QuM/m0qw2iwJEiSpkekW7dbF
	/zmI3X1XvEoANzc0KaOEgjlOMtW8mpc1Um1zzVZRk1bx/T9373CHGoxV4jkEU3HpQr92o4t6Xr5Ki
	PWyMgUkBrJB7YCFkpIlN4aCb7xkiio55yT1ftv1tJ9URR/iA7NRBeh5huFK6htV2Tc9rY7niuOFQW
	Pk3zOaI8x5nFOmF/e+LrZnomwXs6Y2012QqlQjXJSPH1AN/p3LZwS7T28xyrqUfiLz9gr0ahWkvrv
	nF92RD3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtgH-0000000DP0X-1Rdr;
	Tue, 25 Nov 2025 14:06:09 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtgB-0000000DP00-0WJK
	for linux-i3c@lists.infradead.org;
	Tue, 25 Nov 2025 14:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764079563; x=1795615563;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+hElAZ1GQsiDFJIcFn1qzNQhR77Biwy6VWqB8FOuXe8=;
  b=a/a+GEYe/0Z2Q31mbBggJ3FsgNvt5YU+Oqlb8PYEYyox2Kg4BDZAmDsX
   B/2vvz06w95Jxbt9802KmAmZRZPbc9PUkPiwEN1GBYPKx4k//TNNeLys6
   G1bIsla6UCVn+2wGmTl4VFWVaUnDTpH8KhugXIcGPusMjB7VbeLNMjuDr
   TcH5GZN7eiZBg3Oa9jiZUwbFZUPRRlMAmJ0qr9zKYRZ0wkC8quwr5S4Jf
   KOP6j9EQ7/drUAXkE2iYUSPuysqja4b7q8Ua3/NZOat5MZdPRZSlJmoCg
   bu812tsNN32hI68DF+p5T8eoHMvj+dsxbaK+zwLEDQQKWvcqB9VJduWVQ
   A==;
X-CSE-ConnectionGUID: sYUUq49zQUmJ6Ut4PHYkBg==
X-CSE-MsgGUID: vrzevlBDQ1Cs7C5jM5FDUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76722375"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="76722375"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 06:06:02 -0800
X-CSE-ConnectionGUID: eJtLaqqqSF2CEqEwdIaQlg==
X-CSE-MsgGUID: cD7YWUUCQhuBLslzo6IRrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="191899564"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 06:06:01 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 06:06:01 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 06:06:01 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 06:06:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njbqkUtxXoypyCmQUOEwB42DIq3/sb7+R2PEWS/EocXrWo3DNc/QAIUy7KV4Q+kBQ13N/RXNmOKCY1/OKk2D5anw1RO+/S0PfiRNbSmpOb5XifTRMgCBYu2UJEBN8WUvhfJwc61Wp41Tn2xF9uR0jMn5QRTPGiHD4gonpUoNYJ8KnLic1GfQnQu5XU3XOgGCQgL1ArFYCL4UqRLwNxL7P4JD8yWHvM6gxW8jzFW7XVRX/knqI+PC8AwPhSxvUPV7DDYKt0VzrpITTOuFINj3ddmJIbU+fx7wTl7GCUWpl4AmvbGzQySGKb9f5+IeGrSbyua6r85OpMP3sSWXpPYKVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAF5ryiT6MnNhPEknqvKn6hrfvl5aTfF+9wwKzYQqYU=;
 b=fNf7B7owhoEjouc91UBuBbhaClnQvTeBpMtpHFUFcdhNc0PfSGe7ANttsqdLg5UfbY9WYETRKmZPSO3ESLxKfzxEmjhowulukS0aoFvhmNtt9Pf3OWC3kyHMgvK/CShnj33lPbPQ6mx418tyMvKRA5q4QF5FFoeMI5tkkH2SO1jRb5JR8Y4og5hySi/iDde81/b3jXiQhn3ofbMmW0evzpS0f+GH+dr+Ok6k+KPwOeh2gqKIWvjKr2utgVSnOvgDQWbfCU3F8seeUZDUHdUigOElczMp4OvsK7J/Epi2Pr1lNTo9LTH3hNuhhrW7viiHcuCUae1P4K89dZ1QwXf/tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SJ0PR11MB4975.namprd11.prod.outlook.com (2603:10b6:a03:2d0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 14:05:59 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%4]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 14:05:58 +0000
Message-ID: <a09b21bd-84b6-435e-b6e0-fe94c9e62f4a@intel.com>
Date: Tue, 25 Nov 2025 16:05:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] i3c: dw: Add sysfs support for Device NACK Retry
 count
To: "Ng, Adrian Ho Yin" <adrianhoyin.ng@altera.com>, Frank Li
	<Frank.li@nxp.com>
CC: <alexandre.belloni@bootlin.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <cover.1763747151.git.adrianhoyin.ng@altera.com>
 <a700d805a5f3a04791bb4516d6f67f6bd8a80616.1763747151.git.adrianhoyin.ng@altera.com>
 <aSSdEW4/WCpGxJ/o@lizhi-Precision-Tower-5810>
 <f5ff6901-ada5-47ce-822d-11aa35adabc9@altera.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <f5ff6901-ada5-47ce-822d-11aa35adabc9@altera.com>
X-ClientProxiedBy: DUZPR01CA0314.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::21) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SJ0PR11MB4975:EE_
X-MS-Office365-Filtering-Correlation-Id: 47606bde-d6fd-4a7b-d165-08de2c2bc207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXd1MTZ1VE16eERTR0NubnBJNUc1YkhwdVZwWkJ2NDJTNFIrVWwwdUtYV0VS?=
 =?utf-8?B?VUh1cVk2em5GcmFVL2plUUhySDU4L3RDSGRicDhQYVRUZTY4MldKUWQvVk1w?=
 =?utf-8?B?SWZ6OTIxVjAxV29VVDVKa0trVjJLVFU3NjZteUE0enJKQzJZOHhkeHFnVWww?=
 =?utf-8?B?dCtVenBTOFZWeVdMRWF1MFRSeklMOHB0WWlRRXM5SmtDek5Zekw5SnhDZkdv?=
 =?utf-8?B?VUNJQkdzKzNiWVBmNFpJZVgzVjZ4TlNIaUFEc1F3cWx6aldnM25RK2RSdmNU?=
 =?utf-8?B?QTFPU2xNUFEvUVBGYTNsTEtvR3hRMGZDdzBpMmg3ZG4yRFZkeG1sNHFnZkR5?=
 =?utf-8?B?SGRIRGlaMHJ2YUYyUXBYdklyRmlldFlJQm94MUNvRWdWbXZZbzZiNU02SWs2?=
 =?utf-8?B?VGNvOVE0OG40UDFxR0lJalI2WnhIem83Y0pjOXFQT0FnVDEzL1praVFla0FG?=
 =?utf-8?B?Wm5aRXFtaGFtSm9WOTBZZVZqZy9ZRXZvTktCSEF3TEJXcElqZUYyNzVlM3dM?=
 =?utf-8?B?UGVkTXdOUllPdHpxOUU1R3pwVENzN0JHQ3dJaktnV0poSXdlcFBMUVZwYkVw?=
 =?utf-8?B?a3IwRjdvUlV2ejErVmFtbmpIR25iVkQzUkxJZ2dVaHhibitPL0V5dy9EcFpi?=
 =?utf-8?B?R2I2NG81OFdET051VjF6ak5qYWtocVFYcEpKQ1VqVk1jeDRuYlF5SnlMNXRt?=
 =?utf-8?B?b0NtY052am9xc0QvTGhMTU1KbGIzbjY5aUIyL2EvUHJLN2hmZDRCajNPdFI0?=
 =?utf-8?B?VXBiTmFMNm1tckdhUW5va0k2WnJXN3F2a3NQc2xkc3pZdWFSUlQ1cTJsNm54?=
 =?utf-8?B?SFE0U0JvVjhNRU9QZzAydmg2NXBmVHE3Zk92QU1CbkFiS2hoRllRTmd0QVIy?=
 =?utf-8?B?M0JpNjZWNGo5L05GcnVtUy9WNytBdGhqb0lJT1Y0Nno3TUIwUnhFSlFpc0hH?=
 =?utf-8?B?dGtVRnhRY1pJYmE5Ym1uY1hCRDJ5d2NrU2JlOXluemZGYk43OWRzRTBZeFo4?=
 =?utf-8?B?bXVnc3ZNQ0NEeFFnQ0c3dUNTSmZFblQxby9Ra3ZSTVB3MGlFbXZDNVJRK3JZ?=
 =?utf-8?B?bHhOQkFtbVZSazFNSm1BazlFMWwyYjBIaEFpVGlHR3BCMFREQkRnV2QvaTFK?=
 =?utf-8?B?dE9jSFQ0ckpJOWV5c0dWY3IrZ3pVMXh6Y2pGSmZqYUt4ZWt5VGJISEx4cEQr?=
 =?utf-8?B?QUI4YzFxWGNwenpmRWNteUV0RHpTc1UrbkhSM0NSTVlhQ3Q5VzJBR1k0NVB6?=
 =?utf-8?B?RGhFcnJrMkZMQVEvMTBMZDdocjEwdFJQWVJNK21ndmp5Njh1QVFNbjJ2U0cr?=
 =?utf-8?B?blJ4a25ycHBoRWNuNmg5UWhmNGdnZ1lveEdiOTZXNzBZVVhHQ3Rlb2loWElU?=
 =?utf-8?B?S0U4R1FSbUpoczFYV0dkT3htcEpDKytPSXJ1dXFZbHhDSkpLQUQwYWlRNHZQ?=
 =?utf-8?B?VUsxWXlxY0NHUXJ0UUJVT3QyUEltWS9VTjM4WWV6cXhHM1hUZmhkTG1INXUz?=
 =?utf-8?B?UUV1L3NWVnJ0MEk5bVRCUzhNTDJ2eHg0WjBtaXVuS2FQUzUwTHJDQy8zVWl3?=
 =?utf-8?B?L3BDQVFSNDdtclk1UEMvWmREQVFpZDR2ajVNOXFWV3dNSlBZanExeFZrdWdD?=
 =?utf-8?B?b3ZTK0NKNUNYbUNkdUhDUTArVWxtSkU0emk5UTJESVQzY1B4RzJuWG9wWTAr?=
 =?utf-8?B?VEt6OEJEbGtzOWZLbVVCZ0hlRnR4YnlFVkZUWHA1MmlieVhaM0YwS2pUeCtD?=
 =?utf-8?B?N1hvdU1NT1dyMm9kOVlhbVN1ZERobGFYald3K3pIQlNMK21KMGdSVWNkK3lK?=
 =?utf-8?B?QnZkOWtjTEdwcmtWOUV6YWY1emljYmJLcFp1UmtESk1jMzVpNzVHS3B6bkpu?=
 =?utf-8?B?dytmY2svQ25ybzRhQWdaMGhOWjhWdGRPYVVBb2U0cSt2Qm5GaTczWWdVOVpJ?=
 =?utf-8?Q?LH77L+lhhDqjZ+frvkt2ADYcfTYEbFBU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjVNODdxVXZ2TnpJNU5LVURJTHlwUm1FTG1BSHFaSXQyVFFSUzZwVk4rMGZ2?=
 =?utf-8?B?ekZ2SDJyZmxTWHpVbjBIWVR6M3NGdUQ5RG9nYXFzbjFyc3REeTlGelpRWHBE?=
 =?utf-8?B?VUw3YUtaY1Z0bno0WHduOGZMSFkxdWpicm53d0c3MFJMek40NmVnWnk3emln?=
 =?utf-8?B?L0MvcTNSSFZsZVRUU3BTSiswV2RrMFY4UjFFeEtEWkFiSWNJY2QzMExSMDM3?=
 =?utf-8?B?VnJER1paRWw1bnZXbEVDVnhxSms5dXVaTmpzZGxMUVpHWjlXSmh0aEo2akVL?=
 =?utf-8?B?cGlVenk2RWd2UzdqZFVXaE9naDBWQjZmWm1SNUIzK3RGa1dpVjJQMHBDZ1RR?=
 =?utf-8?B?QzBwaENQb0FsWnplU2tlYks4aVh2ejN5U1d4NUFZUTNMVUM4YjBtem1lSGd0?=
 =?utf-8?B?MThZR1hSUkp6U0E4dHhISHNneFhETnZTOWRKYTg1THFSMys4VExZNmhqdzh3?=
 =?utf-8?B?Ump0OUJnbWlyQTdlWDBSQXFNdGFDd3BNWllUdGVaMUZ2bDdZV1hTNjNzZytm?=
 =?utf-8?B?OFVPSTJGRDBXbFdHdGI3Z1pTK0syZllGT0RXQWg1M1RITDJWTmRjaDNaY3cx?=
 =?utf-8?B?QmdvaUhERk5ENWttOVRoYVQ2U2NnMno3bmVnSDRwRUdldGhCNVpIL3QrWmxt?=
 =?utf-8?B?aDlEQzFLOW9uczMybkJOaU53UkJVeENwdFRiSG81U3dkeVlsSC9tS0dtWS9Q?=
 =?utf-8?B?WnNNbTJHelloMEwwY3NHbEhOMGxlcjQwQlRKU0R3QlBYRURXcmZkNE1Uc2pD?=
 =?utf-8?B?WnJNWTV4ck93eW1OaXcvbEZTaWUydlBWVXkxQmJkSWtESHk3d2JQSkEveENJ?=
 =?utf-8?B?TEFZSVZCdmVwY2ZOM2tlR2xvaStZdkFsaVVLcndFenJpTHRlL3BKaWpVSUtQ?=
 =?utf-8?B?MHNDZCtNemwwZ3djSzJuc0R3K3pzME9NdTVueHZpMnFDeDJOS2s5LzFuNjF1?=
 =?utf-8?B?NnZYWWhRLzJxYktlajFHQXlXZGRkdTVRWkUvc1ZjQ1dBaHg2TkdXYWpKVlB0?=
 =?utf-8?B?ZDdVWFVVK3ZpbzYxRU9iZG5wbUF0ci9qd3VJRkZXV3BhK0NlMS96WHpna3Ey?=
 =?utf-8?B?aEMxdFJwN0RETmZvelErMU11eTRrMVhkQ041d3FVR0w5ZXVhOFl2VHpGNWJr?=
 =?utf-8?B?QnhEQUV2SGt5TTVZSTg4cUxZODVCNURtWi9DZUlJQUIzQlFLWTlXV0F4eEQ1?=
 =?utf-8?B?MUtsakFpTFZvcU9QS1VoQ1FzQUxjT09hOGRaNGFhSko0ZFI2NnZRMDRXWVc5?=
 =?utf-8?B?QnVpVCs3L3lJZ3N0emhnTDM5UkJLWDVrdHZEakRwZ3pWOUJrSEZsdndSclFU?=
 =?utf-8?B?cHFwRWtLY3JYTDV0bUwzS0FLSG9iSGNYRFRpczVBTTdPWCs0bWcrSkZtbStO?=
 =?utf-8?B?a1ZRTXZKTXdsY1pHV2xjeTE4aGh1elg4c2FRZ0RpcG5tYUJkUm54SW1UMTF4?=
 =?utf-8?B?QUFxVUVCOW9sMFlxMWdZWHNsZ25ib094Z2l5Tkw1UVZxS2ZyUzZCU3NJUTNY?=
 =?utf-8?B?aDlUZ1JJcDlxMEdNQ2F4bGR1MzREamg0TnpISEFRK1IveTk4SGFkRHNGcXBH?=
 =?utf-8?B?YmhLTFNWc3VYK0NlVXBGWjNPR3VFcVhJcDNubmJKZ29zN1BUb1VmOU5vV1Ew?=
 =?utf-8?B?V3JrV240eGJBUE5CUFI0Zlovd2JaWlFRUDNIb3dsbXg5dEtackpSY2xld3B0?=
 =?utf-8?B?MmVMbktqY0ladHoxZ1NMeEMveWhrR0piSFpWeVY3K2Z6ZWJ3QWhDRitIWEJv?=
 =?utf-8?B?Qm1hQm1hYkQxbXBiRi9jYmlyQmlOdVgrWmdZempyUjNNYmFYWElCK3g0eTNt?=
 =?utf-8?B?YldlWnRNdmN6aDlSZ3I3UUlTWDNsYzd0WVVvWDdXUmF3SzdMYmsweTFVTS8w?=
 =?utf-8?B?S3BCb1RkZ1VXc1AyQW5iSXdaVHlmLytjUzFUOTA3aFJzM3lpZHpwVnlldmJk?=
 =?utf-8?B?Y09BNFBYeHJNNTBFeU5WSDMrRWZldmVGS3FOMTcxSTdQd0VLeG12bDFRaVRO?=
 =?utf-8?B?TURXVU9Cc2UyVlMzUTJzYTFnZ3JkdWFMb28wd3Z4Nk5sL2ZGd0U5Nk50LzNQ?=
 =?utf-8?B?RkZDTGFsd3psVmZxVk9IWjNuTDFzNGwyOGZ0dWNhbzY3QVREamlFUnoyZ1Jj?=
 =?utf-8?B?OEIxbWpBb05PbURmUUY2SDVzTUJKYTJFT1hVSzFad2tkL3dDd0RPRGVjYTEr?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 47606bde-d6fd-4a7b-d165-08de2c2bc207
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 14:05:58.8931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8r/xSoLJs7v3q4WIj8FPTD2RnhYjhDO5TMsGKLAbAB7AW3uUoyh3PAc8C9INcNp1nqsF3IZzsbmwRJAWXO2vzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4975
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_060603_206013_C4675339 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

T24gMjUvMTEvMjAyNSAwNToxOSwgTmcsIEFkcmlhbiBIbyBZaW4gd3JvdGU6Cj4gT24gMTEvMjUv
MjAyNSAxOjU5IEFNLCBGcmFuayBMaSB3cm90ZToKPiAKPj4+ICsKPj4+ICvCoMKgwqAgbWFzdGVy
LT5kZXZfbmFja19yZXRyeV9jbnQgPSB2YWw7Cj4+PiArCj4+PiArwqDCoMKgIHNwaW5fbG9ja19p
cnFzYXZlKCZtYXN0ZXItPmRldnNfbG9jaywgZmxhZ3MpOwo+Pgo+PiBJIHRoaW5rIHlvdSdkIGJl
dHRlciB0byBob2xkIGkzY19idXNfbWFpbnRlbmFuY2VfbG9jaygpIGxvY2sgdG8gbWFrZQo+PiBz
dXJlIG5vdCB0cmFuc2ZlciBvbiBnb2luZy4KPj4KPj4gRnJhbmsKPiBIaSBGcmFuawo+IAo+IGkz
Y19idXNfbWFpbnRlbmFuY2VfbG9jayBpcyBhIHN0YXRpYyBmdW5jdGlvbiBpbiBtYXN0ZXIuYy4g
U28gc2hvdWxkIGkgdXBkYXRlIGl0IGFuZCBleHBvc2UgYSBwdWJsaWMgaGVscGVyIHRvIHRha2Ug
dGhlIG1haW50ZW5hbmNlIGxvY2sgb3IgY29udGludWUgdXNpbmcgdGhlIGV4aXN0aW5nIHNwaW4g
bG9jayB0byBwcm90ZWN0IHRoZSBEQVQgdXBkYXRlcz8KPiAKPiBUaGFuayBZb3UKPiBBZHJpYW4K
Ck90aGVyIGNvbnRyb2xsZXJzIChlLmcuIE1JUEkgSTNDKSBzdXBwb3J0IGRldl9uYWNrX3JldHJ5
X2NudC4KClNlZW1zIHRvIG1lIHRoaXMgc2hvdWxkIGJlIGluIG1hc3Rlci5jIGFueXdheSwgc28g
aXQgY2FuIGJlIHNoYXJlZC4KCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWkzYwo=
