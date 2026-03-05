Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE16F3D319
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Mar 2026 15:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EwbEvrxiXkc9c+YW3wdRd3YGYI6wqtv6Mpsq6RNNUag=; b=lH7aYoJ8fEElbk
	O0VfrzgYnXDsmGZYh7+Mby/Z+1csMbF0Ze7Y2aEEmADUK7YbI4xc59DeuQ5Sc8GnlmCYp9wJr2sXj
	grKTOHyjWtKpBsoFzah1/AQbLDRS6RlDMm3rYi43GIMQEBiqIz5JCaz/FS2XBdH8gShh1Zvx2CSUb
	2jKvPdkAyrKjbjyYakq1DtVNSs4wf5crLBbCRD0jwQe7dhF6cQsTSHdiFtOS3a3QZihuLi4UAjW2H
	hmN93ANlkdy9fjEZTs3SOZdaKKVUudtCyzbV1xu75j4gl12H6jGBFlmr0zpah61CgHGHwN87G0lTM
	bEokJ6aGQmkDt0leHAWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyB0C-000000029rg-10lg;
	Thu, 05 Mar 2026 15:52:40 +0000
Received: from mail-westeuropeazon11013031.outbound.protection.outlook.com ([52.101.72.31] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyB09-000000029rK-1Oe3
	for linux-i3c@lists.infradead.org;
	Thu, 05 Mar 2026 15:52:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ek5b8m3T5S1msC3WFNOo1H4TbDrPzyE7+pNJItqqWphE93QUj2CkySsCXorXAlsrVnS2s4uJgQakq2/o5M3Rkeub9h8Vk7I1oBtEHry6ZaGDqiKlkNOSdYaSjqVtLCm+yDfTzLWxkDHRSf0iYf/Xoi97eRCwSQ8TvqbXbLC0MfuDhJeKPuJiu/U+2UoQTR0MvY9JUYHxkKol5RhwoyhZjEz3VhVfJ9OUrKDIQKly+oGaS7D4+ihskrEXCNZhb+U/+Y/qhZNbn2SPIfPZB8s/HXP5MVUanqRAsyER4u3iT/n7cG/SNz/TlkCBioy718bLVsCWiDpakJDlnCmcT20SYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgF+KNdc76HLR2XmQaiQ0G3ZXCiYnfy2S+HXU9KbocM=;
 b=CJ/IDC65pDMZ9z9y4CxLgIOc+dtZRNZnwCsq3310l4WPVFrmHyXz71IkUu5cDnuGSwmHlh38Qx3MFD5GAlx1Py+l7YsqjlQy2uSat9ZRYxltQmm3fEq76g2AOnw3hN9u2aalSOOBMyBp57aIya7cVQK1rXl2XTR1ifxjGgwXqYAPmeT1PBNmhdZ0MLGk9EG+Gicl8IDcB12D0exeq3HMGjVUorup+oxx+DXZck5yXe5FfuKyDWHpKTOqxcnbaliarlnMDIdNgK7nAgTBrFho5qyC3kJ7Vh3jowTso1nYJzVN6dc7BfDkYTFblsqBbVwqSNCsfUwuXvdt2myd9rUZ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgF+KNdc76HLR2XmQaiQ0G3ZXCiYnfy2S+HXU9KbocM=;
 b=fHliMBPvAaXs3TuDeJhbHEVTOgBvD7c0g3zgaNOCPRflf54UsTxgYbpYuVxdXb66H9xWDPTYjjD/dNlyucwu/giaYarHy4kmPx+VVSK4wvjAbffqfjFFRpD2e2u/PikY5pclDmLd7RcRqFq1i7UBM3alTlVR06fJAhBC7eQ3GjhJq4N3ESxqOwFKaseTqFgIj7j4rCBjbl+NZ88atrQCJdupxO+YF93K2/5AxOxZO277MFHvEKya9LUQ89I+WA1mRIGj1aKSnseyzFD/FPSaEj8l+6y8x4YC/IMjdd+6Kkv/MKIDbFiipRbIcCUXqFUg35xgbqUJfM7Ux4yfP4wZrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8120.eurprd04.prod.outlook.com (2603:10a6:20b:3f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 15:52:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Thu, 5 Mar 2026
 15:52:33 +0000
Date: Thu, 5 Mar 2026 10:52:27 -0500
From: Frank Li <Frank.li@nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2 06/14] i3c: mipi-i3c-hci: Fix race in DMA ring dequeue
Message-ID: <aammuxTd7opQ7de6@lizhi-Precision-Tower-5810>
References: <20260304181706.143841-1-adrian.hunter@intel.com>
 <20260304181706.143841-7-adrian.hunter@intel.com>
 <aaiPcEN4D3uFGeXF@lizhi-Precision-Tower-5810>
 <3a7eb9fe-f5bc-42ed-9cb1-c3aa8287ce4b@intel.com>
Content-Disposition: inline
In-Reply-To: <3a7eb9fe-f5bc-42ed-9cb1-c3aa8287ce4b@intel.com>
X-ClientProxiedBy: SA1P222CA0179.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::9) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: f4e9140d-05d5-459a-ff94-08de7acf36e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|366016|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: /3qe3rTIQrTpfS62gHdTGGmtnaeIge8gzRaDqAF1D4BQp81kPRM4ubuTuQaPM33xaL+ehn1b0PV+BovK1Lt/ygKqVYXd22Ta1//kukJ9sIZ/vvDktW37BD87kV3739tZoiuXuXqnUOOjiF7MjkZFHdd9Vi6hKMAe7+nmckatht2+fycZfUP5+M35/AEYMdPU1qw1RnRU34L7ccJ488NWTy7bJmxHRdfsY97ipTDG563bNtKZXuUwBSAgFPvUYyY9xT+++l4j2Pk3/P6TVE4XbrEem7jZ/28OCQ42kg3YMPL/zerMTBe0L2fgaus9teNCgW9boBJczIGatT5gUxexrRmmFOpXm4cN6b5JO01qVtUW25Ps5VKePmUekdOoE0Qi4BNJiYfoqbrmKnxJXR0uw8m0uSMbwhayHRFAxtlBSE1JuP5PiirDWwGlSfygvAZOs0qR8Tz+Y3f68AUQTpHgffGXOaAug5YHs28F0Z+0U+voQZKkiCWorJO+IlVydf2jmuREPfXMgQnJg5DBUkaylmCyIyqA1BIiUVxhc1Te0dDWH70+QgFXxWot+F8mBT1jsjM8RWTWh3vnrPs9Yd11QeJz4SZjOQGF1Ck8mg9YAc32UraxjdkYAom044qtclzeiv4K1SGc7xm7w6hKf5rpIacsst4RdA8M5gu9ux2Q//j9lDN00jvdPqYaEuTOrmBR9Dd0zWjvc0lYQ8WEZXgWfIQd8CvNtdJb0Wfj6kjogyMCYDWblYRzNHYRbJSv3F9ML2hVQix/RlQiGrgJEbjh5ZPgt9m2h7oovaKvyrGj1KM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWx2L29vM2hqM2pxallMV2NDRmZkRmhkSkdwNHF0SjJWaHJvWWxCSm4vejlJ?=
 =?utf-8?B?cVVRM0hhNUZCcFVGemthZTZjalZESE1NYlZ2MU9JRlJWcWMzR2ZCMWpDa1dm?=
 =?utf-8?B?S0p4dTh3M2c2bTh6TnQ1Q013eXh0YUhvbFE3TzJlanYvMk9GTklYRE01K2F5?=
 =?utf-8?B?R0FZTDJnQ09Ib1crdVJnK2hOSUMzZ241T3l2YXA2cjlMeXJJME9BSU16TDhw?=
 =?utf-8?B?Nkx1WEJsNU1zNEhxdTN6Ly9jVFF6cjN0alRNNldWdWRobzI2UGU0eXJsZjlM?=
 =?utf-8?B?eW1zVGVRNXZVMm50LzB6NjFpbmFmTXFGY1B2MU5JUldobEVySDZKZ2ZweVI5?=
 =?utf-8?B?UTIxTXZLc0Q1U1ZYNmp5bGx5ZGxvbmRqdzc0VWVtZk00TVdHdlJBV0FmQnhB?=
 =?utf-8?B?ZE4yWHZGajdZNVRyUlRQMU5XY2l2a0VJS0Jxcm1GQ0JVRmxKajBhTm1vYUQw?=
 =?utf-8?B?VUNWY3dCd1BKZk11SXZ6cHJ3VzA5TGJRYjR0ekNpeEp3RUVDN0Q1cThKeTU2?=
 =?utf-8?B?Z0pYbWVta3hkNGExSHlZRHZQQ3BqUUhEclgycHlSMTNWYTJHam83QVhncyth?=
 =?utf-8?B?RTFMZmV0NHVDYkFadmU5b2x1SFFWb05ac1lVT0NWYkRRdlhaMzFmOGRkNVBK?=
 =?utf-8?B?SlR2MnlYMEd5ZW1EdXRqOHR3aXpGM0oxZ0h5b2FCL09tUFpVNEFlQVVQY3Zw?=
 =?utf-8?B?bkxEL0ZUL3dUcmtiSU1SeFpXalk4QUIxWkNKT3FPVUZiR2cwbkJQOURXTlhT?=
 =?utf-8?B?L3gyaDdVRlF0Y2J2VTlkc2Z2S1hpYXJ1RzdQNTJ3OW41L3dEYU9ZV2pqYXdk?=
 =?utf-8?B?ZXQvVmN1NXU0d1VucUZaQ01tekowS1pTbDJnUUhDck5CRUl2eDRPL0d0aW9D?=
 =?utf-8?B?WWs5bTNWTklvcTZCSE41K21tODVySC9MdVN3MVNJYnllZnhoMnpycmlKSTE3?=
 =?utf-8?B?Z3ZmSVc1RGRKbEVoOW02RDZGcXBCSkloNTlIWFEreXNBaitJd0lDeEZwdTRN?=
 =?utf-8?B?QjdWUUkra3p4UmJmekpPYW1Kb3FSYit3cExPWUJXUVc5V0lnTXFUd2hmMzFC?=
 =?utf-8?B?YkJadEJEQjVYNEV3ek5HNzllYmNTOGpnVEl6UnMxTjdCNG9jWWJpS3pCN2FG?=
 =?utf-8?B?TVdtK204U3NtbXBNTUVyN2p0ZkhMbjJRQXZZNVBvQ2ZCeEsxZTBLUC9CN1Vz?=
 =?utf-8?B?L05icUpteDRZSFdTQ0JZUXozU093SytVYlBlalhiUk1DMDlma21JSnBGemll?=
 =?utf-8?B?SG1vNTFMRVNVR2NiV2ZxU01mdEIxV0VweFY5aE4xWk1QcHBxZFlqNGt5WUtH?=
 =?utf-8?B?b1VReXpETzdtRVFGVUllTEQ2T2VIV0FTUVNVeExmYm9SV2lJdEFpOEpaWCs5?=
 =?utf-8?B?NEpzSkJpTkRLdVhNZkQyYmV6cTYwRkUzWEhGdVdtMElJSktlaFVoRzVlazdi?=
 =?utf-8?B?T3hIbzFHZzlKS3dqTjc2eGZhSkRlYUFHQmdiOGExcWdQS3gzL2l4cXFhUXFZ?=
 =?utf-8?B?a3BEU3kwTFNqVzAyZ3AwK3hYRHhXY0M0R1kyR3l3V3IrbFJHV2dUOHNIOC9l?=
 =?utf-8?B?SWk0aXJjaldPaUFyV1F3bTN3cEt5N1RxQ3B6dU1ubnRnVU1RazVSV3hTNXhZ?=
 =?utf-8?B?M2JMaEtWdUh2RkxaazQwU0xUUVl1WTFaV1IzemlTTkxaM0sveVYyd1J4eE9O?=
 =?utf-8?B?MVZYd1FWaVBycVl6RjlhcEpqajlBL1NWcmRFVGNsWHpEQ3A3WGVkRTJlQlJ0?=
 =?utf-8?B?QWVaWFFRdDhZU0JjWDhaWjA3b0ZQNFoxejhmd2FVZmRTTlphWFJ6amRNVm1j?=
 =?utf-8?B?VnNscE1IVS8wL3BUdzlpU1VMK3RtOEhEcGg5S0RLOWdrWFhadUNPUXhZMDlC?=
 =?utf-8?B?aktGd01yTEhDSnA1SU5kaTVMeG5QL1Y5TGJCWmtuL0RoV0pWSEtvL1ZndWlB?=
 =?utf-8?B?SnFUSWs2dnpBOGpwVWcvMVN5WWtERXQwMFg2ZGRFcmp5dEp5alJKcEpCSkRh?=
 =?utf-8?B?WUlKT1Nxb0Y2VnhJK052ZG5JbUNSVmxTSVZ6VWpuejNXbEtLeHpsRGhRc0gy?=
 =?utf-8?B?cEUybWhLTVdpaFJVU2oxSFdKQkNhbHJjdFVOTytiZmxKaWM2eW9LUHlLUTVH?=
 =?utf-8?B?ZDFZVkxsb3YzOXVrbnN4dURTUDRiSE80RUxYYzY0RUYzR1dkQitmNkxSMnYv?=
 =?utf-8?B?RGVGUFB3dWRxL09uY1ZyNVNIZWpScGNMSFE2TUNUNDBYSFNDM0J2V0ZLQkNi?=
 =?utf-8?B?TjhlMGRBOENGV1ZaN2lrQnNXNThLeVdmN0oyV3FqenJ0eEtUU2g3VzFPRHNP?=
 =?utf-8?Q?QA716tTegfuaKtgVx0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e9140d-05d5-459a-ff94-08de7acf36e6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 15:52:33.2869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHlJL0tnAG7TaETknlHZuypUkmmyRDEkoCb5Soe0FkuyIo4GbRbipwcpWgPXimJWBufzJpXwqCTjzcGJUz26PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_075237_395472_D394B9EF 
X-CRM114-Status: GOOD (  32.39  )
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

T24gVGh1LCBNYXIgMDUsIDIwMjYgYXQgMTI6MTM6NDNQTSArMDIwMCwgQWRyaWFuIEh1bnRlciB3
cm90ZToKPiBPbiAwNC8wMy8yMDI2IDIyOjAwLCBGcmFuayBMaSB3cm90ZToKPiA+IE9uIFdlZCwg
TWFyIDA0LCAyMDI2IGF0IDA4OjE2OjU3UE0gKzAyMDAsIEFkcmlhbiBIdW50ZXIgd3JvdGU6Cj4g
Pj4gVGhlIEhDSSBETUEgZGVxdWV1ZSBwYXRoIChoY2lfZG1hX2RlcXVldWVfeGZlcigpKSBtYXkg
YmUgaW52b2tlZCBmb3IKPiA+PiBtdWx0aXBsZSB0cmFuc2ZlcnMgdGhhdCB0aW1lb3V0IGFyb3Vu
ZCB0aGUgc2FtZSB0aW1lLiAgSG93ZXZlciwgdGhlCj4gPj4gZnVuY3Rpb24gaXMgbm90IHNlcmlh
bGl6ZWQgYW5kIGNhbiByYWNlIHdpdGggaXRzZWxmLgo+ID4+Cj4gPj4gV2hlbiBhIHRpbWVvdXQg
b2NjdXJzLCBoY2lfZG1hX2RlcXVldWVfeGZlcigpIHN0b3BzIHRoZSByaW5nLCBwcm9jZXNzZXMK
PiA+PiBpbmNvbXBsZXRlIHRyYW5zZmVycywgYW5kIHRoZW4gcmVzdGFydHMgdGhlIHJpbmcuICBJ
ZiBhbm90aGVyIHRpbWVvdXQKPiA+PiB0cmlnZ2VycyBhIHBhcmFsbGVsIGNhbGwgaW50byB0aGUg
c2FtZSBmdW5jdGlvbiwgdGhlIHR3byBpbnN0YW5jZXMgbWF5Cj4gPj4gaW50ZXJmZXJlIHdpdGgg
ZWFjaCBvdGhlciAtIHN0b3BwaW5nIG9yIHJlc3RhcnRpbmcgdGhlIHJpbmcgYXQgdW5leHBlY3Rl
ZAo+ID4+IHRpbWVzLgo+ID4+Cj4gPj4gQWRkIGEgbXV0ZXggc28gdGhhdCBoY2lfZG1hX2RlcXVl
dWVfeGZlcigpIGlzIHNlcmlhbGl6ZWQgd2l0aCByZXNwZWN0IHRvCj4gPj4gaXRzZWxmLgo+ID4+
Cj4gPj4gRml4ZXM6IDlhZDlhNTJjY2UyODIgKCJpM2MvbWFzdGVyOiBpbnRyb2R1Y2UgdGhlIG1p
cGktaTNjLWhjaSBkcml2ZXIiKQo+ID4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gPj4g
U2lnbmVkLW9mZi1ieTogQWRyaWFuIEh1bnRlciA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+Cj4g
Pj4gLS0tCj4gPj4KPiA+Pgo+ID4+IENoYW5nZXMgaW4gVjI6Cj4gPj4KPiA+PiAJTXV0ZXggbm93
IGRlZmluZWQgaW4gc3RydWN0IGkzY19oY2kgaW5zdGVhZCBvZiBzdHJ1Y3QgaGNpX3JoX2RhdGEK
PiA+Pgo+ID4+Cj4gPj4gIGRyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jIHwg
MSArCj4gPj4gIGRyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvZG1hLmMgIHwgMiArKwo+
ID4+ICBkcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2hjaS5oICB8IDEgKwo+ID4+ICAz
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jIGIvZHJpdmVycy9pM2MvbWFzdGVy
L21pcGktaTNjLWhjaS9jb3JlLmMKPiA+PiBpbmRleCBmYWY1ZWFlMjQwOWYuLjA2MWU4NGE1YzQx
MiAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2NvcmUu
Ywo+ID4+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9taXBpLWkzYy1oY2kvY29yZS5jCj4gPj4g
QEAgLTkyNyw2ICs5MjcsNyBAQCBzdGF0aWMgaW50IGkzY19oY2lfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikKPiA+PiAgCQlyZXR1cm4gLUVOT01FTTsKPiA+Pgo+ID4+ICAJc3Bp
bl9sb2NrX2luaXQoJmhjaS0+bG9jayk7Cj4gPj4gKwltdXRleF9pbml0KCZoY2ktPmNvbnRyb2xf
bXV0ZXgpOwo+ID4+Cj4gPj4gIAkvKgo+ID4+ICAJICogTXVsdGktYnVzIGluc3RhbmNlcyBzaGFy
ZSB0aGUgc2FtZSBNTUlPIGFkZHJlc3MgcmFuZ2UsIGJ1dCBub3QKPiA+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9kbWEuYyBiL2RyaXZlcnMvaTNjL21hc3Rl
ci9taXBpLWkzYy1oY2kvZG1hLmMKPiA+PiBpbmRleCA3NGIyNTVhZDZkMGYuLmY3ZDQxMWU1ZTEx
ZiAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL2kzYy9tYXN0ZXIvbWlwaS1pM2MtaGNpL2RtYS5j
Cj4gPj4gKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL21pcGktaTNjLWhjaS9kbWEuYwo+ID4+IEBA
IC01NDcsNiArNTQ3LDggQEAgc3RhdGljIGJvb2wgaGNpX2RtYV9kZXF1ZXVlX3hmZXIoc3RydWN0
IGkzY19oY2kgKmhjaSwKPiA+PiAgCXVuc2lnbmVkIGludCBpOwo+ID4+ICAJYm9vbCBkaWRfdW5x
dWV1ZSA9IGZhbHNlOwo+ID4+Cj4gPj4gKwlndWFyZChtdXRleCkoJmhjaS0+Y29udHJvbF9tdXRl
eCk7Cj4gPj4gKwo+ID4KPiA+IGlmIGRlcXVldWUgdXNlIG11dGV4LCBlcXVldWUgYWxzbyBuZWVk
IHVzZSB0aGUgc2FtZSBtdXRleCBwcm90ZWN0IHRvIG1ha2UKPiA+IHN1cmUgbm8gZXF1ZXVlIGhh
cHBlbiBkdXJpbmcgZGVxdWV1ZS4gT3IgeW91IGNhbiBndWFyYXRlZSBlcXVldWUgbmV2ZXIKPiA+
IGhhcHBlbiB3aGVuIGRlcXVldWUuCj4KPiBUaGVyZSBhcmUgc2V2ZXJhbCBvdGhlciBpc3N1ZXMg
aW4gdGhpcyBhcmVhLCBhbmQgdGhleSB3aWxsIGJlCj4gYWRkcmVzc2VkIGluIGxhdGVyIHBhdGNo
IHNldHMuCj4KPiBGb3IgdGhpcyBzcGVjaWZpYyBjYXNlLCB0aGUgZW5xdWV1ZSBwYXRoIGlzIGFs
cmVhZHkgcHJvdGVjdGVkCj4gYnkgdGhlIGV4aXN0aW5nIHNwaW5sb2NrLCBhbmQgd2Ugd2FudCB0
byBrZWVwIHRoYXQgcGF0aCBhcyBsaWdodHdlaWdodAo+IGFzIHBvc3NpYmxlLiAgIEFkZGluZyBh
IG11dGV4IHRoZXJlIHdvdWxkIHVubmVjZXNzYXJpbHkgcGVuYWxpemUgdGhlCj4gY29tbW9uIGZh
c3QgcGF0aCwgc28gaXQncyBub3QgdGhlIHJpZ2h0IHRyYWRl4oCRb2ZmLgo+Cj4gQWxzbywgdGhl
IEFCT1JUIGhhbmRsaW5nIGlzIG9ubHkgcmVsZXZhbnQgd2hlbiBhIHRpbWVvdXQgb2NjdXJzCj4g
d2hpbGUgdGhlIHJpbmcgaXMgc3RpbGwgcnVubmluZy4gIFRoYXQgc2l0dWF0aW9uIG9ubHkgYXJp
c2VzIHdoZW4gdGhlCj4gdGltZW91dCB2YWx1ZSBpcyB0b28gYWdncmVzc2l2ZSBvciB0aGUgY29u
dHJvbGxlciBlbmRzIHVwIHN0dWNrIC0gYm90aAo+IG9mIHdoaWNoIGFyZSByYXJlLiAgQ29tcGFy
ZWQgdG8gb3JkaW5hcnkgZXJyb3IgY29uZGl0aW9ucyAoZS5nLiBhIE5BQ0spCj4gdGhhdCBzdG9w
IHRoZSByaW5nIGltbWVkaWF0ZWx5LCB0aGlzIHJhY2UgaXMgbG93ZXIgcHJpb3JpdHkuCj4KPiBU
aGlzIHBhdGNoIHNldCBpcyBhbHJlYWR5IHF1aXRlIGxhcmdlLCBzbyBpdCBtYWtlcyBzZW5zZSB0
byBkZWZlcgo+IGJyb2FkZXIgY29vcmRpbmF0aW9uIGNoYW5nZXMgdG8gYSBmb2xsb3figJF1cCBz
ZXJpZXMuCgpNYWtlIHNlbnNlLgoKUmV2aWV3ZWQtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAu
Y29tPgo+Cj4KPiAtLQo+IGxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKPiBsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtaTNjCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWkzYwo=
