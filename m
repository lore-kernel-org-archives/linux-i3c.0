Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE6EC5DF7E
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Aug 2026 11:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SW+a/jeZjtOotK/neaHRmk+92pdV2wpYNFAf7QuAgSs=; b=e4PMsObr1x9jTO+8dlk0LapYT3
	Zh9p1VwWuXVE9sJEPaEFEengEP6KyBbo60kvsEWjvs83aaAGkPmKzijQS7Vul4VJZc/Gp+uSuwKy6
	uqz6pw63i1Wn+nzVzlHhr67OUWQ9VSnq/5vdu16JDvcAvUIUmByjVRrTatXvdHfYFGaROl7pDLhs2
	GRXmTAmorD+Csicfh13SfKSy/p6jQHWDvFGatTduW9G6b3dewDIz6hXkHmlEauUlQ89vMYi8Mv+z3
	85xFBiLvSPdBim9izbImWV7pUmcIpO1emzEjl9LN2XW9K07DI0sppr/12B7BQkz5Eg23hT1aOvWy4
	ykcBM+Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwITp-00000007tEi-3Tv1;
	Tue, 18 Aug 2026 11:59:45 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwITl-00000007tED-3wJW
	for linux-i3c@lists.infradead.org;
	Tue, 18 Aug 2026 11:59:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGm2zRnI2CTpkDkeKf75xrBt3TGj4aHqtkc/9ibNBi92APRqlBmnaoCRVH+uyJRUIKr09xAIt3b9/Bs6Mom+HUgFljw7ah6CKmONZhwGzgNqKMpE/c8v+ozA3oA+nYvWAq0STPueKE5/61Vd/FQGJi0vUekPIHr+72/ZxKVUYzrNls9/wo4ve/3hcw8NofRhyCpeni95EhvmF25LJHttm9IEM2mFiEMn4FcUgW9Jquc5Hspy+KXwV6I/s9nIC6BIZb26IxH3gHffPHd2WSo0yzjElljCqg3reJGSNzfXZ3RBC/c1pWocCb4ryRMn4UWdYPI/+e5g18+EKq8LyQKzjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTe9CRhhQqvm0I5Bf+cGJyQBi2xKvzdJ5z9uNF/aiD4=;
 b=aJqLReRHCg7CqBFkkYGFIHIpTfzsZpSV8fx8Z6T3DIbxH0JK0mjg0AmU6uq+OJXdG8RefjQl+SuoAvX39sXNCYlegzqGwdWMxdX2Vzmpn0dE1atqLrrNdskS5FGCHvet4bdOe4nkPKNzlygNSoi5SB+0eeWAyAMcwmb/yFzRbeCPxfQM0R6uM9ZVQZO5jehwtcpVqm56mgSAGv8nNk4GY+MmUF6dzVqbj+tplqK6DB+ZqCI7H8OBJWVo+lcHvus3soSB6on/5d5v8tRSo9LLeiqDiD7Kb5mTN7ksT9kZtQZzrIggWs4c12T6VZ9ccYSr8GJ8CEyI1hU1zph/mPHQ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTe9CRhhQqvm0I5Bf+cGJyQBi2xKvzdJ5z9uNF/aiD4=;
 b=NSEEQnoumKC9KSlTLJre2Da0M2h3cAPcgT18qEJJ6yexfG0Y/du4cBdXJD9Kz3a1PzLELV+PAr+9jUJhFW1P183rqyioBmMMdYTcDT3ieAKgeAAit6hdDBlH+oXrM/DyspWC9ebC63ZqcSkXRye1KqmqxSw7WnTR1tjusjrVePM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13)
 by IA1PR12MB7567.namprd12.prod.outlook.com (2603:10b6:208:42d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 11:59:27 +0000
Received: from IA1PR12MB8408.namprd12.prod.outlook.com
 ([fe80::10cf:64f0:2de6:e466]) by IA1PR12MB8408.namprd12.prod.outlook.com
 ([fe80::10cf:64f0:2de6:e466%7]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 11:59:27 +0000
Message-ID: <c608fce5-872b-43d7-a6cf-f9e49956dd42@amd.com>
Date: Tue, 18 Aug 2026 17:29:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
To: Frank Li <Frank.li@oss.nxp.com>,
 Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "git (AMD-Xilinx)" <git@amd.com>
References: <20260814115155.3974988-1-shubhamsanjay.patil@amd.com>
 <20260814115155.3974988-2-shubhamsanjay.patil@amd.com>
 <an9LVxaZR9p2B7hb@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: "Patil, Shubham Sanjay" <shubpati@amd.com>
In-Reply-To: <an9LVxaZR9p2B7hb@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: MA5P287CA0137.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::13) To IA1PR12MB8408.namprd12.prod.outlook.com
 (2603:10b6:208:3db::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8408:EE_|IA1PR12MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: c83d8fd1-7853-4263-d540-08defd2026f5
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|3023799007|18002099003|22082099003|10067099003|56012099006|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: dDwz7afF+GOlN4KFsQnNIu60Z8FuKIpzOg6A2LTMYsPPrcYizVVCMh4BNw200/U1a8pPzMjHwpURXgg9n4a8pkgyDium4gfD0doLiCxUUv6DVSmyg059S/4gCM7ef8txXsmKJbXojuDcT+4UVZ8U+YE0qfDbrGNvF/NK2hDzCXtWcyXUGsYcy+RWlbsWLMbTC4ZOubgxNRI1LzygB/9ol3PF974ormkMEzzhYORnzC2MvdXO6DkOTgkpQBS3CgJe74F1Ynx7Gk5aaNKAd4AkVFCuVaRjwphw/asVlnUlWVW2Imltw6EVo8K3Xdj8fr3gR4QHaH8eeM7wTdngqzGzaAG+i41RKud/Sgct9pWxXyQUsmYsEhiYyMOE4pHIQMC1eaWsQ5+XBXifW3+hK3kDDCTPKyaM3y3Fqsc1CExjcbdIzAUI4P9WuSNLaLfdflIx59lP1T+mKT+Q7i+nSs4fmZ+QZd+lt4W2RWM5AYnKErHbHIAl+nAe+8aeqaAE0/ccGGHsHP/WIx7Eaq1sn3sC4VLQAKI24AbByV+AeFm79HQZ1EpVYI0WGa18lKH7GB0OaCdwT7fcQ1oriF7YOdEoz2kem6UM6ODcW5vVV9VCILK/KfWBRQfIEQHZdVrW9JX0reijBlCfrEZ8dRYh+tYwJ1giDQSFA8fGhpgsShYj2vI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8408.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(3023799007)(18002099003)(22082099003)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWRJTUtVeDN1RWlQcGxLc3BqUVEyMXJJWXdESURnN2dxVGxib00rWWhDYU5a?=
 =?utf-8?B?c1dJYWlvZy9TMVgyTjZUNlo4bTlSd21EcnFmaEs3Mnh2ckZsdVJRYmo1Wk9K?=
 =?utf-8?B?MWpieEpxeGNIWVkzZktFMjBMd0h1aWRLaTBoSFBzT3Y4bDlYN0FoTHJURlZQ?=
 =?utf-8?B?NllnMnQraVFRUUhEREl3RDV2Qm5MMmNLY3JpSTIwR3UxRFhMNlN3TXQ1blM2?=
 =?utf-8?B?SmZvTkthaXRKNFRMcmVkY0ZZZmhxanc4Q3lTUGwwYlQvc3R4eDNqeEtCR3g1?=
 =?utf-8?B?dUFQOWxJTVVHWitSL0ZZa2VYbmdPTzQybnFZSTJxYXlnUlpYUGE2NXpLV1hq?=
 =?utf-8?B?NGJRWWNuTjNNdHRZYVY0QkVZL3ZSM09wWlh6QytNV05NM3p1UmNncG5hZ0E0?=
 =?utf-8?B?cWMwbWsxc0xrSmJ6UmhIdDJ6VnNtdFo5N2E5bWg2dVZBYzc0U1d1N1pWdzc5?=
 =?utf-8?B?MkRiUEhLN0QzU2tmRldreWoxZVN2NVR1TWJJWEVvVk5rZmJCRzZ6R0FYTmN6?=
 =?utf-8?B?blpUOGNKR2kwV2w3Mm4zSi8yN0kzZFFzNjRlaDY3c241YnJhREVWbVprV3NP?=
 =?utf-8?B?Z0hTbktHVVE1dkFRb09mcldyVmJqaXFmMHJaOVVPQThQZE5NV0tQSDc4WXhX?=
 =?utf-8?B?RnFPVFZkeHI2bHZwd1ROZFdzWDJnMlo2MWFaQ2RaMTh2UUxyS3dmVnFoSHhD?=
 =?utf-8?B?Vi9jZHl3SnJRd3J6U3ZWbWk5ZTNNMG80b0srdEZUOVh3TFp4NTJydzhYd2h2?=
 =?utf-8?B?MTdVaUR5UGF0amN2aDBuSitscDBrbytJSnp4ZDBlZXgzK2tRRGZLV2J4aW8y?=
 =?utf-8?B?OFp2QVhMaDF2L1VzRWpPNi9SYjhVS0t2UVBWMUhIUHpPUHVrZkNMbWNERkw4?=
 =?utf-8?B?VTBWbDJmdmt6Z1hzbTJEL3pDWmpsWDlpMVlFOCtkbXVnODhXaVAxT3phSmV1?=
 =?utf-8?B?bnVIWVVtUXY5VTBrTENSTGVQZlRyZHpxdWdvUWdBaEJaUEN4cjRRVUVVSFFl?=
 =?utf-8?B?Skx0RW9wQktNTU5pamlBY0VSS1pocmJWcE40aCtlYjQ1eS9KMmlhdHoybjBB?=
 =?utf-8?B?UzQyWDVXaHRMSjBRUTFxZWo2aCtERy9YR0lVVG5QR0F3WURYRWFaSlBOWnVC?=
 =?utf-8?B?NnpQYTBjcWM3OU1LTG14djcyVjc0NVM2T3lhV2hjYnFFT2s2K1Q4S09TTGZE?=
 =?utf-8?B?UzArU21LL3FDck4vQnZVL3FJVzJXQURvcVdmUTVxRFdyc29pRVk2RFpOekU4?=
 =?utf-8?B?dXFPWWVTQXlHM1JnYm53VDI5ZkRLSTRzVXNBREllMjdjOFNkZS8vNHkzZGNK?=
 =?utf-8?B?SzdPUFVvVDcyZDQ2TWgvVWI3bU82Q2l1WDRHWnBwRldhbnRPTnc5OHY3bkFs?=
 =?utf-8?B?N3JvbW9KVm01NVdURkFUd28wQ3ZvVXNBS0RJSnJ6NVBvWDRsb28vOGloSE9z?=
 =?utf-8?B?WXNDcFpnYlJheXBGQlhDN0VJa3dHcHBtYUlYRVdNYnVrMkYydEZhdWxIV1Ft?=
 =?utf-8?B?K0tPazhnRTRsNlc0RUxwR0cxeE50V3JsYVAwUFpVZTJoR0IvRHA4cE8zditk?=
 =?utf-8?B?dG1maCtNNHVqcVJWVlp2cDdkL0JzYVUyemRsYXNXa3hSZnp3SUlPNjdZTnhI?=
 =?utf-8?B?dVhabzhZcWNYYXNYYXdZR0xOU1Z1SzdMUUFJM0xWQi95OGZtODIyMEhaaG02?=
 =?utf-8?B?bUtOKytuTktYUGFoK1E3aCs5U29nV3lZM3krYi83SWthRzVmQWM2U3hqdmtj?=
 =?utf-8?B?cDd5aWJZUnh5dVlBcnRpbTFKOGdqVXZUclQ2cmpsTFlXSlFhZ2s4NEpZZU02?=
 =?utf-8?B?Q2NSSDdsLzAwSzY3V0lKUEcxQi9SN3dOYnVvb2dyLzlUUktXRzFmWmlydTFK?=
 =?utf-8?B?QzVxQkhER1NBd2JVR1VYb1JpQWw0anVDV2RJMkJhQlpPNS9yRVJWdG02Sjlm?=
 =?utf-8?B?Wm9HM25hQXBKQXZDaFNPQVB4ZjdDSldjc0pXc0tMaGVTc1ZpZHR4SldXV0dl?=
 =?utf-8?B?QXdma3c4Mlp4Z2tFZWNrMXljWlFKZGNybHVMTlFPT2JNZnlSSXlOeW9nZGFt?=
 =?utf-8?B?Qi9LMGtxdmxma0JDZmY0d0NNVDFRQ3ZjdjRudFNwOC9sOUhVNUo1WU82ZUVD?=
 =?utf-8?B?L3pnNjAxUVdiR1hNVWlmc2xwWnN4OHgrSXBoRU5oaGFOWTBSb3dldkNuZG5J?=
 =?utf-8?B?QlpuZ1puQjBUbGFoWStxaFlvNXpMTitlU3pBRlVoU0RxNFgzWGRMaXo1SThv?=
 =?utf-8?B?MjBMcGRuVmpUaVRIVG56Y09ab1VLNllNSCtGZ1hPbWtadFgxQW1RK04vengv?=
 =?utf-8?B?ZnhqVGZjVUhaNEZoKzRId2NqM0ZwNDZyTVpIKzBkUFpXNnFBMkhBdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c83d8fd1-7853-4263-d540-08defd2026f5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8408.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 11:59:26.9040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIdAADqJbnyHkDnI6X+gPLZ2oECxO/7uBMCqCfYSv7Bf9fCezfcIx6z9HopgkkjVpsYW+qG218yhRe+97Bz4kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7567
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_045942_310473_17B3435B 
X-CRM114-Status: GOOD (  19.12  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Frank,

On 8/14/2026 10:37 PM, Frank Li wrote:
> [You don't often get email from frank.li@oss.nxp.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Fri, Aug 14, 2026 at 05:21:53PM +0530, Shubham Patil wrote:
>> In-Band Interrupt and Hot-Join are synthesis-time options of the AXI I3C
>> IP. Describe them with two boolean properties.
>>
>> A Hot-Join request is acknowledged by the IBI machinery, so a hot-join
>> capable design is always IBI capable as well. Both events are reported
>> through the controller interrupt, which is therefore required whenever
>> the capability is present.
>>
>> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>
>> ---
>>   .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 23 +++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
>> index 2caa245a8656..07e3d0b4d767 100644
>> --- a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
>> +++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
>> @@ -32,13 +32,34 @@ properties:
>>     interrupts:
>>       maxItems: 1
>>
>> +  xlnx,ibi-capable:
>> +    type: boolean
>> +    description:
>> +      The IP is synthesized with In-Band Interrupt support. IBIs are reported
>> +      through the controller interrupt.
>> +
>> +  xlnx,hj-capable:
>> +    type: boolean
>> +    description:
>> +      The IP is synthesized with Hot-Join support. A Hot-Join request is
>> +      acknowledged by the same machinery as an In-Band Interrupt.
>> +
> 
> The compatiblity xlnx,axi-i3c-1.0 already indicates such cap. Do you have
> variance. such as
> 
>          one Soc have two instances.
>          instance 1  have hj and ibi cap
>          instance 2 no hj and ibi cap

Yes, exactly that. The AXI I3C core is not a hard block: it is soft IP
instantiated in the FPGA fabric, and IBI and Hot-Join are per-instance
parameters selected in Vivado when the design is built.

> 
> If new version support HJ and IBI, need use new compatible string.

The compatible does track the IP version, and a future AXI I3C v2.0
would get its own string. But IBI and Hot-Join are not version
differences: they are independent build time options of this same v1.0
core, so putting them in the compatible would mean several strings for
one IP version, growing combinatorially with every future option.

Thanks,
Shubham>
> Frank
> 
>>   required:
>>     - compatible
>>     - reg
>>     - clocks
>>
>> +dependencies:
>> +  xlnx,hj-capable: ["xlnx,ibi-capable"]
>> +
>>   allOf:
>>     - $ref: i3c.yaml#
>> +  - if:
>> +      required:
>> +        - xlnx,ibi-capable
>> +    then:
>> +      required:
>> +        - interrupts
>>
>>   unevaluatedProperties: false
>>
>> @@ -54,5 +75,7 @@ examples:
>>           interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
>>           #address-cells = <3>;
>>           #size-cells = <0>;
>> +        xlnx,ibi-capable;
>> +        xlnx,hj-capable;
>>       };
>>   ...
>> --
>> 2.34.1
>>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
