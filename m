Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FDED5B864
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Dec 2025 19:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8kdB3CfznR8LVmzRhBk2SvA33GDb+nQhuLqiCsYlKcc=; b=t4oRHPCEoYhGvc
	MxpGRdXigP54dK8P7QKrCb95Dt5oLClx0RBU0THOlnEMeld6d+fDWT9A/PUg29ChzVZIbHPA5wBfy
	FHFd9rPie++Lt6AgGpESfT0ODOd9Nk9+JqmQKwRygVV47wmCuMxIS8gAXK++8GyQyrqIZzzwbewtw
	ifE5K1Q5twWmH8m8ccu4F9XPs8p2DQMiSc8RU0obaVsalkIgGx4Y2Eu4dNn3b/D96k1ExV2Rls6+z
	P++5rv6UHifBhpg1q8oSHecg12XF/YswcXAxseANKUR/7jMd4cpib9OSc7U8Mf91H/X5VrxCkNOVI
	kqHL+8DiYY80RYKgRcPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVE4x-00000004AHk-0LqE;
	Mon, 15 Dec 2025 19:17:55 +0000
Received: from mail-northeuropeazon11010016.outbound.protection.outlook.com ([52.101.84.16] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVE4u-00000004AHI-0yij
	for linux-i3c@lists.infradead.org;
	Mon, 15 Dec 2025 19:17:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvGwS3NZ3/4XechIo60uGDgFpL203+qYAO9bDUlXxYH0pUad5eMmw/HhzE3Jqg9Ifjdq6UaV0rU9D7wbQ9dVZhRMPvoJ424yi2mAcSajVeBQFClmMd4idoLyvsnpcU5i1q81uAJ2pc18TeGuJ7xNWf0F4p9v3684UXVgwq3RpZJffdlZXdr2XtBw0MDymxM0uIY+p8kdsIiZPnSzN47x4rnlIDQuBwAooMldCh23kj3IbI8rZveKM8UAvmsfK4r5bszMrEMlO+q/MQg7eHkUcvGULjKE9Er5SmgV249h8+sURLL7xF6Wt6c30MenJwHIAhqFbKMBp7sbhSa1G+Oq+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yTC2o9jUFKxQVk0q5khB3aoJYF41HQgE25dKUGYT8KE=;
 b=Synh05OZNsInGkxx21xk9xd6oJ8Lbfn96ORSOowH3XzyuT65aRwl5GJvqN+NK6kTJHx6TttTzIufYWrp64n3qj1y+qr+rLGL9+kbfm+JeY4qQ3aMBS1MsN0iPS3UV+e0iiS02YlYH97DWT96on5igMiH1bLQVEZ+Hq2rMM0gFgZR7gKBhxFuzdK0Pjzt0HNT2nmv5J66KmFpnsqzpvpt33zU0oLWAoqlbIT8PiJaA13BGbgD7Z1gzNRJQxvynp0o1E4EjkrRY1zBQT1OfTeCZdYPIVj2piBjJJdrGtZKYLIO6NLTsXS4ngaagox7nVsEtSXqsvr2TzgJBD51jb57+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yTC2o9jUFKxQVk0q5khB3aoJYF41HQgE25dKUGYT8KE=;
 b=bUc7Sc/4mJr3mMwUTkn2mN027IElDxg3jTE5+HKpaZdtazpcJaG2Ei/DtDPwFpzRbHyNFHh/kc8D0zJeTz5BKC896wSiieB5hsR8PhMDtaVrz2iyIUaA2BGLqUSpxkzB8mJ0XXD6pGH9TcM2aKss1FFTBpuF4KVjhal7NR1cRYbgLyMz1Lu+nms0Ks9IbabYkN4+qnTjqec7rPNqsm9ODmo0y/ou+SOxFSWaobZIZoIdkLUFey2RKka6B6CbKxD8zTCG0kZvROgU+u+xTQQOuqlxHZ31O4/n0PXcFQk9xprMN/uReGgy7yIOttW9uMKrd+y/x0KvJf94n1mj2cwWgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DB9PR04MB8236.eurprd04.prod.outlook.com (2603:10a6:10:245::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 19:17:48 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 19:17:48 +0000
Date: Mon, 15 Dec 2025 14:17:41 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 06/10] i3c: mipi-i3c-hci-pci: Enable MSI support
Message-ID: <aUBe1SwQcURTkBaT@lizhi-Precision-Tower-5810>
References: <20251211134809.75872-1-adrian.hunter@intel.com>
 <20251211134809.75872-7-adrian.hunter@intel.com>
 <aTrl9BMsbwMBCN+L@lizhi-Precision-Tower-5810>
 <3d540915-508d-4548-b63a-cbdd9812d454@intel.com>
 <aTxTBmeSBPv25b2I@lizhi-Precision-Tower-5810>
 <96366268-572e-4a11-bc94-058d37db2418@intel.com>
 <aUBJG6GjX+z5y4AI@lizhi-Precision-Tower-5810>
 <339defb6-0fb2-418a-9f63-82e46c707f6d@intel.com>
Content-Disposition: inline
In-Reply-To: <339defb6-0fb2-418a-9f63-82e46c707f6d@intel.com>
X-ClientProxiedBy: BYAPR02CA0043.namprd02.prod.outlook.com
 (2603:10b6:a03:54::20) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DB9PR04MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: f9382054-2f05-4eda-edad-08de3c0ea237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|19092799006|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0dwVm1tcGJIbVQ0ZXlUNThYWlVVL1RreTVMdkliQUFabG4yR090cklNNTU0?=
 =?utf-8?B?NStnMTU2cHhMeE9icnFLaE5oWldEck9Yc2Q5UWpkMmQ0dERMZDNVVXRGYWlB?=
 =?utf-8?B?M1ltQURlajFPT0tQaGt5dWhXbDBscW9GWUlxT1AyZGUyZm9PNGt1VVV2T0JJ?=
 =?utf-8?B?SldhQ3hmU3EyNVdjOWM1UW5ZT1czaVdPSUxMQ3RMaktqNTBudDRGSy9QQzcy?=
 =?utf-8?B?VC9GZHd0VWN2bU12bE13ZXB5bWxsNFEyc0g4aGliSFQ5L093M1ZQTG5pRXNv?=
 =?utf-8?B?WmJVY2RQYWpwUk0wMHZhUkt2WnZiVWlWNlByL05aUytHV1pnTjBHUC9RQzlQ?=
 =?utf-8?B?ZjZRaG51RkNhSFJTT0pDUExKMGdBY3d4UDdQbVB3WWxRRndzR04rbkZ5NTk3?=
 =?utf-8?B?c3kxQnFkdmhIenZHNUp2T3czbWlaYnF4WTJnWmdVbGM4UWpneVRPMkhYVE1L?=
 =?utf-8?B?Umw0cTZBMDBEbzNjVmtobG95dnV6aWRvRC9Ra1ZKODkvUk5mU2d5blFpbGMz?=
 =?utf-8?B?Q1hmT25xSnVkMGZUUDUxYllycW53RjVUcWM4eGpUREp0Nzh1REtsZE9VSFVH?=
 =?utf-8?B?VlptY09MdjJTd2ZlNnl5Y21SeTB6ZEJpWE9TN3dMVnNPS3dJTURkaXdkbGZk?=
 =?utf-8?B?Rit5K0srWWRMRkJMTHZpRXpnT3NXSDhua1MvVmxUWlNJS1lDN2hHd2VIdFVi?=
 =?utf-8?B?L3JQTnVCMXhVNnhJbkdZM1ptdVpsbUZkYWI3ZEpqdm9PQUtKdkdwVWZhclhB?=
 =?utf-8?B?WlQyY2pxZ25CaXdkenhwaGFVbVo5aDlXUFdNWE9MTGpiVy9NZ1JOUk1BVHJO?=
 =?utf-8?B?bmlCdlg3V0E3bzNmSWVuOHNiRzhWZkJDS0pHTEF3em44a1RuQUxESDhKbERD?=
 =?utf-8?B?WFA5QWxCTWp3UXlQNkNFZmNMSm9KTmlOdVFPZDVNS1lBMUdsRmI3NGtzeGUx?=
 =?utf-8?B?R0RhNGp3Zm1zdGVZWWY0VHRCMUk0MWpqRjdUSkJZZFhnT3pzTFVGVzRZY0R6?=
 =?utf-8?B?UDh4V0hjcXNES1Vqd0xhMVRSSEpoZnJoYkJKbHl2NFpZc2prUjBVV0J2UFpG?=
 =?utf-8?B?bk5WaXFjbHMvakdkWnIvdk9KajZ5ZVczYlFRVHpqcHVxckFYZTBmQUhPZ2JT?=
 =?utf-8?B?bVZkdVR5emNBb05pdjhoeTVmdWk5VGhXakg3eExqR0xGbENvRUhmTnJkSmph?=
 =?utf-8?B?VTJPemlCUzV1TVR5NHFFV3RpLzljUUhLelc1NWsxV3FvQ1dyZXBUU1UrLy9N?=
 =?utf-8?B?K2N0cGdvelQwL00xZ2dJc3NnSmR4L1RkZkZmMU9hTDB4OUI2ZFMvdTRDTG5j?=
 =?utf-8?B?SkJHN1ZpVGZPT214OVpBVG50dng1THBKZFBFb3IzWUhBT0lZOUtJZXJYRlgx?=
 =?utf-8?B?SjM1RjBTcnpkRDhzYlV0anBaYzZ1SDB2R29TcXMwRmJjY2loaTU2WHpIYmFN?=
 =?utf-8?B?Rkd6V3lHV0xiSVRRN1A5WkEwcHJsT0ZTWkwrTG5ZUVZJSW5SYllHcDB0b2tT?=
 =?utf-8?B?SURmMEdUQ3JIVVpWbmxqRjdWU3NmWDNtOUhzM09OWHdkWDEycjdyL2V0WWtE?=
 =?utf-8?B?Qis5RWJYY0pmNEljYXJ1L1R4K1hjM1BmcXRUMU5Kc1FyZ2ExeTI3cnU4V3ZF?=
 =?utf-8?B?S2cyNWhsYzMwQi9BK2xWR3NUbGV6dEpwWDJrYklac3pVbmVJVHJCUTc4VlA3?=
 =?utf-8?B?Q3ZtZzNTZE9ZRXZPbG84YjJteUMvaHMydUFhVUZnWlZ0SW5ROVdVOEdibE9J?=
 =?utf-8?B?UXZDbjZZRG1ibS9oelhwTTRJZ1FuQ0RiUDF4R1p5YnZMYk1ZTWlUM3Nudm9U?=
 =?utf-8?B?ZjhhbHpFdUgyanE5LzFzVEFQbjk4NmQxaEJ2eVd6eXBOdVk3R2IzVnJwSXVa?=
 =?utf-8?B?ZUlKVW92eW5QUXErU2hKcUx1TXlTdlV0MFRpUEpVWGRPeGczV2c1SWxSQ2tX?=
 =?utf-8?B?SGNUY2JPMng2MVdzei9LVklmejFJQ01UZEtsT2VhajZob2w4WG1nVXlHWE5M?=
 =?utf-8?B?Q045d3VBdy93PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(19092799006)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUI3cXZYZDZHRkY2ZVJFcGllaUp0TmY5UERQNXB0Q2E4NlI0eDdHVVNhaUVG?=
 =?utf-8?B?dy9WVWNuQmVMRDR6d1dOQUpXN01oV2cza3NwcE5yUUh3cUFUaEVaV2xOUjBl?=
 =?utf-8?B?Rm1sNTl3UndIcWxPaGNzWGNMSUJndGhWeVJ5WUJCckZpMi92V0NZNE04dlR5?=
 =?utf-8?B?cTYyV05uM0p0Z2dYK3N4RkNGUjNTY2V3TFVtQUZERjJDL3hiY0J4Um9iT3l4?=
 =?utf-8?B?NnhtOGlndG5TWTR4UU5RWERFKy84WkhsQ2pmNXRBbDkwaW51bkVKdTQ4TS9M?=
 =?utf-8?B?ZWlsMEhOSEZxN08ra2k0RHUzT3AyQWxVVUFkQUNIQ05YNVFaaXNBbTEyc3RN?=
 =?utf-8?B?Wml6WS8zM0V1TFhKU2JNZG8xMjF6VFhySVdrL2JlQUJ5N0liZmxJN3lGNE1h?=
 =?utf-8?B?Ty9qR3RleVZZZEptb3d5Z0hjeUR4czFyYmZYLzVubEpWUU5PWFpZVzRGbXBZ?=
 =?utf-8?B?UTNYRWFxT2JqZHEvYUVaOTZVMEdjU2JSWURWeFpXRFFZVmZRSFhXTUlGSmgx?=
 =?utf-8?B?U1VMSkc0RGJHM3ZLUkh4TFBEelU0UndJdFV0d3NBeWx5M2dVRDR1aG1LZEE3?=
 =?utf-8?B?b0V5ZEVKYmdjVXVhanR4SGlGZ0FESDRxdWNRQTFuNHRzVm9VSXJyR3BEemFC?=
 =?utf-8?B?bWgrdXJyQ25zYkh2enBGcTdPQTlaOGVXZ2NNbWJvck96aU9NV2svQ3dhK1Jp?=
 =?utf-8?B?TjFPSzBISlBUUkNZQ3I4ek1SZ2NiZTkxb21pU0F1SC9hYUNGN2t0c0JUdFg4?=
 =?utf-8?B?TEZSTk5jMXVjWnFENERpc2xDVEtSRWJRTU0yM1c0NndvZkowTnBtbDVQUllS?=
 =?utf-8?B?bUI5QjV1SzdMVDRYdDdyM2ZxbVVaby9NWXgzTG05Y0VIL01IbGF1cnI0K0Va?=
 =?utf-8?B?ZWM1a3FTOW5TbnVSR0FiMWNFbUVDUnNJbERDblRoVEtIbVRBMXI1b2dxQ3pa?=
 =?utf-8?B?UllVNjVXVjZjcEJjOG95MktvZHUvc01BWFZvelRIRWx2Sy9ZMExHSG1heFFG?=
 =?utf-8?B?Ni9Gc251YVFVcjhuWUFPY1cwTVJhSlhoRTBENFZTRWRhZmpKSEIxWWk5T2o5?=
 =?utf-8?B?S2RPL2Q2eWU2UWlweGNlTXIyREhJemQ4d0U2TFhTZVc2Q2pIdTBoM2pNbWpR?=
 =?utf-8?B?MGdZY3QxME5wOFhTSmhuR3p2eStUbndaYmt5eG52NjJjVzQ0N3Vrb29PbU5P?=
 =?utf-8?B?OCtodW1VMzJLdXlYTlUwRThZRm5BZTlUOEJ4cDdyZ2FpWXREcG9qVzNIRFNE?=
 =?utf-8?B?ditzT2NZc2lWb1daVk5MN3Zld0FxMU0vNWZtZVNpQUhSWjZYVHVkUGUyRVAx?=
 =?utf-8?B?QjZRajd2OGpUYkgyMFJCcm9ueXFhaHBGQkRra2QrZ1czbGpXQlp3cTNpTEJa?=
 =?utf-8?B?OUNxMmlSYS9kR1lYWS9qS3IxZzV1ZTdvaU5SZXYwTWhHdmVrTWhVaHZSZEk4?=
 =?utf-8?B?Z3F1cXFqc0xZcGR3OEprdnkvYUxXek5tN0NVWU1QQUE1U1lJNWdXM3ZoNWt2?=
 =?utf-8?B?bUJRTUd6TnYyZG05clhWY3RqRUJFUitVRm1FUWZLOUhSSGNXUFdwSkJBUldP?=
 =?utf-8?B?OVUvazkrWEQ1bVlLMFphM3dNb0E4Y3VTWkpKZjVtb0Q3NE1tVWZIdHBjcDg1?=
 =?utf-8?B?UTZqNWNJQU9IbzBFRjI1WGhoYS83dng4cVNBYWt3dW9odXVYdTBhKzQyS1Y5?=
 =?utf-8?B?Z3JXWU1Td0wxbzdLZllmOVRMQjBiU1BTSys0dEluTzVONTFwbGJGakZDWnFh?=
 =?utf-8?B?ZTkvZ2k1YnF4M09HTWhYVWZVLzlOWVdxVFpLQXhQOXE2MzlVMFRXZ2FONnVK?=
 =?utf-8?B?VE5qa1VPL0p2eElTTS95NWxlWmtGOGRRcHZES0N1bkY1MXpoVE5tVGNRd056?=
 =?utf-8?B?c3RtOHdMVGVFS09BN1NQM3kxTVdubGNpZFR1dW1SSlV1K0JtS2YyZlJRaFky?=
 =?utf-8?B?Zk4xTDdIK29MTmNCajdKc1J5YkVrM1hweG9PQnNkRUZ0S2FQNHlmNDljTnUr?=
 =?utf-8?B?dXhRSmhDUG5DSGVJNnd2dkhlNmo4M3lMRHFod0I0RUw2SEk1MGkrK0JPUW9j?=
 =?utf-8?B?N2VjcVhxUWpMMENvUGhGcHNoeUhGcnJlcVkwazFVclk3dkt3dDNPeitONzNN?=
 =?utf-8?Q?5lla00KIzRLZSPPntmnRcimuP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9382054-2f05-4eda-edad-08de3c0ea237
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 19:17:48.3689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U43oJJp48FGGKDe/Kfmo/6BWE1M/o7FOwk6mzh7715n8jT2t3r43o4J8Uh2IpbcCLBzo6JJfG/MtQkAp60SYCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_111752_426097_4EB869CE 
X-CRM114-Status: GOOD (  31.33  )
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

T24gTW9uLCBEZWMgMTUsIDIwMjUgYXQgMDg6MTk6MTBQTSArMDIwMCwgQWRyaWFuIEh1bnRlciB3
cm90ZToKPiBPbiAxNS8xMi8yMDI1IDE5OjQ0LCBGcmFuayBMaSB3cm90ZToKPiA+IE9uIE1vbiwg
RGVjIDE1LCAyMDI1IGF0IDA3OjI2OjU1UE0gKzAyMDAsIEFkcmlhbiBIdW50ZXIgd3JvdGU6Cj4g
Pj4gT24gMTIvMTIvMjAyNSAxOTozOCwgRnJhbmsgTGkgd3JvdGU6Cj4gPj4+IE9uIFRodSwgRGVj
IDExLCAyMDI1IGF0IDA2OjE5OjU2UE0gKzAyMDAsIEFkcmlhbiBIdW50ZXIgd3JvdGU6Cj4gPj4+
PiBPbiAxMS8xMi8yMDI1IDE3OjQwLCBGcmFuayBMaSB3cm90ZToKPiA+Pj4+PiBPbiBUaHUsIERl
YyAxMSwgMjAyNSBhdCAwMzo0ODowNVBNICswMjAwLCBBZHJpYW4gSHVudGVyIHdyb3RlOgo+ID4+
Pj4+PiBVc2UgcGNpX2FsbG9jX2lycV92ZWN0b3JzKCkgdG8gc3VwcG9ydCBhbGwgSVJRIHR5cGVz
LiAgRG8gbm90IGNhbGwKPiA+Pj4+Pj4gcGNpX2ZyZWVfaXJxX3ZlY3RvcnMoKSBiZWNhdXNlIGl0
IGlzIHVubmVjZXNzYXJ5IHdoZW4gdGhlIGRldmljZSBpcwo+ID4+Pj4+PiBtYW5hZ2VkIGR1ZSB0
byB0aGUgdXNlIG9mIHBjaW1fZW5hYmxlX2RldmljZSgpLgo+ID4+Pj4+Cj4gPj4+Pj4gcGNpbV9l
bmFibGVfZGV2aWNlKCkgYWRkIGFjdGlvbiBwY2ltX2Rpc2FibGVfZGV2aWNlKCksIEkgaGF2ZSBu
b3Qgc2VlCj4gPj4+Pj4gcGNpX2ZyZWVfaXJxX3ZlY3RvcnMoKSBpbiBwY2ltX2Rpc2FibGVfZGV2
aWNlKCkuCj4gPj4+Pj4KPiA+Pj4+PiBDYW4geW91IHRlbGwgbWUgd2hlcmUgY2FsbCBwY2lfZnJl
ZV9pcnFfdmVjdG9ycz8KPiA+Pj4+Cj4gPj4+PiBwY2lfYWxsb2NfaXJxX3ZlY3RvcnMoKQo+ID4+
Pj4gCXBjaV9hbGxvY19pcnFfdmVjdG9yc19hZmZpbml0eSgpCj4gPj4+PiAJCV9fcGNpX2VuYWJs
ZV9tc2l4X3JhbmdlKCkKPiA+Pj4+IAkJCXBjaV9zZXR1cF9tc2lfY29udGV4dCgpCj4gPj4+PiAJ
CQkJcGNpbV9zZXR1cF9tc2lfcmVsZWFzZSgpCj4gPj4+PiAJCQkJCWRldm1fYWRkX2FjdGlvbihw
Y2ltX21zaV9yZWxlYXNlKQo+ID4+Pj4gCQkJCQkJCToKPiA+Pj4+IAkJCQkJCQlwY2lfZnJlZV9p
cnFfdmVjdG9ycygpCj4gPj4+PiAJCV9fcGNpX2VuYWJsZV9tc2lfcmFuZ2UoKQo+ID4+Pj4gCQkJ
cGNpX3NldHVwX21zaV9jb250ZXh0KCkKPiA+Pj4KPiA+Pj4gT2theSwgaXQgc2hvdWxkIGJlIHRo
YXQgcGNpX2FsbG9jX2lycV92ZWN0b3JzKCkgcHJvdmlkZSBhdXRvIGZyZWUuIG5vdAo+ID4+PiBi
ZWNhdXNlIHBjaW1fZW5hYmxlX2RldmljZSgpPwo+ID4+Cj4gPj4gTm8sIGl0IGlzIGNvbmRpdGlv
bmFsIG9uIHBjaV9pc19tYW5hZ2VkKGRldikgd2hpY2ggaXMgdHJ1ZSBpZgo+ID4+IHBjaW1fZW5h
YmxlX2RldmljZSgpIGhhcyBiZWVuIHVzZWQuCj4gPgo+ID4gSSBoYXZlIG5vdCBmb3VuZCBhbnkg
ZG9jdW1lbnQgc2FpZCB0aGF0LAo+ID4KPiA+ICAqIE1hbmFnZWQgcGNpX2VuYWJsZV9kZXZpY2Uo
KS4gRGV2aWNlIHdpbGwgYXV0b21hdGljYWxseSBiZSBkaXNhYmxlZCBvbgo+ID4gICogZHJpdmVy
IGRldGFjaC4KPiA+Cj4gPiB3aGljaCBoYXZlIG5vdCBtZW50aW9uZWQgdGhhdCBpdCBhbHNvIGNv
bnRyb2xsZXIgZnJlZSBpcnFzLgo+Cj4gSXQgaXMgbm90IGEgc2VjcmV0OgoKQWdyZWUsIGl0IG1h
eSB3ZWxsIGtub3duIGJ5IHNvbWVvbmVzLiBCdXQgaXQgaXMgbm90IG9idmlvdXMgZnJvbQpkZXNj
cmlwdGlvbiBhbmQgZnVuY3Rpb24gbmFtZS4KCklkZWFsbHkgY3JlYXRlIHBhdGNoIHRvIHVwZGF0
ZSBkb2N1bWVudCwgb2YgY291cnNlLCBpdCBzaG91bGQgc2VwYXJhdGUKd29ya3MuCgo+Cj4gY29t
bWl0IDU5ODJhNTM5Y2RjZWRjZjFhODc3MDljMDExMjVlMTU5NmVlZTJjOWEKPiBBdXRob3I6IFNh
bGFoIFRyaWtpIDxzYWxhaC50cmlraUBnbWFpbC5jb20+Cj4gRGF0ZTogICBTYXQgSnVsIDE5IDA3
OjMzOjM2IDIwMjUgKzAxMDAKPgo+ICAgICBhY2NlbC9hbWR4ZG5hOiBEZWxldGUgcGNpX2ZyZWVf
aXJxX3ZlY3RvcnMoKQo+Cj4gICAgIFRoZSBkZXZpY2UgaXMgbWFuYWdlZCBzbyBwY2lfZnJlZV9p
cnFfdmVjdG9ycygpIGlzIGNhbGxlZCBhdXRvbWF0aWNhbGx5Cj4gICAgIG5vIG5lZWQgdG8gZG8g
aXQgbWFudWFsbHkuCj4KPiAgICAgUmV2aWV3ZWQtYnk6IEphY2VrIExhd3J5bm93aWN6IDxqYWNl
ay5sYXdyeW5vd2ljekBsaW51eC5pbnRlbC5jb20+Cj4gICAgIFNpZ25lZC1vZmYtYnk6IFNhbGFo
IFRyaWtpIDxzYWxhaC50cmlraUBnbWFpbC5jb20+Cj4gICAgIFNpZ25lZC1vZmYtYnk6IExpemhp
IEhvdSA8bGl6aGkuaG91QGFtZC5jb20+Cj4gICAgIExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvYUhzOFFBZlVsRmVOcDdxTEBwYwo+Cj4gY29tbWl0IDYwNGY3ZTc3NzdkNjYzMDMzMDYz
ODg2YjZhNTM2MmQwZTYwOTJlM2EKPiBBdXRob3I6IE1pY2hhxYIgV2luaWFyc2tpIDxtaWNoYWwu
d2luaWFyc2tpQGludGVsLmNvbT4KPiBEYXRlOiAgIFdlZCBOb3YgMjkgMjI6NDQ6NTkgMjAyMyAr
MDEwMAo+Cj4gICAgIGRybS94ZS9pcnE6IERvbid0IGNhbGwgcGNpX2ZyZWVfaXJxX3ZlY3RvcnMK
Pgo+ICAgICBGb3IgZGV2cmVzIG1hbmFnZWQgZGV2aWNlcywgcGNpX2FsbG9jX2lycV92ZWN0b3Jz
IGlzIGFsc28gbWFuYWdlZCAoc2VlCj4gICAgIHBjaV9zZXR1cF9tc2lfY29udGV4dCBmb3IgcmVm
ZXJlbmNlKS4KCkkgcHJlZmVyIHVzZSB0aGlzIHNlbnRlbmNlIGF0IHlvdXIgY29tbWl0IG1lc3Nh
Z2UuCgpGcmFuawoKPiAgICAgUENJIGRldmljZSB1c2VkIGJ5IFhlIGlzIGRldnJlcyBtYW5hZ2Vk
IChpdCB3YXMgZW5hYmxlZCB3aXRoCj4gICAgIHBjaW1fZW5hYmxlX2RldmljZSksIHdoaWNoIG1l
YW5zIHRoYXQgY2FsbHMgdG8gcGNpX2ZyZWVfaXJxX3ZlY3RvcnMgYXJlCj4gICAgIHJlZHVuZGFu
dCBhbmQgY2FuIGJlIHNhZmVseSByZW1vdmVkLgo+Cj4gICAgIFNpZ25lZC1vZmYtYnk6IE1pY2hh
xYIgV2luaWFyc2tpIDxtaWNoYWwud2luaWFyc2tpQGludGVsLmNvbT4KPiAgICAgUmV2aWV3ZWQt
Ynk6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+Cj4gICAgIExpbms6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzExMjkyMTQ1MDkuMTE3NDExNi00LW1pY2hhbC53
aW5pYXJza2lAaW50ZWwuY29tCj4gICAgIFNpZ25lZC1vZmYtYnk6IFJvZHJpZ28gVml2aSA8cm9k
cmlnby52aXZpQGludGVsLmNvbT4KPgo+IGNvbW1pdCBhMjY0Y2VlMzFmMTNhZTNiOGQzMmIzZTUz
Nzc0NzU5YWZhNTUzNjFlCj4gQXV0aG9yOiBTcmluaXZhcyBQYW5kcnV2YWRhIDxzcmluaXZhcy5w
YW5kcnV2YWRhQGxpbnV4LmludGVsLmNvbT4KPiBEYXRlOiAgIFdlZCBKdW4gMTkgMTA6MjE6MDcg
MjAyNCAtMDcwMAo+Cj4gICAgIHRoZXJtYWw6IGludGVsOiBpbnQzNDB4OiBSZW1vdmUgdW5uZWNl
c3NhcnkgY2FsbHMgdG8gZnJlZSBpcnEKPgo+ICAgICBSZW1vdmUgY2FsbHMgdG8gZGV2bV9mcmVl
X2lycSgpIGFuZCBwY2lfZnJlZV9pcnFfdmVjdG9ycygpLgo+ICAgICBUaGV5IHdpbGwgYmUgY2Fs
bGVkIG9uIGRyaXZlciByZWxlYXNlIGFueXdheS4KPgo+ICAgICBTaWduZWQtb2ZmLWJ5OiBTcmlu
aXZhcyBQYW5kcnV2YWRhIDxzcmluaXZhcy5wYW5kcnV2YWRhQGxpbnV4LmludGVsLmNvbT4KPiAg
ICAgTGluazogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5rLzIwMjQwNjE5MTcyMTA5LjQ5NzYzOS0y
LXNyaW5pdmFzLnBhbmRydXZhZGFAbGludXguaW50ZWwuY29tCj4gICAgIFNpZ25lZC1vZmYtYnk6
IFJhZmFlbCBKLiBXeXNvY2tpIDxyYWZhZWwuai53eXNvY2tpQGludGVsLmNvbT4KPgo+IGNvbW1p
dCA1ZTc0YTRiM2VjMTgxNmUzYmJmZDcxNWQ0NmFlMjlkMjUwODA3OWNiCj4gQXV0aG9yOiBDaHJp
c3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPgo+IERhdGU6ICAg
U3VuIEp1biA1IDIyOjUwOjQ4IDIwMjIgKzAyMDAKPgo+ICAgICBzdG1tYWM6IGludGVsOiBGaXgg
YW4gZXJyb3IgaGFuZGxpbmcgcGF0aCBpbiBpbnRlbF9ldGhfcGNpX3Byb2JlKCkKPgo+ICAgICBX
aGVuIHRoZSBtYW5hZ2VkIEFQSSBpcyB1c2VkLCB0aGVyZSBpcyBubyBuZWVkIHRvIGV4cGxpY2l0
bHkgY2FsbAo+ICAgICBwY2lfZnJlZV9pcnFfdmVjdG9ycygpLgo+Cj4gICAgIFRoaXMgbG9va3Mg
dG8gYmUgYSBsZWZ0LW92ZXIgZnJvbSB0aGUgY29tbWl0IGluIHRoZSBGaXhlcyB0YWcuIE9ubHkg
dGhlCj4gICAgIC5yZW1vdmUoKSBmdW5jdGlvbiBoYWQgYmVlbiB1cGRhdGVkLgo+Cj4gICAgIFNv
IHJlbW92ZSB0aGlzIHVudXNlZCBmdW5jdGlvbiBjYWxsIGFuZCB1cGRhdGUgZ290byBsYWJlbCBh
Y2NvcmRpbmdseS4KPgo+ICAgICBGaXhlczogOGFjY2M0Njc3NThlICgic3RtbWFjOiBpbnRlbDog
dXNlIG1hbmFnZWQgUENJIGZ1bmN0aW9uIG9uIHByb2JlIGFuZCByZXN1bWUiKQo+ICAgICBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9v
LmZyPgo+ICAgICBSZXZpZXdlZC1ieTogV29uZyBWZWUgS2hlZSA8dmVlLmtoZWUud29uZ0BsaW51
eC5pbnRlbC5jb20+Cj4gICAgIExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMWFjOWI2
Nzg3YjBkYjgzYjAwOTU3MTE4ODJjNTVjNzdjOGVhOGRhMC4xNjU0NDYyMjQxLmdpdC5jaHJpc3Rv
cGhlLmphaWxsZXRAd2FuYWRvby5mcgo+ICAgICBTaWduZWQtb2ZmLWJ5OiBQYW9sbyBBYmVuaSA8
cGFiZW5pQHJlZGhhdC5jb20+Cj4KPgo+ID4KPiA+IEkgc3VnZ2VzdCBjb21taXQgbWVzc2FnZSBk
ZXNjcmlwdCB3aG9sZSBzdG9yeSBvciBjaGFuZ2UgUENJJ3MgZG9jdW1lbnQKPiA+IHRvIGRlc2Ny
aXB0IGl0IGNsZWFybHkuIEkgdGhpbmsgb3RoZXIgcGVyc29uIHNob3VsZCBoYXZlIHNpbWlsYXIg
cXVlc3Rpb24KPiA+IGlmIGhlIGhhdmUgbm90IGNsb3NlbHkgZm9sbG93IFBDSSdzIGNoYW5nZSBh
bmQgZ28gdGhyb3VnaCBQQ0kgY29kZXMuCj4gPgo+ID4gRnJhbmsKPiA+Cj4gPj4KPiA+Pj4KPiA+
Pj4gVGhlIGJlbG93IHN0YXRlbWVudCBzaG91bGQgYmUgd3JvbmcuCj4gPj4+Cj4gPj4+ICJEbyBu
b3QgY2FsbCBwY2lfZnJlZV9pcnFfdmVjdG9ycygpIGJlY2F1c2UgaXQgaXMgdW5uZWNlc3Nhcnkg
d2hlbiB0aGUgZGV2aWNlIGlzCj4gPj4+IG1hbmFnZWQgZHVlIHRvIHRoZSB1c2Ugb2YgcGNpbV9l
bmFibGVfZGV2aWNlKCkuIgo+ID4+Pgo+ID4+PiBGcmFuawo+ID4+Pj4KPiA+Pj4+Pgo+ID4+Pj4+
IEFuZCBtb3ZlIHRoZXNlIHNtYWxsIHBhdGNoIGFoZWFkIGluIHNlcmlzZS4KPiA+Pj4+Pgo+ID4+
Pj4+IEZyYW5rCj4gPj4+Pj4+Cj4gPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBIdW50ZXIg
PGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPgo+ID4+Pj4+PiAtLS0KPiA+Pj4+Pj4KPiA+Pj4+Pj4K
PiA+Pj4+Pj4gQ2hhbmdlcyBpbiBWMjoKPiA+Pj4+Pj4gCU5ldyBwYXRjaCBzcGxpdCBmcm9tICJp
M2M6IG1pcGktaTNjLWhjaS1wY2k6IEFkZCBzdXBwb3J0IGZvcgo+ID4+Pj4+PiAJTXVsdGktQnVz
IEluc3RhbmNlcyIKPiA+Pj4+Pj4KPiA+Pj4+Pj4KPiA+Pj4+Pj4gIGRyaXZlcnMvaTNjL21hc3Rl
ci9taXBpLWkzYy1oY2kvbWlwaS1pM2MtaGNpLXBjaS5jIHwgOCArKysrKystLQo+ID4+Pj4+PiAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Pj4+Pj4K
PiA+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvbWlw
aS1pM2MtaGNpLXBjaS5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9taXBpLWkz
Yy1oY2ktcGNpLmMKPiA+Pj4+Pj4gaW5kZXggOGFkZTkxMWUzODM1Li4wZmQzNTg3NjcxZTEgMTAw
NjQ0Cj4gPj4+Pj4+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvbWlwaS1p
M2MtaGNpLXBjaS5jCj4gPj4+Pj4+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1o
Y2kvbWlwaS1pM2MtaGNpLXBjaS5jCj4gPj4+Pj4+IEBAIC0yMDMsNiArMjAzLDEwIEBAIHN0YXRp
YyBpbnQgbWlwaV9pM2NfaGNpX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGNpLAo+ID4+Pj4+
Pgo+ID4+Pj4+PiAgCXBjaV9zZXRfbWFzdGVyKHBjaSk7Cj4gPj4+Pj4+Cj4gPj4+Pj4+ICsJcmV0
ID0gcGNpX2FsbG9jX2lycV92ZWN0b3JzKHBjaSwgMSwgMSwgUENJX0lSUV9BTExfVFlQRVMpOwo+
ID4+Pj4+PiArCWlmIChyZXQgPCAwKQo+ID4+Pj4+PiArCQlyZXR1cm4gcmV0Owo+ID4+Pj4+PiAr
Cj4gPj4+Pj4+ICAJbWVtc2V0KCZyZXMsIDAsIHNpemVvZihyZXMpKTsKPiA+Pj4+Pj4KPiA+Pj4+
Pj4gIAlyZXNbMF0uZmxhZ3MgPSBJT1JFU09VUkNFX01FTTsKPiA+Pj4+Pj4gQEAgLTIxMCw4ICsy
MTQsOCBAQCBzdGF0aWMgaW50IG1pcGlfaTNjX2hjaV9wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYg
KnBjaSwKPiA+Pj4+Pj4gIAlyZXNbMF0uZW5kID0gcGNpX3Jlc291cmNlX2VuZChwY2ksIDApOwo+
ID4+Pj4+Pgo+ID4+Pj4+PiAgCXJlc1sxXS5mbGFncyA9IElPUkVTT1VSQ0VfSVJROwo+ID4+Pj4+
PiAtCXJlc1sxXS5zdGFydCA9IHBjaS0+aXJxOwo+ID4+Pj4+PiAtCXJlc1sxXS5lbmQgPSBwY2kt
PmlycTsKPiA+Pj4+Pj4gKwlyZXNbMV0uc3RhcnQgPSBwY2lfaXJxX3ZlY3RvcihoY2ktPnBjaSwg
MCk7Cj4gPj4+Pj4+ICsJcmVzWzFdLmVuZCA9IHJlc1sxXS5zdGFydDsKPiA+Pj4+Pj4KPiA+Pj4+
Pj4gIAlkZXZfaWQgPSBpZGFfYWxsb2MoJm1pcGlfaTNjX2hjaV9wY2lfaWRhLCBHRlBfS0VSTkVM
KTsKPiA+Pj4+Pj4gIAlpZiAoZGV2X2lkIDwgMCkKPiA+Pj4+Pj4gLS0KPiA+Pj4+Pj4gMi41MS4w
Cj4gPj4+Pj4+Cj4gPj4+Pj4+Cj4gPj4+Pj4+IC0tCj4gPj4+Pj4+IGxpbnV4LWkzYyBtYWlsaW5n
IGxpc3QKPiA+Pj4+Pj4gbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+Pj4+Pj4gaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MKPiA+Pj4+
Cj4gPj4+Pgo+ID4+Pj4gLS0KPiA+Pj4+IGxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKPiA+Pj4+IGxp
bnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gPj4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo+ID4+Cj4gPj4KPiA+PiAtLQo+ID4+IGxp
bnV4LWkzYyBtYWlsaW5nIGxpc3QKPiA+PiBsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwo+
ID4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNj
Cj4KPgo+IC0tCj4gbGludXgtaTNjIG1haWxpbmcgbGlzdAo+IGxpbnV4LWkzY0BsaXN0cy5pbmZy
YWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1pM2MKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtaTNjCg==
