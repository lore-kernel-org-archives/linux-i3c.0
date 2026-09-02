Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83192C61DD6
	for <linux-i3c@archiver.kernel.org>; Wed,  2 Sep 2026 10:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m/ldT7x5125IUvUpgQE4WIUYvaRdRjlBumY00yMDJks=; b=GMwIW100tJsiUBLYsU2Ri/sMAc
	VbsHPIww87JT9cacNJCw0hWENhQ0rKZ906mo5wuD5nzPqMAE/KrrayCKdyhUx8pZfP/FWY2mr5ye+
	of7xILFq5h66QlA8Bq2nYopyX95U+Ev0XK8e8O6ZBXUhh48KFknvuZwXpmuLUPBzVqTr/ibOVKJq8
	xPqWvezFC16HZk0JI/ZdUyZkYDw35d3zanU1W4P7Yrh8YHITTnZmaDuZwN0GRy/C6PpLvBykaYADq
	b3kmGrLD5G3qnHxyKox9N6M0G/wNhrD57gOMFwkwNFIGVxmoCk2Y1LdDeynYk1+p+L8bmxhGOTKCo
	lJ7l5Wvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hvl-0000000EJf9-0drF;
	Wed, 02 Sep 2026 10:10:57 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hvh-0000000EJeZ-36jq
	for linux-i3c@lists.infradead.org;
	Wed, 02 Sep 2026 10:10:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCOT7fhgG7olEV3zpzQKBk4Fd8mNBevZj0Wf08MKVVwtpQDQr4rH/HnAICrnCTp7d2AbN5acxT9yotwXG5RpJlnp7x8e059wRz0tUWPkyIb8o5pDkfA7ZHV+nczuf1qlwdwUa+wj6ThNfw/u2pfd98Un8e/I+NbByXexrlwQF5/ficHN2LpCii/ljffsVG/x7ooEcOLelSDSD9QOl/g3QXrALGPLGKCDTcEnxMXiRLhFeNpYdOd5qvS5lVS2+tIo5IdoQ+D3dyOjM6D8d3JB5QUtnX6N5THzpjeU9eaaH/k/A7KJpFVO/Sj9tlDMJ4z/mxqRuXXx22CvZU8T58FEHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7MtDpiHwo7QXqw84N6nrt/Y/gW0SIUeVofN+fprc5Y=;
 b=w+emkwyWrWMaTQTErHjhr04fBQcJoKqXNCbq4NlndVMQBO4HZYpGDK9asVGxrHzwhwORe9lKKHu2B2Oh6KwDtAOt+15yEnLnKtfBzGHvxTOqAVRs/qxRlOyaXdOMwUS+b/0eOMgEL0wnUB3L1h95HVk/j02hDDm68tPHt8+PZZ5avVcQfmYkrJhitXQjFJe167/qyj7ijxa1ZTRBc4Yp8yZcyO2yWd7DIWi/m7zluMqCrEAVJo/Tr4C/LgQTAGZyXrTL9t6VxIBDrbH93z8RToRhGMzvfy4Xb2W6eZnap/dibVNUSVhctA+OwF6ViqqDFBe8iHL5ldmNvF/DA9AfKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7MtDpiHwo7QXqw84N6nrt/Y/gW0SIUeVofN+fprc5Y=;
 b=kYWXTjif3gna3c8e2SL7o+pR0DRcBqfIwBO8ZknPKSr9smPw32BY6eP0zd0lwMFzkl0a5KMR4bhEEXfZ4MTKMJcqo7LE/w1kgvW4CEi9VaHB/g2mdhMdQ7vIvDVhjmPN+ktfetTGy0XxzLWnpZ7nCZEStkBQhraF9nQ+8m8IAf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13)
 by CY5PR12MB6132.namprd12.prod.outlook.com (2603:10b6:930:24::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 10:10:45 +0000
Received: from IA1PR12MB8408.namprd12.prod.outlook.com
 ([fe80::10cf:64f0:2de6:e466]) by IA1PR12MB8408.namprd12.prod.outlook.com
 ([fe80::10cf:64f0:2de6:e466%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 10:10:45 +0000
Message-ID: <86433bb2-59f0-4591-b249-c2cc6c7171d5@amd.com>
Date: Wed, 2 Sep 2026 15:40:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: i3c: xlnx: Add IBI and hot-join
 capability properties
To: Frank Li <Frank.li@oss.nxp.com>,
 Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, git@amd.com
References: <20260824044835.2924141-1-shubhamsanjay.patil@amd.com>
 <20260824044835.2924141-2-shubhamsanjay.patil@amd.com>
 <aoxd2Rq3qIoNIosY@SMW015318>
Content-Language: en-US
From: "Patil, Shubham Sanjay" <shubpati@amd.com>
In-Reply-To: <aoxd2Rq3qIoNIosY@SMW015318>
X-ClientProxiedBy: PN2PR01CA0201.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::13) To IA1PR12MB8408.namprd12.prod.outlook.com
 (2603:10b6:208:3db::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8408:EE_|CY5PR12MB6132:EE_
X-MS-Office365-Filtering-Correlation-Id: b47d2629-769e-4dff-9bd7-08df08da73d8
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|4143699003|5023799004|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: mH5jeVSKfR6WT3WmTbEHQCIeEIiZ8v8r+XIFXsJcT7+UC9+oNthtK7yotvFzPtk7Y6OqlQbamEA+TdXcBYWv1+4MXDNv1BIfOa4huww0/wvQVmk/BUC8o3uzbgsZoT/aL3JmokIzDZgIq3hXVO7gY2SEk+Ego/nLAr6iacYwPYq8Z2KdkA/Ish5d6ENsTEmdNiraEc9X1exmdAdZGL8h6fudOEJgEXhlQQo/xRfDStD2VSBdStv0l+pG2LRHAhBiPOK3kVPlIkfBZei6wkpd9LGNJlOugtk8s9Dav9xouY5ju4KamHRQpVAqtM/o6Jrh9lkjmVySQXXqgVdDmDLVWnRkmyHzP4XVaH0lg7Z6g2c7y38osIcN3yzct/EEcCxdW+sR24+K52ftCi2OQ4rqImsHkflC8lOqE56FIKUPyhkFq8Fo4E7nLzmDJUvRIkf8E/RRY6LZzqOwZlv8Fi/GyjnaN4s3PYPlSYQyr925CuvPtaAguOL0SYULeVIumyAaBeuGdD6xX6qv4VhiW+foLJCKDagxniplj66+kEwFUGZd8KPhuubWf3FJmbkkwv5quoVsoIC518QCARb5CexUPUY5lsfXlN3O2SO0Ikq0c/YC4LDRVwI0aP8XOiv+Bf6lQkM3OjSQRtWz4hQcHy0CHniuUl33lkkv68PlAJXnGn4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB8408.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(4143699003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q05ERk1vU3R6RTllVkkxVjF6eWl4NUVKaFN6eFhWdTZpKzlWK2ZCMVBOWEZR?=
 =?utf-8?B?RTlndWM5aWtkRlRtdnZHdU83dlhEOWthdVpldDlqY1ZFS1prVTU3T2Vwa3lV?=
 =?utf-8?B?Y0YyQ1IraGN5RnFaeGZ4VVFpZXlrUUYyZzZVeERjSWJVOGh5a2E1NG5NYUpm?=
 =?utf-8?B?UU94U0VRMWorTzcrRnRsMW5WdWxudjVRZENNaFMxLzdoNkRoYkJNL3pRT05o?=
 =?utf-8?B?RUdKWjg4OG5uUFVHVlRDTGw5c1VEZkZMc0NVMjVnYndZTjNmNGhwRE10Vk9K?=
 =?utf-8?B?dGlZUlNDYm9RVG13R2ZRV0JJdU9JdC8zbi9xYTAwYjI0UGdaMkptMlZzbS9K?=
 =?utf-8?B?K2V3czlNa3Jrdmg2MmFkVTVEcVpPdHF2bDdjWUpPWk01RHBsbVVIeEN0Zlpp?=
 =?utf-8?B?MDh4cDlhZFZlNGhFV0Y2N1M3UkEwVzVUdW5LQndxNWc5SWNhMG5XWHZ1a0lV?=
 =?utf-8?B?dlhmMHk5bHpkbHNzcUpxaHdmMUxmZjZMRkdnSUhkUFpYdm9BM24wT2NQY0M4?=
 =?utf-8?B?MVQ3MUVJMHdFTi9jM0RFWkVhbHViY0xsc21KS1ZtZGdPZ0xiTXY0MitnSmd4?=
 =?utf-8?B?bzViVEl5dE9nTGJDUlUvKzRFVG5mQnJ2VVYxQ2x1cEp3SlRWNWU3WXd1V2N2?=
 =?utf-8?B?WHdDd2tUbGNlQUF5M0lscTY3aXF6d0VIaEFCNmc2dGZHaGNaQ1dPTkZhM3po?=
 =?utf-8?B?eEV3UUhVc2ZMbUlKZnRLc2p0SDVMWUg0WDR2NC9uNjlPbitRcEgyc2F0ODI1?=
 =?utf-8?B?ZlpjM0xUWm9SY05XbG1mczBpWkdmSU9CNmZEY29RaWVmbkxHemNwOFduaHhs?=
 =?utf-8?B?ZmN4NXoyOVJ0eWRKTUNjM2hTVHFZaUJ5d0ZEalpXZkRwS3Q4Mkh6cVI5aElE?=
 =?utf-8?B?WDMvUG83dGNOZUNpYk5QVkYwVjNtN295OUlKVUUxWFJTUnNxcDBvTEdXODFn?=
 =?utf-8?B?WEdFOEpDQ1BRTGdHOVdMeGpWek5iY29PVjUwVGVkQmkyc25ETkxGbWpvcG4z?=
 =?utf-8?B?WGxUWi9zd2w1dXd4VjVYVmtmcndKWVFWYmpFbUVPNWFwRFg0bENwdlJ4bkZN?=
 =?utf-8?B?TTRvcGhxeVc4MDZMeGJaUUFJMGpXMmlLTTZKWHRhWEE0QzlUWGNoZTZYeE5E?=
 =?utf-8?B?UzJrcWVOaXpPOEhTRUk1cjNCM0l6YnN1Q29hTExBMlZyTWtITXNaTnhrZEtZ?=
 =?utf-8?B?WjhHTnJSU1lSN1FQZFpDM3MrUUlFd05JNW1oT2FmS1hyOURjQ0o5ajlWNWIw?=
 =?utf-8?B?TjZQdVVab0lLYkNIZnZHRTJaZ3hHcmdHbkFRNmpROUdiYlcrcC9XMWMxbFRh?=
 =?utf-8?B?elJ4VU8ya0NsTHFXNjZxSCtla3ZoWG84VFVVbmpsRWdTV0xtVkR1anVGK0ND?=
 =?utf-8?B?SVhrcFo5VDV1N1J2dlZjTXAzUndZdDMrVnVPV0NPQU00V1RSUklBM2RqYk1X?=
 =?utf-8?B?eUx2UWhPM0RkVjdHUjliZndPNlI0SExwWTVYcjc2amVLcWZUVmtneE9jbmlY?=
 =?utf-8?B?ckxWVDBlbmdyeWloWW1YNUcwSWZlcnh5RHdJdHNwNjBqaXg4UHNsWllvVnJv?=
 =?utf-8?B?ZktKczFnTDVMdUlrT3hRRGtCVHdyMnUyNDhtcFVyaGhzN09FVmpqNXZrRzRL?=
 =?utf-8?B?aWxKYTd6VmowTUI1OWlHZTRBRDlmbENkYy9PNm5XeVZTRlpBOUluTHZWdEhH?=
 =?utf-8?B?Z1pMdG9xWGJ1U3dQM2t6Vkl3S05UQklEb3BnNkpuMEhCY2VzWTg5aytLZzNj?=
 =?utf-8?B?S0thQnlrTit6WDN6T1Z4bHJiU2N2dzdEbmRXajdrSEdWSUk5N2NJWmsrUC95?=
 =?utf-8?B?d2tVeGt0VUxBaEMyT0VwVnAwaXZFTDdZWkZqYjRieEZYU2FMeC9WWm8raVBV?=
 =?utf-8?B?QzRPTE14cGJrZ3JKMGdieGc4Qkc0WGtEVTV3bmIraVdBektnVTljbmhycmZH?=
 =?utf-8?B?a3ArTld1b0ttY2RTWnZpSWlBck1aczVxdnl2L2pvdTZJbk9KejlPSUJoNmlx?=
 =?utf-8?B?QkpmTDY2VlRhYnRROGlCV1lZTUl1WnBVUWlDQ0VaOWFNaFBKdCs2YmdwWW5Z?=
 =?utf-8?B?RmE4am83cEJsREtIdmtHNCtXZnNVUlczelEyTWt6S2I4REdMcXpWUFRCODVV?=
 =?utf-8?B?TWJNbXVKYXV1bkR0K1lIWGxiT25LTk9jUGttTUUvOHBhRFB2Q1ZqNHlnOVRP?=
 =?utf-8?B?OERlNkx1L0hWb3grOHREQWZNd2FibzlvcTNPRWVvRjdVK2RsY3B1R3NjM2M0?=
 =?utf-8?B?SU1tRFU3VlhKYVVNTmhJbDVVdEVwVFlBNTdQdG9NUGQyMFlmbDBjbG9rUHRK?=
 =?utf-8?B?REpsc2hqVXRhZVJleHBrRHR0WldNUHVsUVpGRnFNWjYvenh3RGZUQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b47d2629-769e-4dff-9bd7-08df08da73d8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8408.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 10:10:45.3340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4g80ITwuvX19IOIzxKZRmVRBlihu8tRKW/AFYBvORngZKozKFyG1ENy0JKUyeSUQlTziygI7cCAUgGwzD6IbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_031053_791242_14435B41 
X-CRM114-Status: GOOD (  18.18  )
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

On 8/24/2026 8:36 PM, Frank Li wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Mon, Aug 24, 2026 at 10:18:33AM +0530, Shubham Patil wrote:
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
>> Changes in V2:
>> - Rename the properties to "xlnx,in-band-interrupt-capable" and
>>    "xlnx,hot-join-capable", and expand their descriptions.
>> - Express the interrupt requirement with dependencies: instead of an
>>    allOf/if-then clause.
>> ---
>>   .../bindings/i3c/xlnx,axi-i3c-1.0.yaml        | 24 +++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
>> index 2caa245a8656..a04becc07374 100644
>> --- a/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
>> +++ b/Documentation/devicetree/bindings/i3c/xlnx,axi-i3c-1.0.yaml
>> @@ -32,11 +32,33 @@ properties:
>>     interrupts:
>>       maxItems: 1
>>
>> +  xlnx,in-band-interrupt-capable:
>> +    type: boolean
>> +    description:
>> +      The IP is synthesized with In-Band Interrupt support. An In-Band
>> +      Interrupt lets a target signal the controller over the SDA and SCL
>> +      pair instead of a dedicated side-band interrupt line, by driving its
>> +      own dynamic address during bus arbitration. Such requests are
>> +      reported through the controller interrupt.
>> +
>> +  xlnx,hot-join-capable:
>> +    type: boolean
>> +    description:
>> +      The IP is synthesized with Hot-Join support. Hot-Join lets a target
>> +      attached or powered up after the bus is already running announce
>> +      itself using the reserved Hot-Join address, so that the controller
>> +      can assign it a dynamic address. The request is acknowledged by the
>> +      same machinery as an In-Band Interrupt.
>> +
> 
> I perfer put both to i3c.yaml

Thanks. I'll move both into i3c.yaml as generic booleans 
in-band-interrupt-capable and hot-join-capable, drop the xlnx, prefix, 
and keep the interrupt/HJ-vs-IBI dependencies in the AMD binding because 
those are specific to this IP.

Thanks,
Shubham

> 
> Frank
> 
>>   required:
>>     - compatible
>>     - reg
>>     - clocks
>>
>> +dependencies:
>> +  xlnx,hot-join-capable: ["xlnx,in-band-interrupt-capable"]
>> +  xlnx,in-band-interrupt-capable: [interrupts]
>> +
>>   allOf:
>>     - $ref: i3c.yaml#
>>
>> @@ -54,5 +76,7 @@ examples:
>>           interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
>>           #address-cells = <3>;
>>           #size-cells = <0>;
>> +        xlnx,in-band-interrupt-capable;
>> +        xlnx,hot-join-capable;
>>       };
>>   ...
>> --
>> 2.34.1
>>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
