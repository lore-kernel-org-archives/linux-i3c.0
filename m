Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00129D73E83
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Jan 2026 20:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hNHxZUI+eFsFp+yLeU2F4zsL5hXUGKm3U6WBW3jXlSo=; b=Z4mw97v2ekyKWx
	w1lbw3HcQcJW3CLjCUWcifTTe+mbFxtXyVkLKaTjN+UpmvNZkZJWoAxwE/Zz0MNboSuSrlYjcbgvx
	on2isOg/3ujwyHJ6LjiStYlaK8/BC8l0zsHGTWrWS7WMq2/MMu++GRBSosaGz2igKmu2km95N9F8A
	tTLZSA60DBrUPPA4km3Ld8G2cdJ/SB8xPBY5ZogB7hm1iXl5t+xydM891B0do2i0Jeksnga5jaTV4
	fYiNSwIvdV6MxJyEQb2M8UI8w86oOIIJr2jMFf+NBJVIe1wIcRjHk6oZtdfkLwEfaK28LHhPtvSVZ
	OdgmEA6KkMosIXBpntWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZ3V-00000000dh0-39ZF;
	Thu, 29 Jan 2026 20:55:57 +0000
Received: from mail-northeuropeazon11012002.outbound.protection.outlook.com ([52.101.66.2] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZ3S-00000000dgd-3LAm
	for linux-i3c@lists.infradead.org;
	Thu, 29 Jan 2026 20:55:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GvKxGShBDtPuQdS0c1EwrHqxygBj/ONmLk3t20ff4YPgKpSXfux234B78NtLYlrTQBVlIaJKbatZdbaGZ+6OtkZCHo64cb8bn9W8hunCjuzQaQUjL2+HJYQSyrG9cuRNgQ+YW1tfFey8wd9xz1P0bKUO112scbnu3XUWhrd1CZDr70ES/oPvYJg6qiOWzDF85nltO1s85n7GR+/sSimjKHaONbbZ0VjBOU650TvehEOYRv4EQmWsmqLVFfBJZh16m6iUWj7MWIZkPswtN6ZBOlxr4l8sqBH3QHqo6RQyncyi6MYyM2VBKtiUIs4tT4DH7wr/degQ8bG58vLPOnc7Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=od61XGlT2a7EqMe3yIWI9RmiJG6kdrn+0AImlpqYsTU=;
 b=d/hyoFfOpD6AeAoY9CyW37I1UmfOh25NDCzR25ojc6xiyZuDpNHKgmHa5zdwfxovQpUyMEH1UuoHuFOL0Wws5K9h3WKOhmFY1vPKDjB7XqnZPbU53znVGf5tg9K2SCXVztomnQ74J+qSgCqQy0U36jyIAqgEu2aNYefF06uRzLMrSkokdzY2GfzKmWLajN0nHFnu+qcdw5Xw0fjFJPcTqWEeyHOGFx20vmUb+EVoMuHzz+ynFJyjhWKMdvG4D/m1InMcrxHxIwzZcTm/XGFpDNnnTyBV0EYpZ5V++BeScu+H3pu1wbz9RxnxhGTZOWGIVTJsQzLivTiaBncyw11afA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=od61XGlT2a7EqMe3yIWI9RmiJG6kdrn+0AImlpqYsTU=;
 b=KT35gbTFqmwiR9ivvn0UX0bzMLrfSWV5M+q9GEmosf9dHO+PJajF01dU+7jAmyGobb4bAXg7Wa9f+341grADrvig3oin112dU7xd2Bsftb1injmAaHKsCgiZCU2gqZUD++qwdE3Ij7B+xQlBAMIziNm0c4F2ciehwaB4Suhsc4Rd4USsfoEqX+u3aIr/SwaRxlon4nhSKHkcYL3nXt/6ibMALyfG7qn82qiKlsLn22gy8ekswKqCcHMKxeYeUczwvzDc5ObNgj/NINHdyTyRvXwEC5g7cR4ao8CuMucmLnUQgNz2KT9dTf9dHGsODePj34KTXJlp8OYLNQoRU8c3kA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DUZPR04MB9984.eurprd04.prod.outlook.com (2603:10a6:10:4dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 29 Jan
 2026 20:55:49 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Thu, 29 Jan 2026
 20:55:47 +0000
Date: Thu, 29 Jan 2026 15:55:40 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 3/7] i3c: master: Mark last_busy on IBI when runtime PM
 is allowed
Message-ID: <aXvJTPWhQwFfv57G@lizhi-Precision-Tower-5810>
References: <20260129181841.130864-1-adrian.hunter@intel.com>
 <20260129181841.130864-4-adrian.hunter@intel.com>
 <aXu7UduYCweVLxdK@lizhi-Precision-Tower-5810>
 <1db7b04b-ee65-4791-8db5-0dffc7befca2@intel.com>
Content-Disposition: inline
In-Reply-To: <1db7b04b-ee65-4791-8db5-0dffc7befca2@intel.com>
X-ClientProxiedBy: PH0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DUZPR04MB9984:EE_
X-MS-Office365-Filtering-Correlation-Id: 25676193-9c9c-434a-4dc2-08de5f78c6af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFo5N3gxYlVHc3NQc1Fkb0xjNEY4L3VIdXlJU0VRZ09QanN5UEIvWnhhcExm?=
 =?utf-8?B?WVMwODVaVzdUZTVXK1M2dkZ3QVlXeXlwQmwvZWZtbHZwNGlUcU9ldXhEUGN0?=
 =?utf-8?B?SUF3MkpleUw3ZFhGbWc5akNDQ3FWU3ExMGVnMitiMVR6R2w2U0xtT2FCcElI?=
 =?utf-8?B?QlBxQmt2SUpITFdZVjJNUWh6KzdacTUybUdENGdIVW1NL1ZFT3ZERk9FMlVu?=
 =?utf-8?B?WkRDVFM0NVFjcHpXaVBYMi9xSUdzYUhKM3lmVUwrUVorWUVGMGRDaTYyanlx?=
 =?utf-8?B?S2wwSXI3YzdRVTVHVS92RkwzNE80U1VjeGE5aFhsUEN5ajBuRUI2eTgyRUF1?=
 =?utf-8?B?UDBnbThlVk9YbFdwT04ydWFMTHFBOTBOVEpzRjNZWmR1QWt2TlFxakNlVjJr?=
 =?utf-8?B?QXdKVGdhSUpkU1piNXZMbmxFcmJ0T1NjeUg5di9veWNvVHF3a2x1NkE4Z3dD?=
 =?utf-8?B?VUxFTzBlRlNUR1ZHN01ZL2lUUklXOVczcS9DRXI2VEpsM0tZcWgrWjdCV3dK?=
 =?utf-8?B?T2RySll2cUVCL2R5NWQ2U0N1UFc4R2J6bnlvSElySVJKR0RuUUNoMkM1NjQw?=
 =?utf-8?B?clI5eDRXRit2VWJTbkZReWZtZE5hUE1vaWlGcHFNSnp5cVMwRFJmak10L0lT?=
 =?utf-8?B?LytvU3lVWm50NWd3Z000TFd1S1FFaU4wMzFULzZybXVIQytwbVNWN2hnbmV1?=
 =?utf-8?B?bDJxNVdBK0NsaldXNklLQ0pTNXN2NVhnNEE4cDcvRm80RnpyT09BMFErRnF2?=
 =?utf-8?B?WFlMRitHeWlPNGFEbDhleERHdGs2MWlHbUloMC9FYnVQQTZsZXpOQ1FoaWRz?=
 =?utf-8?B?QVNkWmthLzhYc1QwYW1lWkRmWFFIcGx1ZlFnaWFPNi9KbGNySHFSMVJDNWFj?=
 =?utf-8?B?enVCcjB3aWhKV2pMTDJraGtEMDlQb3BQRHEwTGFiVXNwOTVTeWZ4RVlmQnJ2?=
 =?utf-8?B?WGpEY240QkNwdXdLSEFucUs2UUlQRnRmcUM2ZUVUWEhSMXQvUjRQQzdDMzAw?=
 =?utf-8?B?TWRLTEpOTksxa2MxZWF2Q0hMbDFjMzU0VWFWb1l0N0RuTHFXbHFsd1VmSXRP?=
 =?utf-8?B?dkgydTdrdk1xNUlzZnJRMjFyNks2VUJNMWw4OTlWZ21WSTNjRzFxN1hSMThq?=
 =?utf-8?B?bUUzdDlhTUpGN0FBWlh6Yk9kSDBUVVBZckNHS3FYSnZ0eDJHMFEvOGVWMnlx?=
 =?utf-8?B?Tlk1UTZVTTNrSVZIK0pOMnpOdW02azVqd01wYWRtbitVS2ROV3ViaVM4N3RZ?=
 =?utf-8?B?eTBNT2p2azkwd3A3ME5tenhrVU84cjI5RVEzdDR2cEplbFZ5eEZOOFYwcjlu?=
 =?utf-8?B?bW9lZjlaS3JQRmNoN2s2QTZ1bkwyM3o3MFYydDhDcERGZHBVYVE4WVR2dVJC?=
 =?utf-8?B?SVJaM1RlcktXUFdEWjJWNHVrQUhVS3pvMTZ0bklvbW9zNkVObmZtK3B1b2Zk?=
 =?utf-8?B?TDcxRnh2eWo2a3VuWlVqM2t5ZkJQV0lLYWsyL1pLTnpjN3FrOTRPYVJHRkVr?=
 =?utf-8?B?ZFhhazF1dHZHNTZNQWd5WnExZGxxSzlocTNBeWFpTkUvd0x1Y1NIVVprUEZz?=
 =?utf-8?B?N0tLOU5RTC9mNlBJOVJZY2txVkdCQy9wZ1lPRlh3bDV2TVA0WDRNdFR0U3M5?=
 =?utf-8?B?UTZPaDZzT28zbm1kQnk4STdwVVIxTk5vUXBDRURNellmc0RXL21vUUJyNnVn?=
 =?utf-8?B?cTlIYzhtVlJtQUpjanFydXAxenBqV2xROGVnQ2xjMDZCSXpHZFpkTG9XSWRG?=
 =?utf-8?B?dHZjZmtNbVRDVFdackdKREY3enFYWEZnRTBLcFdMUjVJNGtVdkh0bmFDZnJQ?=
 =?utf-8?B?R3E3TzdOYmM5S1Fqd0kxYWpadGxDMkJEREthNUtRRjA3ODAwZjZQVlREa1lG?=
 =?utf-8?B?aXF3R1JjWmpmQTBmcTNZT24zUVIwRU1xcmY4QlR5V0ZBNnQrTS80R2xjdXl1?=
 =?utf-8?B?eExmNFIxVkNsMnR5aUR4R2UydUlqM09tUlNxbzhOZWI4eEpVbG91TXdhelhX?=
 =?utf-8?B?blpEck9qS0NiVGpteFJSOUE5dFZJdFAvQk1VbjRYN0M4OWFJM1dkYzE3V3Nl?=
 =?utf-8?B?QVVMbkhEVkFYUFlvcWltdjMyVTg3VVhENlVXdFlGeXFpZFRpZitIQzFpNi85?=
 =?utf-8?B?OEdLQ1dzcHVOdmtkcGdDWUFQcFlENjk1b2E1dlJJc241V3R4NUYxRUJpc3pq?=
 =?utf-8?Q?2buTOKACPugUEYBrXHTobXQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWFKM2xCT1hGSnZQdXJuOU9zSkRHQTZEREFKZVAzRm9SY2dwa0hFMXRoeDVM?=
 =?utf-8?B?REJqQXdFd2VJRlh1WU5pZ1lmY2wzMU9NU2x4RExWcTE3RC9LTU12SWVNT1RI?=
 =?utf-8?B?eFNhYUs4bHNpa0VUdlBUUGRiRWtXZXIwWkVrazd3QnJXeGFCRFN2MG1HUC82?=
 =?utf-8?B?YzkxS1ltalFTZzNMbUszQnJDemVMNjFUZDZubkxpMXUyMHNmTXlpamNoZFJO?=
 =?utf-8?B?MlZGckxMNVhJTTJYelluWCtodjhTQ1hpVWpld1EvQnBFNVUvMmNEc3ZtVVIx?=
 =?utf-8?B?RGFqZzM4WFJZSy8xOWF5OVYxR25uaVhtOHlsb3RUSkh6M1VSRkNzY0hubFRM?=
 =?utf-8?B?b0RuVjFtV0xkbkRHVnRPbDFDWi83a1hkTjdwZjdBQm9DREV5VS9BVlh4eDYr?=
 =?utf-8?B?OGFKTTF2RFBqVzAyWmtkVGhlM3YyMFB6blhMUUp5UzFudFZSZTRMbnRVRytw?=
 =?utf-8?B?dU5TWE8rZFI0N2QxbysrUHBHb0pVRUVhdUtMWTRadjNvdlhPWkFRR2pOaFV1?=
 =?utf-8?B?ZVdkSEVJTUUzOUVRYXFyN1lzeFRnV2NYUDM2cmJKd05yUlJGamROSXhySWR2?=
 =?utf-8?B?M1pTbUczNXIwdjU4LzNVWmR1SnowSTl5eFZNMGZjTVk2YUtCb1V6Z0h5eEIw?=
 =?utf-8?B?MHRGRGRLVW9lc3A4bmxjaUV5Vi81TFFTc3JHY2VHT1doVHpoRDh0ZWNyR2tw?=
 =?utf-8?B?VjVkQk5hei9iNlNNMjRmbnlmZjZCbnU3OTY4TlplRkErQ3pNYXp1a3hXVlY3?=
 =?utf-8?B?L3FieHVSdWNseXF2WjRsOXRaRkRKMzJPMmcrYkx0eFdlYllPUlNWL0VvK3lK?=
 =?utf-8?B?ZUpsRDFQUitwd0R5dWtWL05YeDJ4SEQ2aFFXSVgrWS9mbFZIemJXcmsvSldI?=
 =?utf-8?B?VnJOK0JvbkRaYkFpZGVrR2FCZjBSSzNrcE9ycXJCYjlKWmk0S3IwYUY3N0JZ?=
 =?utf-8?B?V3ljaVltMUhRSWN3cmR0UmQ0eHhRTEpoSlpuSURKYnNaTitnL0ZpUUt5NHJU?=
 =?utf-8?B?Myt5VzNOVW9ERm9IaWthQ3NVdEh2TlZVR2p3YmxrbS9TSTR4SnRUYzl4cjRa?=
 =?utf-8?B?T2FvRStYSzRTZG9NN1hnNlI1RGRlMEwxMXo1K3FjOVZ6eEJZRm9lQXUyVm5X?=
 =?utf-8?B?Ym0vdHMydkxHeHkxRVc3VlZOWnVjMzZMZU52UGJIemhYb05LZkZjdENjQTR4?=
 =?utf-8?B?TmI0dHBwTUtSTkJDVXUzUEZJbmRVTWpZOFpEWWV3NWkvT1o3QVBFdU9mZ3V4?=
 =?utf-8?B?dGJ5aUlQdmxnaE0rQndYcVUxdDRZcXNBWDNXQ3dUYWNOWktFMHR1VjJCU0V3?=
 =?utf-8?B?RVFiVzE4RDZ3LzgzeHZpLzc0bHJpdDQyOFBNZkYvcEh4YkloVHFGNGRXb0px?=
 =?utf-8?B?c3IybEhhU3BhVTVReUduZnNWT1d3Ynl5MGtWVXdNVVlOelhOMzNTeUlyM0ZZ?=
 =?utf-8?B?STBvVXBTQUZmV1pkR1hFMFpoVVlZNS8zYVMzd2c2bFlPazR6bmJOMHVWbjFk?=
 =?utf-8?B?d1kxODU4WkJYT09KRmVvMXNRY1lLK0YzOHVzZllIQm1pakpNN1d1eGN5SVZh?=
 =?utf-8?B?WG1LQ2gwdXQwUTlCbEQ3WHNodS9XdHNFd3VvOHNyVFpUZUVyWXU0TnVic0Rw?=
 =?utf-8?B?YlNUZ3JnaU5KSWhoakZXcWhvNHhhMGxXNXJmMlBUUDFPTkNNQ3ZmN2VvTDFL?=
 =?utf-8?B?Q2tLTzBObDg0T1JvTk41QWdlei9HL2pESFhhdmQ5NWl6RlIwa0RreUR3TGQ1?=
 =?utf-8?B?MERtQjNKS3NpbDRScTdqL2pKYnhDeGlTSkZsbTFKZDEzUDJFTG5ZQkhQODJK?=
 =?utf-8?B?NUptYU9YM0FBYU5HelVuMlBQY2x0d3FGeGtSZU9hNDZsZWtzWWFIUWdaN2F2?=
 =?utf-8?B?WHkxYVF5bUpQci9WQVdLVWt5Tzg3ZHBna2pWN0hBWHd5c3RMN2xSRTBLSzlI?=
 =?utf-8?B?SVU0b25Rd1JENW5hbDRLNXk3TVFvM3lxUUZqaS9ZWjRoVThubE9ZU1l2T3o0?=
 =?utf-8?B?em5RWUxjeE1vU0pIaVBlY2hCenFEMmNLTlVpVnNDTENIbW43NWZVY3pHQmFB?=
 =?utf-8?B?aVpkQjNZLzNyNWkySWJXaGl3SnlIcEdLbWhNZUJJMjErTkprRzhjRkZSV2x5?=
 =?utf-8?B?NjhhUllJZzNTbUdEQStzR3BPdCs5eWZrQ1dLMXBYSXNia0d6QnJMVEtDZWgv?=
 =?utf-8?B?ZlIxemFIN1VsL01tZUZ3QW5jNTVmWlc4QzE1L2o3TnpacDBweGQ4RmhRdXhC?=
 =?utf-8?B?NlVwalBjK1A1bnExNW8rRkVxeW1zZUcxa3BwbGU3aElxVGtHZ2w5MWc2NWIr?=
 =?utf-8?B?OUJSZGxiQUZ2L29Zdm1xdjBxNmNTeEpzaFRqSHJhWWl6akt4eStiZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25676193-9c9c-434a-4dc2-08de5f78c6af
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 20:55:47.0604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eqibXzYOsHTdh/X+PZCn1AqbxU54l7A+VDcvppF/bK1CEjV5yPV4rbbnRy8+flHycOCgYGseX0I5zf1GeT66nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9984
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_125555_294174_C7134ADA 
X-CRM114-Status: GOOD (  26.18  )
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

T24gVGh1LCBKYW4gMjksIDIwMjYgYXQgMTA6NDI6MzJQTSArMDIwMCwgQWRyaWFuIEh1bnRlciB3
cm90ZToKPiBPbiAyOS8wMS8yMDI2IDIxOjU2LCBGcmFuayBMaSB3cm90ZToKPiA+IE9uIFRodSwg
SmFuIDI5LCAyMDI2IGF0IDA4OjE4OjM3UE0gKzAyMDAsIEFkcmlhbiBIdW50ZXIgd3JvdGU6Cj4g
Pj4gV2hlbiBhbiBJQkkgY2FuIGJlIHJlY2VpdmVkIGFmdGVyIHRoZSBjb250cm9sbGVyIGlzCj4g
Pj4gcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoKSdlZCwgdGhlIGludGVycnVwdCBtYXkgb2Nj
dXIganVzdCBiZWZvcmUgdGhlCj4gPj4gZGV2aWNlIGlzIGF1dG/igJFzdXNwZW5kZWQuICBJbiBz
dWNoIGNhc2VzLCB0aGUgcnVudGltZSBQTSBjb3JlIG1heSBub3Qgc2VlCj4gPj4gYW55IHJlY2Vu
dCBhY3Rpdml0eSBhbmQgbWF5IHN1c3BlbmQgdGhlIGRldmljZSBlYXJsaWVyIHRoYW4gaW50ZW5k
ZWQuCj4gPj4KPiA+PiBNYXJrIHRoZSBjb250cm9sbGVyIGFzIGxhc3QgYnVzeSB3aGVuZXZlciBh
biBJQkkgaXMgcXVldWVkICh3aGVuCj4gPj4gcnBtX2liaV9hbGxvd2VkIGlzIHNldCkgc28gdGhh
dCB0aGUgYXV0by1zdXNwZW5kIGRlbGF5IGNvcnJlY3RseSByZWZsZWN0cwo+ID4+IHJlY2VudCBi
dXMgYWN0aXZpdHkgYW5kIGF2b2lkcyBwcmVtYXR1cmUgc3VzcGVuc2lvbi4KPiA+Cj4gPiBsb29r
IGxpa2UgdGhpcyBjYW4ndCByZXNvbHZlIHByb2JsZW0uIHBtX3J1bnRpbWVfbWFya19sYXN0X2J1
c3koKSBqdXN0Cj4gPiBjaGFuZ2UgZGV2LT5wb3dlci5sYXN0X2J1c3kuIElmIHN1c3BlbmQgYmVm
b3JlIGl0LCBub3RoaW5nIGhhcHBlbi4KPgo+IEl0IHNob3VsZCBiZSBlZmZlY3RpdmUuCj4KPiBy
cG1fc3VzcGVuZCgpIHJlY2FsY3VsYXRlcyB0aGUgYXV0b3N1c3BlbmQgZXhwaXJ5IHRpbWUgYmFz
ZWQgb24KPiBsYXN0X2J1c3kgKHNlZSBwbV9ydW50aW1lX2F1dG9zdXNwZW5kX2V4cGlyYXRpb24o
KSkgYW5kIHJlc3RhcnRzCj4gdGhlIHRpbWVyIGlzIGl0IGlzIGluIHRoZSBmdXR1cmUuCj4KPiA+
Cj4gPiBpcnEgdXNlIHRocmVhZCBpcnEsIGluIGlycSB0aHJlYWQgY2FsbCBwbV9ydW50aW1lX3Jl
c3VtZSgpIGlmIG5lZWRzLgo+ID4KPiA+IEFuZCB0aGlzIGZ1bmN0aW9uIGNhbGwgYnkgaXJxIGhh
bmRsZSwganVzdCBwdXQgdG8gd29yayBxdWV1ZSwgd2hhdCdzIGltcGFjdAo+ID4gaWYgZG8gbm90
aGluZyBoZXJlPwo+Cj4gSnVzdCBwcmVtYXR1cmUgcnVudGltZSBzdXNwZW5zaW9uIGluY29uc2lz
dGVudCB3aXRoIGF1dG9zdXNwZW5kX2RlbGF5LgoKCiAgIENQVSAwICAgICAgICAgICAgQ1BVIDEK
MS4gcnBtX3N1c3BlbmQoKSAgICAyLiBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KG1hc3Rlci0+
cnBtX2RldikKCmlmIDIgaGFwcGVuIGJlZm9yZSAxLCBpdCBjYW4gZXh0ZW5kIHN1c3BlbmQuIDIg
aGFwcGVuIGFmdGVyIDEsIGl0IHNob3VsZApkbyBub3RoaW5nLgoKRnJhbmsKPgo+ID4KPiA+IEZy
YW5rCj4gPgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1
bnRlckBpbnRlbC5jb20+Cj4gPj4gLS0tCj4gPj4gIGRyaXZlcnMvaTNjL21hc3Rlci5jIHwgNSAr
KysrKwo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+ID4+
IGluZGV4IGJjYzQ5M2RjOWQwNC4uZGNjMDdlYmM1MGEyIDEwMDY0NAo+ID4+IC0tLSBhL2RyaXZl
cnMvaTNjL21hc3Rlci5jCj4gPj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiA+PiBAQCAt
MjcyMSw5ICsyNzIxLDE0IEBAIHN0YXRpYyB2b2lkIGkzY19tYXN0ZXJfdW5yZWdpc3Rlcl9pM2Nf
ZGV2cyhzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyICptYXN0ZXIpCj4gPj4gICAqLwo+ID4+
ICB2b2lkIGkzY19tYXN0ZXJfcXVldWVfaWJpKHN0cnVjdCBpM2NfZGV2X2Rlc2MgKmRldiwgc3Ry
dWN0IGkzY19pYmlfc2xvdCAqc2xvdCkKPiA+PiAgewo+ID4+ICsJc3RydWN0IGkzY19tYXN0ZXJf
Y29udHJvbGxlciAqbWFzdGVyID0gaTNjX2Rldl9nZXRfbWFzdGVyKGRldik7Cj4gPj4gKwo+ID4+
ICAJaWYgKCFkZXYtPmliaSB8fCAhc2xvdCkKPiA+PiAgCQlyZXR1cm47Cj4gPj4KPiA+PiArCWlm
IChtYXN0ZXItPnJwbV9pYmlfYWxsb3dlZCkKPiA+PiArCQlwbV9ydW50aW1lX21hcmtfbGFzdF9i
dXN5KG1hc3Rlci0+cnBtX2Rldik7Cj4gPj4gKwo+ID4+ICAJYXRvbWljX2luYygmZGV2LT5pYmkt
PnBlbmRpbmdfaWJpcyk7Cj4gPj4gIAlxdWV1ZV93b3JrKGRldi0+aWJpLT53cSwgJnNsb3QtPndv
cmspOwo+ID4+ICB9Cj4gPj4gLS0KPiA+PiAyLjUxLjAKPiA+Pgo+CgotLSAKbGludXgtaTNjIG1h
aWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
