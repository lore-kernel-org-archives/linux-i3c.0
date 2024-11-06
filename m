Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65489D44D75
	for <linux-i3c@archiver.kernel.org>; Wed,  6 Nov 2024 14:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LQSnofJt6DKKM2E0CX7wO7bkiZye5LKH1ZRh9N0iB1U=; b=wtuJX6w6Me2dSkR4hKTjFCO6d7
	wTv9cVptSjAvxz48nv80I1rhZdZzpPeHv55BVIJFE8XpS3YrJxH4S0XM/GJ8NHkJ2+w2syvomroou
	nA8bddDc7h1nQ9W77RTThpwz2gxC+GpSm4Tv74yNsov+iSVI2g/DO2fVFgJwkuFffgJm6zWHQUUIC
	kO85vEnbH8wFtpXSNCLwi3MlASQ/JnElf703PuD2xezhbBR6VkQ7rLdpCbaR79UYOEM++6v+2wMF6
	HrUe153VRhUnb8UW/HNhz/9ah1L9+hE8QsTCU1l3CGl50jytYP/zL4CWBo13yvotNT22jCD0MfsNr
	n9a6THQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gzT-00000003b1R-0Un3;
	Wed, 06 Nov 2024 14:26:35 +0000
Received: from mail-dm6nam11on20620.outbound.protection.outlook.com ([2a01:111:f403:2415::620] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gqh-00000003ZSV-1AgR
	for linux-i3c@lists.infradead.org;
	Wed, 06 Nov 2024 14:17:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJERMDSYNU2kqvDo/1CFLr46u78KFkS4h3/DY+CapduOQz0mUQi7IXRbm1uBSMJYkPb9adlRKqyLBXis/zSXtIi+IfvWuMs8I/1ajtRxJfhjhwApKQmn4ePu+2MQe+qfldfolloj9JoEZZIl7KRPiTLTxd2DaEGI9BwxPFfZcbIpH/2DHsZi0VsrDzpttzTreNyS9RGiS1Hx+cFuPoeuj0SMVQ/W2dGAvpUh9x0/2+APFJN1ocNmo029EGmgRQLEUXrf6VSF/SgIX4NDwV+EKiW5MK5/GQMSbVmKDWh0Knaj49ZWcjkMdb+LGQrG6O82IYH+mF++gwuXD3gyZ1rWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJUU4OLB+ngOu79lhi0a2d0EWSO0HGvMcYbO6SK7thI=;
 b=hS173OHq67fBLQh4K6cpzdne6r61UVk0TshCIEfMLEftlY9cc2RXZHamVi7LG3Mlmrtmzw62xIykxeT0jBD2RKjFwBpkm/6epFkS+QlpBZtbv3DcW8Me+lXPJjUZhj2krV1Je0Pu7q8SgXSTI0st84zapQ/PWr0Rnb/eXrWyXFE8FNrrqFIMLBlFRAJCr5B2kNOl4N7v+JHAK/zCBJmvJk6PXDfrU6ZIW1zTGuKoP/ZDxZSR+WMm1Q3YAIxJ1zkCDky6AUDZz5Z+/vrzVnQniIK4DDs2t9pEtvYag1G6ms1cYgVjrgDeDRAxVbnbvhAamo8LL8ujbO4ljJP07xC/oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJUU4OLB+ngOu79lhi0a2d0EWSO0HGvMcYbO6SK7thI=;
 b=W4BeCbMV+qKywIw4uZVfl0XCjIbId6ytuwTj6ue9AczfmSsze2aMFQMdK3xVsE0jzHlf1pxICuFHLJ8xoohi6DnK9dwSOaWA5DjX9lIn85oAkpA3ipj82dj5Kzs0LH7iUGqKXt6Z0dm1xE5X5ccN+Fqknf0Wxl4LEMzVIcsqvMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by DM4PR12MB5937.namprd12.prod.outlook.com (2603:10b6:8:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.32; Wed, 6 Nov
 2024 14:17:26 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%5]) with mapi id 15.20.8137.018; Wed, 6 Nov 2024
 14:17:26 +0000
Message-ID: <9d8fdd74-5e82-47b2-ba7b-c33f791065fa@amd.com>
Date: Wed, 6 Nov 2024 19:47:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] i3c: master: Add support for SETAASA CCC
Content-Language: en-US
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Sanket.Goswami@amd.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241023055118.1400286-1-Shyam-sundar.S-k@amd.com>
 <20241023055118.1400286-6-Shyam-sundar.S-k@amd.com>
 <583c5381-11fe-4fc0-83b4-512c2aae50bd@linux.intel.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <583c5381-11fe-4fc0-83b4-512c2aae50bd@linux.intel.com>
X-ClientProxiedBy: PN2PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::7) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|DM4PR12MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ceafd9c-0e13-4312-4d24-08dcfe6dbd58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHJIb3pEV3N3WUNGVkxHaFIxQy84a1dwakNmQlcxR3VmTjhWcnZPcjN3MDhq?=
 =?utf-8?B?YUdyQUJwTGQ1SFM0S1N5c1l5TnFWU2R0Wk1xcEpHVkNGWmxIUmY0bHFTNUVh?=
 =?utf-8?B?Y2lNYTMyeUNWY29PMUFPUHp3QUNSMDFvdU1YdUlPWklHUnBKSGdUM0lVYnUz?=
 =?utf-8?B?K3dsK0F2dmlod255RWp2UDVKa1dZUmQxanFrWUVXeFA4ckxFN1VLRE5oVjVz?=
 =?utf-8?B?THBMWEx4SGNpcHV1RGxxNThVZ3Y1QW8rUXpGc0l1QmNQSjZuVkhvTmsraGNw?=
 =?utf-8?B?R042cUtjRkhJVEF6M05hejFBeCt4WCtCSEZPNHhDR2hPL2RsYWJycWNNcG9M?=
 =?utf-8?B?KzYxK2V4VnF5SWZXaGRGa21Tb2YxcGYvKy8wM1RkcDNpNXRMUGxYMFM4K3No?=
 =?utf-8?B?c1BhSVBkanlpRHZZRm1OaEM0QUhYS2tqaGVLd204UjI4TjdmYmtuNHdYOERS?=
 =?utf-8?B?cHJYaXFKTEZDK2RYSkw1RUdmdFZ4MlJtRFB5bTJxOGRwK3JiVlpOalJ6Zktk?=
 =?utf-8?B?MVorWFBxZkpsUjZuVnFuVWJHWWx6YWR0UGRpdTVVSDNJa3ozS0hlN1BWR1R2?=
 =?utf-8?B?Qk4yZUVKNld5ek9VemdKZlFBYlFoc3BDTUx6b05nUFhDVHRxYTFmbGxaL0Ur?=
 =?utf-8?B?QlBpem1Hc3A0VEFJdm1jTWJoS29iM1Z3eDkxdnBSQS9uWXZhdy8vdkdST2ov?=
 =?utf-8?B?Slg0RnB5emVTVnNmVGNZYjc2VnpXRUoxdkpFL1kzOWFlWEhBR3lMTzNFQW04?=
 =?utf-8?B?TGdjM0JIMVBxek95cVhNSUxyRWFkRmtpaEMxZ2gySUpMZ3gxS3B1ZW04VGZu?=
 =?utf-8?B?VnpjMjNmUUFodUVhdStFMTJURDF1eS9YUHdSditTem5CYmNEKytsaEJ1OUlT?=
 =?utf-8?B?TUtuWTdPcytiNythbnRIRk5NQlUzaG5TT2l4MTdySU1odmhxTTB3MWFvMGhL?=
 =?utf-8?B?U3JRS1FsVmxSdUIrMkhHejBiSnZBajNzQ2NOWVl5OE5zOVUydzlhclZSV1Uz?=
 =?utf-8?B?KzBnSDBjdEJaM2hMYyttVE5iVEFEUXVSQkVsL0ZXLzRIdkFRaEJWdXpQTk8z?=
 =?utf-8?B?cE9zUHBqVnhrdjRXVXB2YkVKUWQ1UHIxdEZjalVFODFiYlEwaVdLZTFuaDh2?=
 =?utf-8?B?TEYxOVVkQ2FVbFVMSUFOWjlxWVB1VFNtMEtRNWxXNm93bVZieWROYk9KRWJS?=
 =?utf-8?B?WUlQWjNDd1dhNjJMR1V5dU1WNFhHNG50WXdDMVV0K0hUaWFXRHNVWmNjbnNO?=
 =?utf-8?B?K1ExNDhVK0gybk1HNXVwM3cyak8vTnczdklwLzB2VUg3TUR5bktseFZweUNm?=
 =?utf-8?B?NW9uN1pwY0w0L28wcm9XSWtkc09KYTEyWFpTeThTNmt5QnRIQjdUZjh4eGZI?=
 =?utf-8?B?RjdTZUorVGxmbTloa1B1UWlIK0NPUyttZzIrYi82Z3RRVWdlenZKWWxyN0Ir?=
 =?utf-8?B?SE5VUUhsZlQyS0JrOUlNYWs0dWJQQUNrUDlwNWlKYWYzc3ZEMW53YnVIdC9E?=
 =?utf-8?B?MEtFV3k3NzRmU0JGRS9uMDBqS0YxVGw0NllsanJxaUdKaEp2MTV2WncvL2du?=
 =?utf-8?B?dEZOTzVuSk96NkwrQzFsOVRWQkpwNDBVZC9xeEtjVFZCWCs4KzFGcXFTbzdz?=
 =?utf-8?B?eEJza0NKOUErWkJuTm03UXJjSlM0ZDVzWWdNYUZCbityRXJMRzNjQWpyWWF0?=
 =?utf-8?Q?vmqG1myczbYQ5jp2Crws?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU96eWhuSUpyN3cxQ1JHNVpESGpJUXpIbXUxWWU4encwZ3p5M3pHWGJjNkY0?=
 =?utf-8?B?aVV2NTh5WlhBT2dEQXBrek1uMnJYNVd5YzVRZ0Q1OThKMEN6enVWMS9saDV2?=
 =?utf-8?B?cFEycDRJNlBhQWpwaVppbGhzZHU1UFg0MDhvNWlzSldrclQ3b2tmMlZHK0lP?=
 =?utf-8?B?UW5ydEJzbVROeVBGbUZPQzBLYlJHcGxCY1RXNTY5Q1VzY1pzbjlZdzNybHFG?=
 =?utf-8?B?S3FFVHlwRG5HMzFGRVVrWnNSOHVOZlRiVGRuaENwVVh3eTVyWDRZL2YxSWdw?=
 =?utf-8?B?WEVkSUJoWW1pSDZyNGg5andaTXp0d2lnak9RdDRJQ2dnWUhVai9LY1pad3ZE?=
 =?utf-8?B?MmI3QkpueGFRYWRGeEdLY0tqY1VpNUIxYWplNHNyT3JMUnBtU1ZhbGl5YW5C?=
 =?utf-8?B?OVkyM0V2SHZEdjJsalNObklremVQNEJZSjI0WGdmNE0vYi94dFBkUTF2dVU3?=
 =?utf-8?B?dk1QNWdjUXMwamIvcDJibWpURm15dFZVdnFVVGcrS3orZE15MCtUdDdWVFI3?=
 =?utf-8?B?OEs5V1BkQlg1UytzQkhrWnUxc0ovYnEyYVdMZWJyNmplRlJ2YzhPd1FZMTZS?=
 =?utf-8?B?VXdrMDUrcW5UVFZlWldsdStkY1hSV0VVaEwzeXFXSXlRL3dydGQwR2ZmQ2tY?=
 =?utf-8?B?MjE1dHFVLzkxU0JiazM5L1Rma2hzOU1hSFFjbG5VeFFBN1k5cE1FRVhjdmRY?=
 =?utf-8?B?WkVnVjhNS0FDckl4bTRuMW1XZWkxOEUxK2cyam5Cdk9pSk9SV2kwc0xIY2w4?=
 =?utf-8?B?VEtzUEZsV1dXYkZUQUsrZE1WencyT2w5WlFEZnQvREpBSWsybmhlZ1J6RGhT?=
 =?utf-8?B?d2tWM2MvQ1JLWkVQTVpmY1dMUDJXN0JVYUwrVWZZbUs2MlFRdU44QjBmRWlZ?=
 =?utf-8?B?V0dIQ3lyVEgzMXFyVVdPY01zSjJ4N1VLN1kwY1loS2hyV0VRalRyWXRDUUpB?=
 =?utf-8?B?amZIU3YxRmFjU2RScG5vR24wMmZpVEVHQTBEbStoWUNaNW8xUFhPOFhPSEEx?=
 =?utf-8?B?V3o2blAvWkcwZENnVERSeGhzM3JMT1duc0l3aGJhcWc2cW9hUjZBK0tONjRJ?=
 =?utf-8?B?ZTQxeUhxTld4eTUycjF1Vk5Sbk9wMzZNR2sxRzI2aUhZWTQ0Q3ljbzZScFFC?=
 =?utf-8?B?dzl3Wnh2NkM3TktwYW5qbjZsZjExekhzbWdyYTk3UXNSZWEyUktDZGVHZzZC?=
 =?utf-8?B?bmd2c0RNK0M4emlQTDl6NnpnUCtWOFNrNWtvY1NJSDBrNzR1WVB5Qnp4Wksz?=
 =?utf-8?B?REZ4SXgvR2pCcUZrdFZJRVRpVDZmUVZsb2xpamZrNTF1bEFWN1dsNGNLVHFm?=
 =?utf-8?B?Qzd6UFlUK3RtNjI3bWZsdElyK2lNSHd5N3V1SmFEUTQxYmJOVDZaUUZmb1JE?=
 =?utf-8?B?aDdlSUxyUzc3N1cycThuQkRpSmNsUEpzYlRrRDc4b1doTnBYejZvK1Y2SVBM?=
 =?utf-8?B?Y1VQTGxzeXQvRTVGRUlyRkMvdDVud20zNFpPdXVzS3JTeFlncWNSN0Z4MUQw?=
 =?utf-8?B?MUdPR1c1dUhiT3Rpcm9ZTHRHczkzUDluSFllMjlyZzY5cmJWeWYzRjNweEFY?=
 =?utf-8?B?bis5ZE5nTENhUnMyUEoxVDRKL05IM3BlNEtwQURNL3M0WG5neHZxcHRUZDdi?=
 =?utf-8?B?eFhsMElEWGJOME9pcElQZVl2Nzh2Zm1BSXc4N2dWS3JWbXhaRkdML0ZCWEw5?=
 =?utf-8?B?Qm1uaWJCWlovSFZYdzNnRVFtU2hqMkpRZ3Q4K3EvTmpEYmFmZ21EeGMraUt0?=
 =?utf-8?B?VmJ1OFMvd3VreHRwSTNsNHM0Ly9IZHdUMkhpYnhZeUxXUGpheVYxZ2pHMEZy?=
 =?utf-8?B?V2cyMU9BeVlGTlQ4Ky9yYitIYXVpbGxwa3J6WVlhTEo4TXdKVlhMUEVRY29n?=
 =?utf-8?B?djBtTW5BVDdwdzdWQzdiaXAyU3c1RGRxaVoxakNQdXV4NkNPOW51THNGNlJT?=
 =?utf-8?B?OWRZMFU4QXFkUlpyYmM1SDUyRExkY3Nqc1J3R09YRTdTd3lrclV1Rmk0RWNC?=
 =?utf-8?B?Rk1YOTArRXRXMGduaTJoTHpKNUhrL3BOYlpWbTZuV2UyTlRXaXoycDBMei9C?=
 =?utf-8?B?cE1Fc0lZcThWNVdtQUNxQkR0V0U3ZVQ0aHFianFZVytCWFdUQXlHbjkyVHBN?=
 =?utf-8?Q?LE5nwGzA268cNU4b9w2naj7kk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ceafd9c-0e13-4312-4d24-08dcfe6dbd58
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 14:17:26.4249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61j8JdMDfkkUsv5MLD3IUGzn37U/gDkUgC0ZMFv2IesIUzfTB9h2MHvXH7+dFiqMgin9AB3XUhz7Valkm09/vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5937
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_061731_404595_86714F98 
X-CRM114-Status: GOOD (  22.27  )
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

CgpPbiAxMS80LzIwMjQgMjA6MzAsIEphcmtrbyBOaWt1bGEgd3JvdGU6Cj4gT24gMTAvMjMvMjQg
ODo1MSBBTSwgU2h5YW0gU3VuZGFyIFMgSyB3cm90ZToKPj4gSTNDIGRldmljZXMgbGlrZSBESU1N
cyBvdmVyIFNQRCB1c2UgU0VUQUFTQSBmb3IgYnVzIGRpc2NvdmVyeQo+PiBpbnN0ZWFkIG9mCj4+
IFNFVERBU0EuIEFkZCBhIG5ldyByb3V0aW5lIGZvciBJM0MgaG9zdCBjb250cm9sbGVyIGRyaXZl
cnMgdG8gdXNlLgo+PiBJZiB0aGUKPj4gSTNDIHNsYXZlIG9uIHRoZSBidXMgaXMgYW4gU1BEIGRl
dmljZSwgc2tpcCB0aGUgcmVndWxhciBEQUEgcHJvY2Vzcy4KPj4KPj4gQWNjb3JkaW5nIHRvIHRo
ZSBTUEQgc3BlY1sxXSwgdXNlIFNFVEFBU0EgZm9yIGJ1cyBkaXNjb3ZlcnksIGFuZCBhdm9pZAo+
PiBzZW5kaW5nIFJTVERBQSBhbmQgRElTRUMsIGFzIHRoZXkgYXJlIGNvbnNpZGVyZWQgaWxsZWdh
bC4gU2tpcCB0aGlzCj4+IGVudGlyZQo+PiBwcm9jZXNzIGlmIHRoZSBzbGF2ZSBpcyBTUEQtY29t
cGxpYW50LCBhcyBpbmRpY2F0ZWQgYnkgdGhlCj4+ICJqZGVjX3NwZCIgZmxhZwo+PiBmcm9tIHRo
ZSBCSU9TLgo+Pgo+PiBbMV0gaHR0cHM6Ly93d3cuamVkZWMub3JnL3N5c3RlbS9maWxlcy9kb2Nz
L0pFU0QzMDAtNUIuMDEucGRmCj4+IChzZWN0aW9uIDIuNCBhbmQgMi42LjMpCj4+Cj4gU0VUQUFT
QSBzZWVtcyB0byBjb21lIGluIE1JUEkgdjEuMS4xIHNwZWNpZmljYXRpb24uIEkgdGhpbmsgd29y
dGggdG8KPiBtZW50aW9uIGluIGNvbW1pdCBsb2cuCj4gCgpPSy4gSSB3aWxsIGRvIGl0IGluIHRo
ZSBuZXh0IHZlcnNpb24uCgo+PiBDby1kZXZlbG9wZWQtYnk6IFNhbmtldCBHb3N3YW1pIDxTYW5r
ZXQuR29zd2FtaUBhbWQuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBTYW5rZXQgR29zd2FtaSA8U2Fu
a2V0Lkdvc3dhbWlAYW1kLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogU2h5YW0gU3VuZGFyIFMgSyA8
U2h5YW0tc3VuZGFyLlMta0BhbWQuY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9pM2MvbWFzdGVy
LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMzIKPj4gKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystCj4+IMKgIGRyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMgfMKg
IDEgKwo+PiDCoCBpbmNsdWRlL2xpbnV4L2kzYy9jY2MuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgIDEgKwo+PiDCoCBpbmNsdWRlL2xpbnV4L2kzYy9tYXN0ZXIuaMKgwqDCoMKgwqDCoMKgwqAg
fMKgIDEgKwo+PiDCoCA0IGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5jIGIvZHJpdmVycy9p
M2MvbWFzdGVyLmMKPj4gaW5kZXggYmE2ZjE3Y2I4YWE2Li4xNTk2ZWZkNmQ4MmEgMTAwNjQ0Cj4+
IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci5j
Cj4+IEBAIC0xNjU3LDYgKzE2NTcsMjEgQEAgaTNjX21hc3Rlcl9yZWdpc3Rlcl9uZXdfaTNjX2Rl
dnMoc3RydWN0Cj4+IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyKQo+PiDCoMKgwqDCoMKg
IH0KPj4gwqAgfQo+PiDCoCArc3RhdGljIGludCBpM2NfbWFzdGVyX3NldGFhc2FfbG9ja2VkKHN0
cnVjdCBpM2NfbWFzdGVyX2NvbnRyb2xsZXIKPj4gKm1hc3RlcikKPj4gK3sKPj4gK8KgwqDCoCBz
dHJ1Y3QgaTNjX2NjY19jbWRfZGVzdCBkZXN0Owo+PiArwqDCoMKgIHN0cnVjdCBpM2NfY2NjX2Nt
ZCBjbWQ7Cj4+ICvCoMKgwqAgaW50IHJldDsKPj4gKwo+PiArwqDCoMKgIGkzY19jY2NfY21kX2Rl
c3RfaW5pdCgmZGVzdCwgSTNDX0JST0FEQ0FTVF9BRERSLCAwKTsKPj4gK8KgwqDCoCBpM2NfY2Nj
X2NtZF9pbml0KCZjbWQsIGZhbHNlLCBJM0NfQ0NDX1NFVEFBU0EsICZkZXN0LCAxKTsKPj4gKwo+
PiArwqDCoMKgIHJldCA9IGkzY19tYXN0ZXJfc2VuZF9jY2NfY21kX2xvY2tlZChtYXN0ZXIsICZj
bWQpOwo+PiArwqDCoMKgIGkzY19jY2NfY21kX2Rlc3RfY2xlYW51cCgmZGVzdCk7Cj4+ICsKPj4g
K8KgwqDCoCByZXR1cm4gcmV0Owo+PiArfQo+PiArCj4+IMKgIHN0YXRpYyBpbnQgaTNjX21hc3Rl
cl9hZGRfc3BkX2RldihzdHJ1Y3QgaTNjX21hc3Rlcl9jb250cm9sbGVyCj4+ICptYXN0ZXIsCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpM2NfZGV2X2Jv
YXJkaW5mbyAqYm9hcmRpbmZvKQo+PiDCoCB7Cj4+IEBAIC0xNjg0LDYgKzE2OTksMTAgQEAgc3Rh
dGljIGludCBpM2NfbWFzdGVyX2FkZF9zcGRfZGV2KHN0cnVjdAo+PiBpM2NfbWFzdGVyX2NvbnRy
b2xsZXIgKm1hc3RlciwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGkzY2Rldi0+aW5mby5waWQgPSBp
M2NkZXYtPmJvYXJkaW5mby0+cGlkOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaTNjZGV2LT5pbmZv
LmR5bl9hZGRyID0gaTNjZGV2LT5ib2FyZGluZm8tPmluaXRfZHluX2FkZHI7Cj4+IMKgICvCoMKg
wqDCoMKgwqDCoCByZXQgPSBpM2NfbWFzdGVyX3NldGFhc2FfbG9ja2VkKG1hc3Rlcik7Cj4+ICvC
oMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVy
cl9mcmVlX2RldjsKPj4gKwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaTNjX2J1c19ub3JtYWx1c2Vf
bG9jaygmbWFzdGVyLT5idXMpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaTNjX21hc3Rlcl9yZWdp
c3Rlcl9uZXdfaTNjX2RldnMobWFzdGVyKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGkzY19idXNf
bm9ybWFsdXNlX3VubG9jaygmbWFzdGVyLT5idXMpOwo+PiBAQCAtMTkwNyw3ICsxOTI2LDE0IEBA
IHN0YXRpYyBpbnQgaTNjX21hc3Rlcl9idXNfaW5pdChzdHJ1Y3QKPj4gaTNjX21hc3Rlcl9jb250
cm9sbGVyICptYXN0ZXIpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9idXNfY2xlYW51
cDsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgIC3CoMKgwqAgaTNjX21hc3Rlcl9hZGRfc3BkX2Rldiht
YXN0ZXIsIGkzY2JvYXJkaW5mbyk7Cj4+ICvCoMKgwqAgLyoKPj4gK8KgwqDCoMKgICogSWYgdGhl
IEkzQyBzbGF2ZSBvbiB0aGUgYnVzIGlzIFNQRCBkZXZpY2UsIHRoZW4gZG8gbm90Cj4+IGZvbGxv
dyB0aGUgcmVndWxhcgo+PiArwqDCoMKgwqAgKiBEQUEgcHJvY2Vzcy4gQWxzbywgYXMgcGVyIFNQ
RCBzcGVjIFNFVEFBU0EgaXMgcmVxdWlyZWQgZm9yCj4+IHRoZSBidXMgZGlzY292ZXJ5Cj4+ICvC
oMKgwqDCoCAqIGFuZCBzZW5kaW5nIFJTVERBQSBhbmQgRElTRUMgaXMgY29uc2lkZXJlZCBhcyBp
bGxlZ2FsLiBTbwo+PiBza2lwIHRoZSBlbnRpcmUgcHJvY2Vzcwo+PiArwqDCoMKgwqAgKiBpZiB0
aGUgamRlY19zcGQgZmxhZyBoYXMgYmVlbiBpZGVudGlmaWVkIGZyb20gdGhlIEJJT1MuCj4+ICvC
oMKgwqDCoCAqLwo+PiArwqDCoMKgIGlmIChtYXN0ZXItPmpkZWNfc3BkKQo+PiArwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIGkzY19tYXN0ZXJfYWRkX3NwZF9kZXYobWFzdGVyLCBpM2Nib2FyZGluZm8p
Owo+PiDCoCDCoMKgwqDCoMKgIGlmIChtYXN0ZXItPm9wcy0+c2V0X3NwZWVkKSB7Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCByZXQgPSBtYXN0ZXItPm9wcy0+c2V0X3NwZWVkKG1hc3RlciwKPj4gSTND
X09QRU5fRFJBSU5fU0xPV19TUEVFRCk7Cj4+IEBAIC0yMzExLDYgKzIzMzcsMTAgQEAgc3RhdGlj
IGludCBpM2NfYWNwaV9jb25maWd1cmVfbWFzdGVyKHN0cnVjdAo+PiBpM2NfbWFzdGVyX2NvbnRy
b2xsZXIgKm1hc3RlcikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PREVWOwo+PiDC
oMKgwqDCoMKgIH0KPj4gwqAgK8KgwqDCoCBzdGF0dXMgPSBhY3BpX2V2YWx1YXRlX29iamVjdCht
YXN0ZXItPmFoYW5kbGUsICJfU1RSIiwgTlVMTCwKPj4gTlVMTCk7Cj4+ICvCoMKgwqAgaWYgKEFD
UElfU1VDQ0VTUyhzdGF0dXMpKQo+PiArwqDCoMKgwqDCoMKgwqAgbWFzdGVyLT5qZGVjX3NwZCA9
IHRydWU7Cj4+ICsKPiAKPiBBbSBJIHJpZ2h0ICJfU1RSIiBvYmplY3Qgc2hvdWxkIGNhcnJ5IGEg
c3RyaW5nICJqZGVjX3NwZCI/IEJ1dCB0aGlzCj4gY29kZSBpcyBub3QgYWN0dWFsbHkgY2hlY2tp
bmcgaXQsIG9ubHkgdGhlIGV4aXN0ZW5jZSBvZiBfU1RSPwo+IAoKSSBkb24ndCB0aGluayBzby4u
IGl0cyBqdXN0IHRoZSBzdHJpbmcgU1BEL0RJTU0uCgpTY29wZSAoXF9TQi5JM0NBKQp7CglOYW1l
IChfU1RSLCBVbmljb2RlICgiU1BEL0RJTU0iKSkgIC8vIF9TVFI6IERlc2NyaXB0aW9uIFN0cmlu
ZwoJTmFtZSAoX0RTRCwgUGFja2FnZSAoMHgwNCkgIC8vIF9EU0Q6IERldmljZS1TcGVjaWZpYyBE
YXRhCgl7CgkJLi4uCgl9KQoJTmFtZSAoTVNUMCwgUGFja2FnZSAoMHgwMikKCXsKCQkuLi4KCX0p
CglEZXZpY2UgKFNQRDApCgl7CgkJLi4uCgl9CgoJRGV2aWNlIChQTUkwKQoJewoJCS4uLgoJfQoK
CURldmljZSAoUkNEMCkKCXsKCQkuLi4KCX0KfQoKVGhhbmtzLApTaHlhbQoKPj4gwqDCoMKgwqDC
oCBudW1fZGV2ID0gZGV2aWNlX2dldF9jaGlsZF9ub2RlX2NvdW50KGRldik7Cj4+IMKgwqDCoMKg
wqAgaWYgKCFudW1fZGV2KSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKCZtYXN0ZXIt
PmRldiwgIkVycm9yOiBubyBjaGlsZCBub2RlIHByZXNlbnRcbiIpOwo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYwo+PiBiL2RyaXZlcnMvaTNjL21hc3Rl
ci9kdy1pM2MtbWFzdGVyLmMKPj4gaW5kZXggZjY4M2UyYTM5OGFkLi45MGE0MzIwOWU1NWUgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMKPj4gKysrIGIv
ZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYwo+PiBAQCAtMjgyLDYgKzI4Miw3IEBA
IHN0YXRpYyBib29sCj4+IGR3X2kzY19tYXN0ZXJfc3VwcG9ydHNfY2NjX2NtZChzdHJ1Y3QgaTNj
X21hc3Rlcl9jb250cm9sbGVyICptLAo+PiDCoMKgwqDCoMKgIGNhc2UgSTNDX0NDQ19HRVRTVEFU
VVM6Cj4+IMKgwqDCoMKgwqAgY2FzZSBJM0NfQ0NDX0dFVE1YRFM6Cj4+IMKgwqDCoMKgwqAgY2Fz
ZSBJM0NfQ0NDX0dFVEhEUkNBUDoKPj4gK8KgwqDCoCBjYXNlIEkzQ19DQ0NfU0VUQUFTQToKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiB0cnVlOwo+PiDCoMKgwqDCoMKgIGRlZmF1bHQ6Cj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L2kzYy9jY2MuaCBiL2luY2x1ZGUvbGludXgvaTNjL2NjYy5oCj4+IGluZGV4IGFkNTlh
NGFlNjBkMS4uYTE0NWQ3NjZhYjZmIDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2kzYy9j
Y2MuaAo+PiArKysgYi9pbmNsdWRlL2xpbnV4L2kzYy9jY2MuaAo+PiBAQCAtMzIsNiArMzIsNyBA
QAo+PiDCoCAjZGVmaW5lIEkzQ19DQ0NfREVGU0xWU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSTND
X0NDQ19JRCgweDgsIHRydWUpCj4+IMKgICNkZWZpbmUgSTNDX0NDQ19FTlRUTcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgSTNDX0NDQ19JRCgweGIsIHRydWUpCj4+IMKgICNkZWZpbmUgSTNDX0NDQ19F
TlRIRFIoeCnCoMKgwqDCoMKgwqDCoCBJM0NfQ0NDX0lEKDB4MjAgKyAoeCksIHRydWUpCj4+ICsj
ZGVmaW5lIEkzQ19DQ0NfU0VUQUFTQcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSTNDX0NDQ19JRCgw
eDI5LCB0cnVlKQo+PiDCoCDCoCAvKiBVbmljYXN0LW9ubHkgY29tbWFuZHMgKi8KPj4gwqAgI2Rl
ZmluZSBJM0NfQ0NDX1NFVERBU0HCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEkzQ19DQ0NfSUQoMHg3
LCBmYWxzZSkKPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaTNjL21hc3Rlci5oIGIvaW5j
bHVkZS9saW51eC9pM2MvbWFzdGVyLmgKPj4gaW5kZXggMzY3ZmFmN2M0YmYzLi5jZDgzOTBkOGI0
NjkgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvbGludXgvaTNjL21hc3Rlci5oCj4+ICsrKyBiL2lu
Y2x1ZGUvbGludXgvaTNjL21hc3Rlci5oCj4+IEBAIC01MTYsNiArNTE2LDcgQEAgc3RydWN0IGkz
Y19tYXN0ZXJfY29udHJvbGxlciB7Cj4+IMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGkzY19tYXN0
ZXJfY29udHJvbGxlcl9vcHMgKm9wczsKPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgc2Vjb25k
YXJ5IDogMTsKPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgaW5pdF9kb25lIDogMTsKPj4gK8Kg
wqDCoCB1bnNpZ25lZCBpbnQgamRlY19zcGQgOiAxOwo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGlu
dCBob3Rqb2luOiAxOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgbGlzdF9oZWFkIGkzYzsKPiAKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0Cmxp
bnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
