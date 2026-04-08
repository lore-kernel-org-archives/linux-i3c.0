Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788E6FD5F98
	for <linux-i3c@archiver.kernel.org>; Wed,  8 Apr 2026 09:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fN6XaJnbuUnZkesejGza/69u51dKJKfi3glj/NYrzlY=; b=DdWfuaRzBZ/8BhlgqBnZ4R9Ru2
	eEXy9avU3jE2KZgFe7D0bY4J8iHc8ZXpT1/6D3BAEAoaq0QF6xjRJToA94xtBbQIOwqEUuL9C2KDI
	tkeNZhBq2SJ5+Z1UIiXiLEXMV2N2a6yvXORTXTgl4EjopU3IdIjIvHN2GK8kIeYk8QsqcyN3cuVS7
	GLuwL7RNcm2GKSwn7qVp6iH1rYZ8r98+eMZYEdK2lRvF+QeWr828CdxkLbXpCP9cVqBoM4yhx1Glu
	pHoePWFLgCA7WRCeIZqFs2dvLXnbFBipQRH3buitrv11d/tsVew+wN9iWD3eR8/d2MY9EfdY7dLam
	g1lFJcjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOrm-00000008Z6f-14CS;
	Wed, 08 Apr 2026 09:06:30 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOrj-00000008Z62-3h5l
	for linux-i3c@lists.infradead.org;
	Wed, 08 Apr 2026 09:06:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnkgFajqKSoBAR3RgLCDZnQoD4VWdp9o+ZkOhY2mgHXC342NApoAGR9mledALdqlfV87lIfZHCYEkUDRBX2bfN8K03XzZS/a9HzeZLhEma9K6Rqqhv2MqYQs3U4680m4Etsb39fbaZNvuYN64HPZZJLbA0zLk6daZstKlvAT9tnLF7eT6pfESyXzmDufFRDywuSdfx7MtqIVb7AQLI+PwvMKUa+ReGPZI4viK3mixUzl287b8kjWbIjzifRiEnTTkh6S8AombxbGG9Q0dKH1KxY4bqlcEguY/oDZwenUclID/ujl4DeAptjGwexrrRBT522tZT9OFg8kRcsgWasNcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0sLqCoXetvzywPNOWYrnMIBL4+pV2DjbvHrMeLjgMI=;
 b=ROMsXby9z11xqzA4EPMDK4c7rXijcL6PlyPMtRwz8w3z60l5qhlea2IjiP22PtQGFHhDRWuBJ+ZxPqBS5QnYpZTgSjW9b2/nRAZmlySb3PaOnrRrp8btGp/vrtufkLbFSFeeRG1oH2M5IPL2uXO2vd3K8KbNisfXPWH6xBSllol7G1bYS2sJ+DqthKimuVdexI5z88cQIeYxNqEOOtktHKnh7ERosZ7Bjp1C4oJHGV8lo0W1ozJYRIsqtQRDeJDwjd6ix4iF5oysQkzrZxM56f7QD+1d33niMaEpmFhqy/7BC7yBhCP8b9zVu3gtLM1Og9p6hbVLI7kcP7XrCQxOLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0sLqCoXetvzywPNOWYrnMIBL4+pV2DjbvHrMeLjgMI=;
 b=RLDnl6rSNgbtxA0nMnP4JmpJb3OzbvO1x8fjTvAr6GY7VWxC1voNoFHmGS27A0LCzqXom38q6UkJcpHTD1jllPpA1hDq2jGjh6ThmhjUmihE/zQtKx9urGi2bRXkxIFCB6VaQnfVv9LNj2lW1uYJbjhYzEgttHQzbqCdtBcm/DU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9828.namprd12.prod.outlook.com (2603:10b6:408:304::19)
 by CYYPR12MB8654.namprd12.prod.outlook.com (2603:10b6:930:c9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.38; Wed, 8 Apr
 2026 09:06:17 +0000
Received: from LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685]) by LV5PR12MB9828.namprd12.prod.outlook.com
 ([fe80::f132:7e75:fd38:8685%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 09:06:17 +0000
Message-ID: <f6253217-4b40-4d0e-b2cb-085c3d090b71@amd.com>
Date: Wed, 8 Apr 2026 14:36:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i3c: dw-i3c-master: Fix IBI count register selection
 for versalnet
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>
Cc: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "git (AMD-Xilinx)" <git@amd.com>, Frank Li <Frank.Li@nxp.com>,
 Joel Stanley <joel@jms.id.au>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
References: <20260401084430.436059-1-shubhrajyoti.datta@amd.com>
 <a9b3a99f42bb9d092e95b35290cf4043fc780d3f.camel@codeconstruct.com.au>
 <LV5PR12MB9828D700D168803CBD022A708151A@LV5PR12MB9828.namprd12.prod.outlook.com>
 <5cb83afcd5340a108fd5a7346494ccf73752cc27.camel@codeconstruct.com.au>
 <20260403162442668f12b7@mail.local>
Content-Language: en-US
From: "Datta, Shubhrajyoti" <shubhraj@amd.com>
In-Reply-To: <20260403162442668f12b7@mail.local>
X-ClientProxiedBy: PN3PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::10) To LV5PR12MB9828.namprd12.prod.outlook.com
 (2603:10b6:408:304::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9828:EE_|CYYPR12MB8654:EE_
X-MS-Office365-Filtering-Correlation-Id: cbc58a13-6dd6-40d4-54d3-08de954e17a4
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 5TbqCTV0/lmK6FEnP+f7Ux7WXHZOr8xwlhlsOdnKD8UlpOYnmQ/aqjdpSMmvYIsDD5upTyWevPTS0mXqAa/Iq+BfVwN3CGRNUdpK1UuR9haKinE/4ZjycF4u4G+HkXp3s4pmvRAdmu8ALwCbOf4L42+agH6Pa4glaIWq8V0zbetQhQeHryBx2lB0A5LZX8ZshLBagAniUb5ABRn8f/SQk5dZ3/vWY7C+GVOjV/OXNqMgb4/wB9xn5HZLo0WhCAoXxlUZdWoh63pNGKlvUFPh202omho/Vi9+4niXgJ95DSxPvGJC52uFAS56x3GGDzPPX1Anra1HzBODMUjI6L9enD8eDa1N2raQ199IcPY08havTNa5cY7VdIK/aCBDjHxl6Hu6Lp1XfGntOPfoqP2qK43SftEH5J4Qty0QeC2AjFHv7cIkr/bTde068swEM5ub4FQd/ihncWQ56J02jVt2zrvVofHEhYjV+whRAQR7h/CiAFaAWgtAsygjyOK9VKdmVW/0Z+09H9deOJ90HjKeVLmya2y69uOmHCBdOP7CKU0CyNLIaYZ7z50U3Dyz8ZrJNI8Dc78eUWR+lEKFDPQdLXQfmHyFff75z0lLpGwe5c3uoyHsP/04zYWDEy9BlQJ6r9dGy8rUDlUUFIyvS8/f5MNSiWV6h6UrLxH5o0J1uGOipBU3grhsiHaP+hxH7cSo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9828.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wlo4TVFMRVp4WDAvdk5keUNpaE5yNklacHlvU2lkMjl1cnd5UEg0eTZJdkFW?=
 =?utf-8?B?U0NkcFFiY096MGQ4TXhnN3phRTBCOG9BTUtaQ3FOemtHZzJiZStpbmRsRUtt?=
 =?utf-8?B?d2ZxSmFYcHFmdDd5MEJXYXdxejM5Y2l5Mnd5eTJqRUZnand3bDNyU0lpL0JN?=
 =?utf-8?B?WmMrUE9PRktWS1JYY0RwR0JEUEd6Sm4wazl0RUxzZUpocUxmYjFVZ2p1bytN?=
 =?utf-8?B?Tkc4dVluOFJIQXB5WTFwamU5cXE5dnJBdWdEM0tuODdVeGNaTVBtZ1NJbkxX?=
 =?utf-8?B?aXF6ZXNVRERWSTNkd25ndGtqK08wTjNOMVZQN1J4MEpUd2NmT1pBMEJNR1BY?=
 =?utf-8?B?N1J3Y0VCWCtjZnVmRVdqak0yaG53VUxYM25HbmlMVUxUZFovM0VRK1hOQXdS?=
 =?utf-8?B?RFVIa0VmWVYrRFA0NG5IMVBleWE1TnNqVXRUMUZTWWxHVUxRUHFub0F4bDdK?=
 =?utf-8?B?NU9wWnEyWEo2Q0VDcURIcWRNYVZsa0xQT2lxWnBYY2lidVV6U0wrS1cxRHNp?=
 =?utf-8?B?QXdMNDVsZDBDTVV6K1RMY0VGVHpWNUhaNTd5dUpmUkFYT3V5aTRMMmZ1MjFv?=
 =?utf-8?B?S3ZsVTgyNStpMTVHaThxejZZUk0yOHJPdmJYSUNUZFdET0puR25pWk9scGw4?=
 =?utf-8?B?M1lqRGwvN0xDVDRjTGxFaVJTbEJiRXJ4cjgxaDhYWitmcFVMa21YVXgrTm5T?=
 =?utf-8?B?ZzdITDh3bFNJMkg2SDVKRHRud3NlMDNqNWlOclJya0ZtQnQ1QnNhQitUcHI2?=
 =?utf-8?B?dGRwUGVJckFqNjN2dUJmcHpueHhkZ1M0Z0tNQy9oT2pGdE95bnhsYU51YnB4?=
 =?utf-8?B?UWZMTzNrZ2lvOUJ0VVhZaDF5bTR2M3JlUWhTYmdhSzF1eHFmS0hVME9ONlpt?=
 =?utf-8?B?RkJvR0E1Tm1FU2xlS1BSc3Z5THlVT1RQcGJVZ1pMWGdudzVrSzAvOTlPY1JE?=
 =?utf-8?B?S1VwQTR0eFNtL2lEUUlsc3VPR3NTa2p6dk1oRHNEMVQwWHVXZ05ya3JmUGg0?=
 =?utf-8?B?YzNCd1M5RXMzK3R0RWFiMzNPMWtRcXRSZGVBQVViaUJlUUFoSGlYZDkzRnZV?=
 =?utf-8?B?Z3VwWTJUQmJvcDRHbFoxZGtCSDhxYXZJdTBJbUN5bVhIQlB5STRiWHlqaTd4?=
 =?utf-8?B?VjVhc08rMHRDbWtSWjEwbTNmbm1rei9EbFBZOStYT0xleVFRZUU4VnBKUWlu?=
 =?utf-8?B?WEFxUWxlVGlWdEhjdE9NR0xEcTJVaXhuZ0pJejhUb0xHMTBINzZaMGNJRzZp?=
 =?utf-8?B?VXJRMS9yM2t1ZnhUdXljRUZSWTFjQkQ2bkc4TlFQTnZtRlJZRVBzSG9EOXIw?=
 =?utf-8?B?N3BTNVRFYkEycVVkZWdpYUxYQi9PbTBPU3Z1VTFEUlFLQnpnd0hoUmZDRlZE?=
 =?utf-8?B?eFZaOTNYK3NQZm41dUtmaW1BK2d0Z2MwWTI5SmdJVnY0RGJSbUhIcW1aTTN1?=
 =?utf-8?B?dFpsNEJXcWtYeElBRXRrdFVQNTBkZVFXMVdBWlZaYWpoRzFjMVc3ckxjeksy?=
 =?utf-8?B?d3ErSGl5K1VYbFNZZ0ZMMVVqV29VSGZNV3JHVXg3d2JobHoyamIzNVRRRS8v?=
 =?utf-8?B?WTVGV1RVWjdyQTI1VGhxUVZLaG9rbE5QVWlYaVcwZmhHTnZxY3BGSXY5SHZJ?=
 =?utf-8?B?aHA5bW53TlRoYXlpMEpkemJ6bmRxQ0QvWDdqRHQza1Fodm5QQVJwOU1IMlh1?=
 =?utf-8?B?RDJXUzBwQzhmajVxRHpKOFkvVW5QMldhb2htZlJnSnlUOHZVNWNFL2wwdXhy?=
 =?utf-8?B?T1RuWi90UjBZRk80UFpYcGFnQytoRlkzNnI0djY2bFc4b1g2cXU2WXVudFpI?=
 =?utf-8?B?dzgreTNGWXpReXJ1THR4ZGxpYkJ2NmZwcGRWZHNETmtNcWRZNGRwS0orUzBP?=
 =?utf-8?B?a2QyY1R3TzlmOU1XRTNySkVaVDVWcE9QUk1nMVZvRXNXZEFPSEZzNTBMbldr?=
 =?utf-8?B?dHc4TnluYVFBZTBpbXpkc0V5M1AzTlJCb0NGR0hQTEZROGZGTi8zWW1Kb1NR?=
 =?utf-8?B?UmtudEVrUGNVN29tOG84VHpNdXlkOEdJR2lCTVFBSW1EeHhqVWhSWnhDeWt4?=
 =?utf-8?B?MjFINEdhTHMyQWo4L3U5VVRiTHZtTVJLSzdmV2Z2ZEQzRFAwdXJ4NHhBdE5Q?=
 =?utf-8?B?Nzk1c1I3VG5PNWJvaVptMGJIN1JBU2NaZXc5OC9ZQktkdkxKVXlBTVg3S1JC?=
 =?utf-8?B?eEI1VUVOK1J3STVJWndJbW5sb1htRVE1MFJSNVlxQ3dxK1FKU0M4cE5BSmZo?=
 =?utf-8?B?MUVuK2UyUFgxamROc0Jmb1BDbjU1cmlQUlh3YStwRFFHUGFibTBoWk82MWJ2?=
 =?utf-8?B?TnFtUkNDYVl4ZElqMStWaWJiSndHZ1dESzl2ZDV6dURWajU1ZTk5Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc58a13-6dd6-40d4-54d3-08de954e17a4
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9828.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 09:06:17.2452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TknwbZKBhSZ7GL9LhAgZQ3CXvXGjp5o/KgZaCzVdlJwgqa/8Ju+UTefFPlucgmjXmaGBQAGp44KUF3u5KUuO+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8654
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_020627_940355_E7E8DDCB 
X-CRM114-Status: GOOD (  23.73  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Ck9uIDQvMy8yMDI2IDk6NTQgUE0sIEFsZXhhbmRyZSBCZWxsb25pIHdyb3RlOgo+IEhlbGxvLAo+
Cj4gT24gMDIvMDQvMjAyNiAxNjozMjozMCswODAwLCBKZXJlbXkgS2VyciB3cm90ZToKPj4gSGkg
U2h1YmhyYWp5b3RpLAo+Pgo+Pj4+IEhvdyBhcmUgeW91IGJpbmRpbmcgdGhlIGRyaXZlciB0byB0
aGlzIGRldmljZT8gQXJlIHlvdSB1c2luZyBhIHVuaXF1ZSBPRgo+Pj4+IGNvbXBhdGlibGUgc3Ry
aW5nLCBvciBzb21ldGhpbmcgQUNQSS1iYXNlZD8KPj4+Pgo+Pj4+IC4uLiBhbmQgaWYgdGhhdCBj
YW4gYmUgc3BlY2lmaWMgdG8gdGhpcyBoYXJkd2FyZSBpbnN0YW5jZSwgd291bGQgdGhhdCBiZSBh
bgo+Pj4+IGVmZmVjdGl2ZSBtZWNoYW5pc20gdG8gc2VsZWN0IHRoZSBJQkkgcmVhZCBtZXRob2Qg
aW5zdGVhZD8KPj4+IEhpIEplcmVteSwKPj4+Cj4+PiBWZXJzYWxOZXQgY3VycmVudGx5IHVzZXMg
dGhlIGdlbmVyaWMgInNucHMsZHctaTNjLW1hc3Rlci0xLjAwYSIKPj4+IGNvbXBhdGlibGUgc3Ry
aW5nIOKAlCB0aGVyZSBpcyBubyB1bmlxdWUgY29tcGF0aWJsZSBzdHJpbmcgZm9yIHRoaXMKPj4+
IGhhcmR3YXJlIGluc3RhbmNlLiBUaGUgRFRTICAgIGVudHJ5IGxvb2tzIGxpa2U6Cj4+Pgo+Pj4g
ICAgY29tcGF0aWJsZSA9ICJzbnBzLGR3LWkzYy1tYXN0ZXItMS4wMGEiOwo+PiBZb3Ugc2hvdWxk
ICphbHdheXMqIGhhdmUgYSB1bmlxdWUgY29tcGF0aWJsZSBzdHJpbmcgZm9yIGVhY2ggZGV2aWNl
Cj4+IGluc3RhbmNlLCBpZiB0aGVyZSBjYW4gYmUgYW55IHZhcmlhdGlvbiBpbiBiZWhhdmlvdXJz
IGZyb20gdGhhdCBnZW5lcmljCj4+IG9uZSAod2hpY2ggeW91IGNlcnRhaW5seSBkbyBoYXZlIGhl
cmUpLgo+Pgo+PiBZb3UgY2FuIHN0aWxsIGZhbGwtYmFjayBvbiBhIGdlbmVyaWMgb25lLCBidXQg
dXNpbmcgdGhhdCBhcyB5b3VyIG9ubHkKPj4gY29tcGF0aWJsZSB2YWx1ZSBtZWFucyB5b3UgY2Fu
J3QgZG8gZGV2aWNlLXNwZWNpZmljIGJlaGF2aW91cnMgaW4geW91cgo+PiBkcml2ZXIsIGFzIHlv
dSBoYXZlIGp1c3QgZm91bmQuCj4+Cj4+PiAgICBXZSBjb3VsZCBpbnRyb2R1Y2UgYSBWZXJzYWxO
ZXQtc3BlY2lmaWMgY29tcGF0aWJsZSB3aXRoIGEgZ2VuZXJpYyBmYWxsYmFjazoKPj4+Cj4+PiAg
ICBjb21wYXRpYmxlID0gInhsbngsdmVyc2FsbmV0LWR3LWkzYy1tYXN0ZXIiLCAic25wcyxkdy1p
M2MtbWFzdGVyLTEuMDBhIjsKPj4gWWVzLCB5b3Ugd2FudCB0aGF0IGFueXdheS4KPj4KPiBJIGFn
cmVlIHlvdSBuZWVkIGEgVmVyc2FsTmV0LXNwZWNpZmljIGNvbXBhdGlibGUgc3RyaW5nLgo+Cj4+
PiAgICBhbmQgcGFzcyBhIHF1aXJrIGZsYWcgdmlhIG9mX2RldmljZV9pZC5kYXRhIHRvIHNlbGVj
dCB0aGUgSUJJIHJlYWQgbWV0aG9kLgo+PiBFeGFjdGx5LCBhbmQgdGhlcmUgaXMgYWxyZWFkeSB0
aGUgc3RydWN0IGR3X2kzY19kcnZkYXRhIHRvIGhlbHAgd2l0aAo+PiB0aGlzLgo+Pgo+Pj4gSG93
ZXZlciwgdGhlIHByb2JlLXRpbWUgZGV0ZWN0aW9uIGF2b2lkcyBoYXZpbmcgdG8gZW51bWVyYXRl
IGFsbCBhZmZlY3RlZAo+Pj4gdmFyaWFudHMg4oCUIHRoZSBJQ19IQVNfSUJJX0RBVEE9MCBjb25m
aWd1cmF0aW9uIGlzIGEgc3ludGhlc2l6YWJsZQo+Pj4gb3B0aW9uIGluIHRoZSBJUCBhbmQgbWF5
IGFwcGVhciBpbiBvdGhlciBTb0NzIHVzaW5nIHRoZSBzYW1lIGNvcmUuCj4+Pgo+Pj4gRG8geW91
IGhhdmUgYSBwcmVmZXJlbmNlPyBJZiB0aGUgRFRTIGNoYW5nZSBpcyBhY2NlcHRhYmxlLCBJIGNh
biBnbwo+Pj4gd2l0aCB0aGUgY29tcGF0aWJsZSArIG1hdGNoLWRhdGEgYXBwcm9hY2gKPj4gVGhh
dCB3b3VsZCBjZXJ0YWlubHkgYmUgbXkgcmVjb21tZW5kYXRpb24uCj4+Cj4+IElmIGl0J3MgYSBz
eW50aGVzaXNhYmxlIG9wdGlvbiwgaXQgbWF5IGV2ZW4gYmUgd29ydGggYWRkaW5nIGFzIGEgZmxh
ZyB0bwo+PiB0aGUgYmluZGluZyBkZWZpbml0aW9uIChhbG9uZyB3aXRoIHRoZSBzYW1lIGZvciBv
dGhlciBvcHRpb25zIHRoYXQgbWlnaHQKPj4gYmUgcHJlc2VudCkuIFRoaXMgd291bGQgbWVhbiB5
b3UgZG9uJ3QgbmVlZCBhLXByaW9yaSBrbm93bGVkZ2Ugb2YgdGhlCj4+IG1hcHBpbmcgb2YgY29t
cGF0aWJsZSBzdHJpbmdzIHRvIHRoZWlyIHN5bnRoZXNpcyBvcHRpb25zLgo+Pgo+PiBJIGRvbid0
IGhhdmUgYW55IGFjY2VzcyB0byBkb2N1bWVudGF0aW9uIG9uIHRob3NlIG9wdGlvbnMgdGhvdWdo
LCBzbwo+PiBjYW4ndCBiZSBvZiBtdWNoIGhlbHAgd2l0aCBkb2luZyB0aGF0Lgo+Pgo+Pj4gSG93
ZXZlciBJIHRob3VnaHQgdGhhdCBkZXRlY3RpbmcgaXQgd2lsbCBiZSBoZWxwZnVsIGZvciBiYWNr
d2FyZCBjb21wYXRpYmxlLgo+PiBHaXZlbiBpdCBkb2Vzbid0IHdvcmsgYXQgdGhlIG1vbWVudCwg
dGhlcmUgc2hvdWxkbid0IGJlIGFueSBiYWNrd2FyZHMKPj4gY29tcGF0IGNvbmNlcm5zLCBJIHRo
aW5rPwo+IEkgZ3Vlc3MgdGhlIHByb3Bvc2VkIHNvbHV0aW9uIHdvcmtzIGFzIHdlIGNhbiBwcm9i
ZSB0aGUgSFcgdG8ga25vdyBob3cKPiBpdCB3YXMgc3ludGhlc2lzZWQuIEl0J3MgZ29vZCB0byBi
ZSBhYmxlIHRvIGF2b2lkIGhhdmluZyBkZXZpY2UgdHJlZQo+IHByb3BlcnRpZXMgZm9yIHRoaW5n
cyB3ZSBjYW4gZGlzY292ZXIuCgpJIHNlZSB0aHJlZSBwb3NzaWJsZSBhcHByb2FjaGVzIGhlcmU6
CgogMS4gU29D4oCRc3BlY2lmaWMgfGNvbXBhdGlibGV8KGUuZy4gVmVyc2FsTmV0IGRldGVjdGlv
bikKICAgIFVzZSBhIGRlZGljYXRlZCBjb21wYXRpYmxlIHN0cmluZyB0byBpZGVudGlmeSBWZXJz
YWxOZXQgYW5kIGFkanVzdAogICAgdGhlIGJlaGF2aW9yIGFjY29yZGluZ2x5LgogMi4gRHluYW1p
YyBydW50aW1lIGRldGVjdGlvbiAoY3VycmVudCBhcHByb2FjaCkKICAgIFRoZSBjdXJyZW50IHBh
dGNoIGF0dGVtcHRzIHRvIGluZmVyIHRoZSBhYnNlbmNlIG9mIElCSSBwYXlsb2FkIGRhdGEKICAg
IGR5bmFtaWNhbGx5LCB3aXRob3V0IHJlbHlpbmcgb24gRFQgaW5mb3JtYXRpb24uCiAzLiBFeHBs
aWNpdCBEVCBwcm9wZXJ0eSAofGhhcy1uby1pYmktZGF0YXwpCiAgICBJbnRyb2R1Y2UgYSBib29s
ZWFuIGRldmljZeKAkXRyZWUgcHJvcGVydHkgdG8gZXhwbGljaXRseSBkZXNjcmliZSB0aGUKICAg
IGhhcmR3YXJlIGNhcGFiaWxpdHkgdGhhdCBubyBJQkkgcGF5bG9hZCBkYXRhIGlzIHByb3ZpZGVk
LCBhbmQgdXNlCiAgICB0aGF0IHRvIGRyaXZlIHRoZSBiZWhhdmlvci4KCkNvdWxkIHlvdSBwbGVh
c2UgYWR2aXNlIHdoaWNoIGFwcHJvYWNoIHdvdWxkIGJlIHByZWZlcnJlZD8KQWxzbywgaWYgb3B0
aW9uICgyKSBpcyBjb25zaWRlcmVkIGFjY2VwdGFibGUgYW5kIHRoZXJlIGFyZSBubyBmdXJ0aGVy
IApjb21tZW50cywgY2FuIHRoaXMgcGF0Y2ggYmUgY29uc2lkZXJlZCBmb3IgbWVyZ2luZz8KCgoK
Cj4KPgo+IC0tCj4gQWxleGFuZHJlIEJlbGxvbmksIGNvLW93bmVyIGFuZCBDT08sIEJvb3RsaW4K
PiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cHM6Ly9ib290bGlu
LmNvbQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1p
M2MK
