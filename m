Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB40FEFB6A
	for <linux-i3c@archiver.kernel.org>; Fri, 27 Feb 2026 16:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qgt/BB9nfCu4Wh6LEROEV7Rh01HlYHt9uL1XdkD6saQ=; b=BzZEb+1M8VkLqk
	NfybapYroAlLSekvnUp/YM0KNycRGAEGc9RGwhyRvzSBfrIrtFgC/0kFqxbkbLWaiKKYY9hDHvCMH
	kOBwTQsPMgAM5F0QSRx6Rv8phKNlCVkQLr/phWxtit9y1Uh+MGXWK3vJ36xn2ex7E8b6SmLMQJHzu
	SAmMRqswQ1RaHue1fKlSMhhOjsjOH80QHkF2qXmSiWsflqPAxeI6/ckdU2eKTMe+zOxibQPyDv3Ic
	0TRsAlACiUWW+gIvft0MstdRYdiUrRscZuXNGNZEaM2/QD2z72Swf7+kHribX7cp+wIXpaoxpsRCo
	nskX0ybf5/amjnjwz1Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0ww-00000008kcK-3nap;
	Fri, 27 Feb 2026 16:44:22 +0000
Received: from mail-northeuropeazon11010002.outbound.protection.outlook.com ([52.101.84.2] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw0wu-00000008kbx-1EEQ
	for linux-i3c@lists.infradead.org;
	Fri, 27 Feb 2026 16:44:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rH8btGrNjMSp/z7U+GTfS+DhlXcHCsPKkFMaKKDGAf8NoRmXj2iYaaGjrh4R1T6bIve57r7FtwxJFYWWqThiF/S1pRyX5Gyxi1k5SbdgFrJrplHj09WS/JNq3v1tEpS3FHLFzzbqvAXTU5tl2u13/9VQ/pS0YtAX68rt0mfqgyqtQBwzoSrG1WwjsUhGqomeIKIT4OjkhU5InxSuzjeKBU6fmfd5UrXG86YTAeCZk9u4ZaMiib9pOozNwqb/c8UTQ2Es6FGJcuNBugZbqAKINk/BTW36in2Cm+3RuS0SRZYoqFGhfZP+Og8zsvVo8J8NaeLt4bW0UC0f+vR7jrVqnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3IjwYWzI6TygBWKtuSIaFEcCKf7dLIQyayc7AJz47A=;
 b=aO8E8Rqk4OC3yjAcaL9t18TxHFg+j0byayH/d/1FQ30sJTjSZAlMxdN1BuSP9rH5PT4Ih7X2vhC/2iP8d2eUN+OP0pbl96N1zOaMiQro53XgT5vEXPb7pZD4UPDAbsgv8B5us6lJel3l2zJ1xrsf3ANoudLwO/AdOYqMfXjgQZiavnHaniBgPxD3ak3GPJ4+i+4k85ReUBDkWykxUCV9aIdbnHwpRw0n1sXgFgTmUvGHjaycY1SNusKhDd3oGbGCh6P+li/+ULqshVm30RIqUT7k4TjcR80L8uviYTZX2KB0Fpig0aFbm6PCgBtBtTjCx/MCfcMh9/A7gXxzVnhwBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3IjwYWzI6TygBWKtuSIaFEcCKf7dLIQyayc7AJz47A=;
 b=fkRoQbDoYTwz7TtlF4eye43s6EelpxJieIgHfrsCISX+8fimiTLb8DFRRRWBnuI4792Sda1VauUtVkC1IXxmmPZy3eaFR8JfIpbAg5aL3yNhoKpb66BKk8s2ddIHYSDxOL3nEnzNnzjDyUkN7mGvixgPvmXp625hdkj+WQXB95SYY8u2BClnchet4FRHn1hVDHZCy5wg4KeZlQqBvspGSs0yWK/y7+6u8rGnuyP9Lfywhxa4LZl/KMUuB5tjlYZgB8m1/YpC5UKisI+0cuN4hrHJAhEZdMJxj3npD0NsmUYIlHN7lS6lwpzgJdP3hAQJjF38VR1+Mi2qUoGsR2lZ7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by PA1PR04MB11471.eurprd04.prod.outlook.com (2603:10a6:102:4e0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 16:44:16 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 16:44:16 +0000
Date: Fri, 27 Feb 2026 11:44:11 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH 12/12] i3c: mipi-i3c-hci: Fallback to software reset when
 bus disable fails
Message-ID: <aaHJ2wcJlr6HaqAb@lizhi-Precision-Tower-5810>
References: <20260227141149.184980-1-adrian.hunter@intel.com>
 <20260227141149.184980-13-adrian.hunter@intel.com>
Content-Disposition: inline
In-Reply-To: <20260227141149.184980-13-adrian.hunter@intel.com>
X-ClientProxiedBy: SA1P222CA0040.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::8) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|PA1PR04MB11471:EE_
X-MS-Office365-Filtering-Correlation-Id: 222e0763-e1f5-4497-8926-08de761f7209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: IylThHvFOkRD8ourbwevK0nGX+Eohf6dUDphTov+ms/RXTFI0cgH+voPAy6IlP94a5YNFxrSp12nplOANl3DMFMV6a0fQjuEm+Udrr6UB8n0GPE9eMywtW8b9WB6McTEbbqdRObxPOtQprADMRZc2FI6K3U5cCwUAp7+FvQme42nckt6CvRPk1DXq5esux43RPFSRbklnv5cgVrPiygOPStR/cFo4d0BwXpARBxsGMMXrGYETNCP7LD1cGxeaKUEb6Q8pMU/aq6SuQ62iVSGDjlI2rzpqj1ISX7jneJDMaP0qHKYyukbIZM4TUJmde16UO2ymxueNNCHtNz50Xyrecei1LKbSgpJbKHRLo+QIfYvOIn7u2SV493sfTDZtKALlh5QLPvuptBbQZPXXdzJozElp1j9ctv2FSejzn8Q6jRfLtRLeSAhaqRf9jcrmzde2iwfSoTAfAleZnOxDZwTkVovsJafNBKrfyt7MoFvxVznI0YbgGjVkc4yLSRreV9fi5k6jItz4djAhKs0okLTJ5WRD7gsyH9fdJ5VGxOZUdEX8Ey1RzTScc7Xg3YbnVZ4lxHCPZIF1NOv6mG9Pv6L1BtMt5ly85Rb8XbrdPkUOAot7ZHIiG4D1cdbDt+mgsbLZ9DxXPQi/Jk2neUyKQfDTZm4EWC1ZcH9pitZEcDJXOqRbXm1qRT26IQ9HZKUARbAkv/wY6bSJUjsJBHa1xu81DzxuqprtgvL2slJCeoe4Whw79yOKgSNtwDiVWMmGhEd88xRt6uDQUMytQmpKqiGjksZ0bmAv/efBu+1qH7GPog=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkVWR292dDc5NmJuRU91NGtEelpJdDJyMWdoNlZjSXVwem1VMVlCOWZuSkJ3?=
 =?utf-8?B?SXJXNCtmSFpBd2RyVTJoSWFmc1NpYnVJNjZIYUcxT2lvd3F2NE9sVlo1d0di?=
 =?utf-8?B?SldDS1RaOUNqMHhoZzY4andKVWY1N3JOeXEzeFdad2lPSHJIWksxTi9ZNllG?=
 =?utf-8?B?UHQxcURHc2dBYmFSZUpmY1lXNXNYa2pIaG5BZTFtSkZkbXpXa3JCRTlvQ2tU?=
 =?utf-8?B?bG0vSS9FbmVUMEpYRmZBV3FPZE1rakJPL2NLN3dhS2ZIczlocVp1aWZEaHFo?=
 =?utf-8?B?RkZKY1JrWUZQZzhIcWhCU29PUVpaSlRQRnYwT2ZOSU5UVHp6ekFTeVl1bUZT?=
 =?utf-8?B?N2lCY1YzbllkeEdoTWV5ZVJMVlY1eGpsc2VzdDF4am9acjFqeGl5N1cwcEhi?=
 =?utf-8?B?eE1vY3Rtb1ZNU0d4TlhaVlR6d0w0djNyelNpS2plTmY3Z2tIaXZ3MnNmQXFo?=
 =?utf-8?B?UUZ0OVhwU0c1NUpibXAyWmN6eXBFa1A4cU1sSFJIVkJoUDQ2c0h4ODVlcW9K?=
 =?utf-8?B?bHlLdkpYaHBuTlRGMit6aFdQL1ZnbExjdFJXSmJhVGVwb2JHMitvVkpMRGZl?=
 =?utf-8?B?OXBoUDVZc1UxLzRoTTVPZ1NKWElCNUlhMEwybGMvQUxBODhkQjFGVFVRaW04?=
 =?utf-8?B?YnR6bWtTTS96OTB5QTIvSVZudXpDeGRxbis0UjBmR0hwNFdoaXlmMW01cHRs?=
 =?utf-8?B?Zml0NVVCeXFJdmlqR0Q2MlVyTzJwbXdraStVTmgzd3pKTGpwSFBCaHBBMnk3?=
 =?utf-8?B?d0VFT0drQ0Q2MnhldnhSdkwwSFVtb2xXcW8va2hWNEI5OElmUTFIZ1pHL3VR?=
 =?utf-8?B?Mm94Z0pWS2YyYjR4Z21yZCtOWFJJV1hSY2pQcDMrMjZkZ1hNZU1PRHp4RUQz?=
 =?utf-8?B?dHp2WkVqZHUzaE5ZU1FaVm1OOXFCdzYyMmxabmp6YVNHNjk4VFZPL09sbXpj?=
 =?utf-8?B?S21mWHkwZlhmd3JoRmZwMlI2NmZpNkxldWU1bXNGaUp0ZDdFMjBJT3FNZis2?=
 =?utf-8?B?OGFPWnJ5ZnEyZlY1NWp3dHRmbFJ0d042dWF2VGVkd3VsOHFoYVhLZURMZlM1?=
 =?utf-8?B?c2lkYUdpTVppbG91TW5MaC9LWDFubFR2TGYwTFFuMTBkQ1NTakZudHVZRWla?=
 =?utf-8?B?WVZicFZUNDFYaTBQM0NqZ3JIUnRIajc1M2tRWGhlTmpuT0w2RWN0YVdOQ0hh?=
 =?utf-8?B?dlIranJLS1RDaXJpNnA3aCtQWGdEd1BJbmdGdXRaZkY3R2pEOUZWUmdJUnNI?=
 =?utf-8?B?a3ExeWRKMGl0cGhJVHpoaFBqaUNoWmI1NjR1WlMwd2hUMVEzRXNNYVJaQlQz?=
 =?utf-8?B?Qk9lbE8xQlk3d2pjN0Ftc2dRMC9UUnNrMkE1VElTYnY1WjlpUC9FT2JvNGI3?=
 =?utf-8?B?bGc4OUY5Z2tTdUVOR0lnTCttVEhvRXVzY1FNZS9UNGh5ZE1nQTJYOUVCR1lV?=
 =?utf-8?B?VXJSVXlTMGJ2N09EdXFhQ25LcUM0bFViR0RYWkgyR0JQdHRoRGc1NEtxL3o0?=
 =?utf-8?B?blZWaUR5MmdjYk5mNUg0blZGMG5jYnhoVFZoQzZGMklZQ3h2VkF2aGpFcmVJ?=
 =?utf-8?B?dmUxcWNUd0gxZ0NWYm1ld2I4cEp4THM0alBmd0hFTHAxUDcvU0VtejhWZG4r?=
 =?utf-8?B?dVlWN3p5Q3g3NmJ0YWZmYlEzV0d6M3h1UlhDZlhmWmhuQnkxOG5XN2VRdzNk?=
 =?utf-8?B?cEhzM2dWWGJEakUrSHB5TVFlSVNZMmNBN3lnOER0OEFmUjdFNTlZWGRDQno2?=
 =?utf-8?B?RHlFWENsaW83L3hJUXh3aXE5Y1dIdTQxT2wwSTZKelhlY3daQjUvN0N1ZjlW?=
 =?utf-8?B?alNpT3pkYlZWQU1YUjZEV3BncDdMTkR4MHg3bTI4cDJFU1o3YU1aVDBLaE5w?=
 =?utf-8?B?RkpKSHVVVkpvQmxlYmJObXBUZDFVOUdzMTN5bEhYWDA2L1dNRDR3TXZoayta?=
 =?utf-8?B?WU8yWmtRcmVXNlp6YjUyUnN0bnk5MFlXeDZrOG1ZMjFYTUhyaWp6UGVRU1NE?=
 =?utf-8?B?SEpGenQ3T2NzZE16MmdaZmFMa29ad0cwMVJwTGRXdUd3VVkzY0twT1JBS0cz?=
 =?utf-8?B?SVZndnhocDQxakh4WkNjalZjbkVNOUVqVko4cGZ2MGx0RktQaWMyWkZkYmtZ?=
 =?utf-8?B?WmVPMFlzRjA2aHlGRVlTYVZuZUtrQThYREFJV2tmUW9hWGdyeThBazZNVnRI?=
 =?utf-8?B?SDJSOE1IS3YybVJWZGlwN2xQa2ErOW8rWElxNXZuRjliaE15KzdaOFY3Zjh6?=
 =?utf-8?B?R3BWZzRZODFvYnRpMUtNb2FvbDYvR3VCSmxwSVpkZGMyS3NTV0pXNmJLMzJv?=
 =?utf-8?B?WG0rN3hwbU1NVE1IS0ZIelI5ejBqNko3TmRjZW4vOSs1Tk5EUVVLZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 222e0763-e1f5-4497-8926-08de761f7209
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 16:44:16.3598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdzm1pG6bdp3lwbvV0uqxHdjwOYk898hMv8NGl/ooc9oaT2L9ubFRi3OUs5V3bmRWl70XBUOmnlfMRDMxs6wmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11471
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_084420_336910_F443993E 
X-CRM114-Status: GOOD (  29.17  )
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

T24gRnJpLCBGZWIgMjcsIDIwMjYgYXQgMDQ6MTE6NDlQTSArMDIwMCwgQWRyaWFuIEh1bnRlciB3
cm90ZToKPiBEaXNydXB0aW9uIG9mIHRoZSBNSVBJIEkzQyBIQ0kgY29udHJvbGxlcuKAmXMgaW50
ZXJuYWwgc3RhdGUgY2FuIGNhdXNlCj4gaTNjX2hjaV9idXNfZGlzYWJsZSgpIHRvIGZhaWwgd2hl
biBhdHRlbXB0aW5nIHRvIHNodXQgZG93biB0aGUgYnVzLgo+Cj4gSW4gdGhlIGNvZGUgcGF0aHMg
d2hlcmUgYnVzIGRpc2FibGUgaXMgaW52b2tlZCAtIGJ1cyBjbGVhbi11cCBhbmQgcnVudGltZQo+
IHN1c3BlbmQgLSB0aGUgY29udHJvbGxlciBkb2VzIG5vdCBuZWVkIHRvIHJlbWFpbiBvcGVyYXRp
b25hbCBhZnRlcndhcmQsIHNvCj4gYSBmdWxsIGNvbnRyb2xsZXIgcmVzZXQgaXMgYSBzYWZlIHJl
Y292ZXJ5IG1lY2hhbmlzbS4KPgo+IEFkZCBhIGZhbGxiYWNrIHRvIGlzc3VlIGEgc29mdHdhcmUg
cmVzZXQgd2hlbiBkaXNhYmxpbmcgdGhlIGJ1cyBmYWlscy4KPiBUaGlzIGVuc3VyZXMgdGhlIGJ1
cyBpcyByZWxpYWJseSBoYWx0ZWQgZXZlbiBpZiB0aGUgY29udHJvbGxlcuKAmXMgc3RhdGUKPiBt
YWNoaW5lIGlzIHN0dWNrIG9yIHVucmVzcG9uc2l2ZS4KPgo+IFRoZSBmYWxsYmFjayBpcyB1c2Vk
IGJvdGggZHVyaW5nIGJ1cyBjbGVhbi11cCBhbmQgaW4gdGhlIHJ1bnRpbWUgc3VzcGVuZAo+IHBh
dGguICBJbiB0aGUgbGF0dGVyIGNhc2UsIGVuc3VyZSBpbnRlcnJ1cHRzIGFyZSBxdWllc2NlZCBh
ZnRlciByZXNldC4KPgo+IEZpeGVzOiA5YWQ5YTUyY2NlMjgyICgiaTNjL21hc3RlcjogaW50cm9k
dWNlIHRoZSBtaXBpLWkzYy1oY2kgZHJpdmVyIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9y
Zwo+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29t
Pgo+IC0tLQpSZXZpZXdlZC1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Cj4gIGRyaXZl
cnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jIHwgNjUgKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29y
ZS5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9jb3JlLmMKPiBpbmRleCAyOTA5
ZTNkMzVkOGIuLjY0OGNlODdlM2I3ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIv
bWlwaS1pM2MtaGNpL2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1o
Y2kvY29yZS5jCj4gQEAgLTE4Miw2ICsxODIsMzQgQEAgc3RhdGljIGludCBpM2NfaGNpX2J1c19k
aXNhYmxlKHN0cnVjdCBpM2NfaGNpICpoY2kpCj4gIAlyZXR1cm4gcmV0Owo+ICB9Cj4KPiArc3Rh
dGljIGludCBpM2NfaGNpX3NvZnR3YXJlX3Jlc2V0KHN0cnVjdCBpM2NfaGNpICpoY2kpCj4gK3sK
PiArCXUzMiByZWd2YWw7Cj4gKwlpbnQgcmV0Owo+ICsKPiArCS8qCj4gKwkgKiBTT0ZUX1JTVCBt
dXN0IGJlIGNsZWFyIGJlZm9yZSB3ZSB3cml0ZSB0byBpdC4KPiArCSAqIFRoZW4gd2UgbXVzdCB3
YWl0IHVudGlsIGl0IGNsZWFycyBhZ2Fpbi4KPiArCSAqLwo+ICsJcmV0ID0gcmVhZHhfcG9sbF90
aW1lb3V0KHJlZ19yZWFkLCBSRVNFVF9DT05UUk9MLCByZWd2YWwsCj4gKwkJCQkgIShyZWd2YWwg
JiBTT0ZUX1JTVCksIDAsIDEwICogVVNFQ19QRVJfTVNFQyk7Cj4gKwlpZiAocmV0KSB7Cj4gKwkJ
ZGV2X2VycigmaGNpLT5tYXN0ZXIuZGV2LCAiJXM6IFNvZnR3YXJlIHJlc2V0IHN0dWNrXG4iLCBf
X2Z1bmNfXyk7Cj4gKwkJcmV0dXJuIHJldDsKPiArCX0KPiArCj4gKwlyZWdfd3JpdGUoUkVTRVRf
Q09OVFJPTCwgU09GVF9SU1QpOwo+ICsKPiArCXJldCA9IHJlYWR4X3BvbGxfdGltZW91dChyZWdf
cmVhZCwgUkVTRVRfQ09OVFJPTCwgcmVndmFsLAo+ICsJCQkJICEocmVndmFsICYgU09GVF9SU1Qp
LCAwLCAxMCAqIFVTRUNfUEVSX01TRUMpOwo+ICsJaWYgKHJldCkgewo+ICsJCWRldl9lcnIoJmhj
aS0+bWFzdGVyLmRldiwgIiVzOiBTb2Z0d2FyZSByZXNldCBmYWlsZWRcbiIsIF9fZnVuY19fKTsK
PiArCQlyZXR1cm4gcmV0Owo+ICsJfQo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICB2b2lk
IGkzY19oY2lfc3luY19pcnFfaW5hY3RpdmUoc3RydWN0IGkzY19oY2kgKmhjaSkKPiAgewo+ICAJ
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiA9IHRvX3BsYXRmb3JtX2RldmljZShoY2ktPm1h
c3Rlci5kZXYucGFyZW50KTsKPiBAQCAtMTk4LDcgKzIyNiw4IEBAIHN0YXRpYyB2b2lkIGkzY19o
Y2lfYnVzX2NsZWFudXAoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbSkKPiAgewo+ICAJ
c3RydWN0IGkzY19oY2kgKmhjaSA9IHRvX2kzY19oY2kobSk7Cj4KPiAtCWkzY19oY2lfYnVzX2Rp
c2FibGUoaGNpKTsKPiArCWlmIChpM2NfaGNpX2J1c19kaXNhYmxlKGhjaSkpCj4gKwkJaTNjX2hj
aV9zb2Z0d2FyZV9yZXNldChoY2kpOwo+ICAJaGNpLT5pby0+Y2xlYW51cChoY2kpOwo+ICB9Cj4K
PiBAQCAtNjI4LDM0ICs2NTcsNiBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgaTNjX2hjaV9pcnFfaGFu
ZGxlcihpbnQgaXJxLCB2b2lkICpkZXZfaWQpCj4gIAlyZXR1cm4gcmVzdWx0Owo+ICB9Cj4KPiAt
c3RhdGljIGludCBpM2NfaGNpX3NvZnR3YXJlX3Jlc2V0KHN0cnVjdCBpM2NfaGNpICpoY2kpCj4g
LXsKPiAtCXUzMiByZWd2YWw7Cj4gLQlpbnQgcmV0Owo+IC0KPiAtCS8qCj4gLQkgKiBTT0ZUX1JT
VCBtdXN0IGJlIGNsZWFyIGJlZm9yZSB3ZSB3cml0ZSB0byBpdC4KPiAtCSAqIFRoZW4gd2UgbXVz
dCB3YWl0IHVudGlsIGl0IGNsZWFycyBhZ2Fpbi4KPiAtCSAqLwo+IC0JcmV0ID0gcmVhZHhfcG9s
bF90aW1lb3V0KHJlZ19yZWFkLCBSRVNFVF9DT05UUk9MLCByZWd2YWwsCj4gLQkJCQkgIShyZWd2
YWwgJiBTT0ZUX1JTVCksIDAsIDEwICogVVNFQ19QRVJfTVNFQyk7Cj4gLQlpZiAocmV0KSB7Cj4g
LQkJZGV2X2VycigmaGNpLT5tYXN0ZXIuZGV2LCAiJXM6IFNvZnR3YXJlIHJlc2V0IHN0dWNrXG4i
LCBfX2Z1bmNfXyk7Cj4gLQkJcmV0dXJuIHJldDsKPiAtCX0KPiAtCj4gLQlyZWdfd3JpdGUoUkVT
RVRfQ09OVFJPTCwgU09GVF9SU1QpOwo+IC0KPiAtCXJldCA9IHJlYWR4X3BvbGxfdGltZW91dChy
ZWdfcmVhZCwgUkVTRVRfQ09OVFJPTCwgcmVndmFsLAo+IC0JCQkJICEocmVndmFsICYgU09GVF9S
U1QpLCAwLCAxMCAqIFVTRUNfUEVSX01TRUMpOwo+IC0JaWYgKHJldCkgewo+IC0JCWRldl9lcnIo
JmhjaS0+bWFzdGVyLmRldiwgIiVzOiBTb2Z0d2FyZSByZXNldCBmYWlsZWRcbiIsIF9fZnVuY19f
KTsKPiAtCQlyZXR1cm4gcmV0Owo+IC0JfQo+IC0KPiAtCXJldHVybiAwOwo+IC19Cj4gLQo+ICBz
dGF0aWMgaW5saW5lIGJvb2wgaXNfdmVyc2lvbl8xXzFfb3JfbmV3ZXIoc3RydWN0IGkzY19oY2kg
KmhjaSkKPiAgewo+ICAJcmV0dXJuIGhjaS0+dmVyc2lvbl9tYWpvciA+IDEgfHwgKGhjaS0+dmVy
c2lvbl9tYWpvciA9PSAxICYmIGhjaS0+dmVyc2lvbl9taW5vciA+IDApOwo+IEBAIC03NjYsOCAr
NzY3LDEyIEBAIHN0YXRpYyBpbnQgaTNjX2hjaV9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmlj
ZSAqZGV2KQo+ICAJaW50IHJldDsKPgo+ICAJcmV0ID0gaTNjX2hjaV9idXNfZGlzYWJsZShoY2kp
Owo+IC0JaWYgKHJldCkKPiArCWlmIChyZXQpIHsKPiArCQkvKiBGYWxsIGJhY2sgdG8gc29mdHdh
cmUgcmVzZXQgdG8gZGlzYWJsZSB0aGUgYnVzICovCj4gKwkJcmV0ID0gaTNjX2hjaV9zb2Z0d2Fy
ZV9yZXNldChoY2kpOwo+ICsJCWkzY19oY2lfc3luY19pcnFfaW5hY3RpdmUoaGNpKTsKPiAgCQly
ZXR1cm4gcmV0Owo+ICsJfQo+Cj4gIAloY2ktPmlvLT5zdXNwZW5kKGhjaSk7Cj4KPiAtLQo+IDIu
NTEuMAo+Cj4KPiAtLQo+IGxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKPiBsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtaTNjCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWkzYwo=
