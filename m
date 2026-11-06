Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A48606A326
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Nov 2026 06:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VaYhk0D3;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=mcgcsd+e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SH73Hpjwv4x+Gtwmy3BZ9ywnp9r/KwlofDGePZkV6Eo=; b=VaYhk0D3zI5ZqkyqvcgD052yEj
	accbHsSiI3rZhofy0GSppaN76yz3UNTbl4pSR0Wo6llc1Q9uUxdmd/UmMya18vo0BLJX68ioyaFo3
	PxIRJQtlbopWj46rC2WyhfLbjx4XqLwdn9lwKCFwkUlxQErq/+6V+CFuOIL/biCVPtURGg9+Kr8Bq
	j5FmZFSzp21gUyRuTZriNDcCaL2ePACpYKnS2rm2uSSuAOesfUhqk0CtbZPXcrFoM9AnLz+H5DlZR
	ax3NZDa16exvf04we0IdwgkQJOyxyWERJUJQvwdRS6JbcNCAQoqlx+Ps91oZFBd+SGjlEncjmZUmk
	CaFfUg8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPDVx-0000000BMDU-33g2;
	Fri, 06 Nov 2026 06:33:29 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPDVu-0000000BMCu-3i9n
	for linux-i3c@lists.infradead.org;
	Fri, 06 Nov 2026 06:33:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dyztDK6T9a1HZLv5hX26eGnXoMqnY7Irwxh+/7era/DJi/nQ3QPymn4FO07adw2vJTVAaMmkcAkt1FFQO0GVeKSoYMGLesOcpZ6p6MftYTjTdjoCkChDqOw4EjAgK98Jduxcf0qg0fwbDa45HzhJKH5i+8uG+jlRWTp5cIvJN+/YAPgT7YaWEovX9r/A7lCw3cJR7YDdpwwuAGgxnlZoJnfA+JaZjsWOcFkdFH/OjCNnZxL29f21mG8TPqWbpoUlPGgJKTL/ewwQGVX1U7rDFPiZmYIIot+vtCiaILo0gtJFHhaxAC5gQ/MYCxVVyL2xjqXyoOqMy7zq6WUEPuJ+RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNVs6i3cY3ojfu3UYK1bwXO9RYXu1EamtFPpkeDb6fM=;
 b=mun6q/43pFwfAsBxLSu85UyMvwbGhwOlGGkqOqdttv28RtRfPRtr1jVwI4GL7UBcICedscfKWd5UZrVZL7bRl+xK3zxPjBujWhy4BtQns13GuK4h9qPaAl2GVlxER4dIo1a9U8J0jsSejn/KSW0WMp0+MllYlxO7nGRJgyXyTvCkNO4DaEZGu8X4e6BfDlJ7HesJzWIF/ZQN0/9gwFXWr7gvES14lZJQj7PezfyI/zwSZuPH0Q1dES2DrOah9F+Cv1xAkg9B71A5+xunKyVg5GxyH/L4dQ+A8TnU1K3Y4YDc5fgDh74aKubhMF9rS8jajRvPR/YIKjA0bU9kfjrWuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNVs6i3cY3ojfu3UYK1bwXO9RYXu1EamtFPpkeDb6fM=;
 b=mcgcsd+e5VxxmaC6txHyuonirys7HrU9f0D1+r6Husr1MmlxQ9J4ozp/FWJ/YNai6C101dkb3oe6pSsmjFoJq63I+CcEkG7ErcQRs96X2zVO3mUzqJNWwW5PegQ0UxEKnl1M/Isjeg9kplHB2U6rJ6B/Hihh1RMDyk4VeJpbHC4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB6942.namprd12.prod.outlook.com (2603:10b6:a03:449::13)
 by IA0PR12MB8976.namprd12.prod.outlook.com (2603:10b6:208:485::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 06:33:19 +0000
Received: from SJ0PR12MB6942.namprd12.prod.outlook.com
 ([fe80::20d8:2aab:1836:8d69]) by SJ0PR12MB6942.namprd12.prod.outlook.com
 ([fe80::20d8:2aab:1836:8d69%4]) with mapi id 15.21.0569.011; Fri, 6 Nov 2026
 06:33:19 +0000
Message-ID: <daaec067-4628-4b2b-b7a1-a2a7fc8de843@amd.com>
Date: Fri, 6 Nov 2026 12:03:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] i3c: dw: Track the transmit and receive buffer
 depths separately
To: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev
Cc: Shubham Patil <shubhamsanjay.patil@amd.com>,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, Frank.Li@kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "git (AMD-Xilinx)" <git@amd.com>
References: <20261105085425.3418230-1-shubhamsanjay.patil@amd.com>
 <20261105085425.3418230-3-shubhamsanjay.patil@amd.com>
 <sashiko-outbox-198746@kernel.org>
 <auz-oTwusjUDhgh3@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: "Patil, Shubham Sanjay" <shubpati@amd.com>
In-Reply-To: <auz-oTwusjUDhgh3@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To SJ0PR12MB6942.namprd12.prod.outlook.com
 (2603:10b6:a03:449::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6942:EE_|IA0PR12MB8976:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b39c36e-1916-4fa2-9ed4-08df3bcfd8cb
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|261102123227099003|4143699003|11063799006|261009223027099003|261026121527099003|261028144727099003|261026140227099003|56012099006|261022105027099003|261021121427099003|10067099003|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 3NLTYF+KNXc+iEsOTXRgSgPZTXDKPcgmgRGR1nBRaTUS3xXulcjnp4QjgM2dwZmESxb127NCz8PFj8eE/CByz9w5zdCdmwTFcnN6qWPHga94P6aUFnoKMinYjVSCdKgLv1MBdWxjrF19Muh2HeJPTuTjMcY3jUKsZQJIaTztJWoqxtfXe5g07TZgeZ6yTnEyPPfyw4sclvBvp3Ej/kmvc3xT4cuzR6j1BXizvmwGqMoIbI6nO59Cbr9ZFiy3Qf5VD4u+d2MqK3lpwlfIjoJohPG/57M+9cdDDtZoV+HALJ+DXpogUdKnkxgGzWFeZaO5P6ZE4Dvbl0SSpebeI2M1hpVCAkenU+Tq0/cnuvCsM4dd1OFLhqur1eMQmmZjMkpTpseLzKUCa/eC13nFyJWGuHk8DDORx73W/X/W6t7q+FYleCqGwExjTd2af54wV8nKiL0N21u7v7IfoGhdKMgg3oeEzwiPVMFrlFcIk8P2k/T8vGHsSu7IJ49p8BUoczaiYQrwIxyia0pBSR+YeW1w+Slum9NGly1icWiyFxw7Me9g8fyix3BWqRgywbBqAewAeSxP8ZwQRPpkg/3YIbJQ88xSM51SfUfgKaPmOn9P4eo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6942.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261102123227099003)(4143699003)(11063799006)(261009223027099003)(261026121527099003)(261028144727099003)(261026140227099003)(56012099006)(261022105027099003)(261021121427099003)(10067099003)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mml5UzhHYmw1TEcvN3RwRTdoZ0s2dnFhcjg3NE1VWGN5dWRqUE4xdHEzQUtI?=
 =?utf-8?B?WGpwWnRtbmRoa2k4Rk9CZ1V0K0IvKzExeFNXb1hSUEVMb0ZkQnRuYlNETytO?=
 =?utf-8?B?M1hDSU4vM0dpVlpueTNCL0hQWTEzZ0FCNHI4b0M3U0k1bitMVkdrWjUxMG1m?=
 =?utf-8?B?TWpUbldSYnU5dzF2ODJWMGlmd1N6K2lNcGFwL2hzd2c3dC9tczR2dkpzTU9t?=
 =?utf-8?B?OGFLYUZaNFIwNkd3NzBxOFBRL0hTUFByd2JpK05TOVkrUG9QcVlvUm5Yd01q?=
 =?utf-8?B?Qk9hV3dqRGQyVGlodDRBQ1RiNDlZOGJKYVlOYkV1N2szZzcyYnhiaDR0YjZ5?=
 =?utf-8?B?OU5hQXVJNGxkV1VEejQ5QTdScnBodzFMblF0VUcvSXFTMVBaVDZ4aDZ2cUdj?=
 =?utf-8?B?TW4vN3RVUEJlbjR3ZENLVFc0aC81djcrZERGOWNJVVR0U2ZQR2xVbk9zakYr?=
 =?utf-8?B?bHd0VGIyVXZTbmwrTTVscktEY0pIS1BqaGtleEpnOWxuMGZsdHpKczhMbEJC?=
 =?utf-8?B?VnVTY3BvUGc2YzY0d1ZIazlEK2szOFFBVzJ1VEkxN2hUV2xwUWhSSGRWOTlk?=
 =?utf-8?B?Y0Fseno2anR0aE1wYzA0TVlIWWwrdTZuSzNiNGcvQkk0TWtDZlVzSEdHNVJy?=
 =?utf-8?B?b1BueGtBZktmUFVRaU1qQWx5TTNYbmZVOEp6TFppbndFNlJlaUdZSmNUN0tn?=
 =?utf-8?B?aU8xOEZxbEZHdnlqQjRvNHA1RC85c290WEtTTlU0UmZ4Z2V0eEJtd1k5UVYr?=
 =?utf-8?B?T0xIL29KTjNSMGordGhEK2ptYWNtNlNlK1ZKemNyUmZnSDFsZnBlYXM2U1ZO?=
 =?utf-8?B?dDNBbVF2MlpVZlVDaEdGQ0RGT092TTJubi91cnlzKzhWK0phS2kyMGlGNk9u?=
 =?utf-8?B?ZFQ0OTZieHBsOGNvdm1nTHlIOWZNaUhYWXpreHZTcS9Mc2hvSlFxK3orazBH?=
 =?utf-8?B?WmN3YS9VWUI4aGk4VUtUNk5nZTJKTENOZlpzSnpTVmhjbG9WMis5RHdKRXVI?=
 =?utf-8?B?OWxuZGkyaEhjZW15YyswUGdvSWJxZ3g2NTF3YlB0aFJ5aFpFbEpFNEFFVHdF?=
 =?utf-8?B?cVVkMkJXSk13REF6WlhjVXJ4emVxL3V6YVZidVoxeVJXZmZSb0tDNGJLUURo?=
 =?utf-8?B?VzNiOCs4MS9GQWw0L3VUcXdvLzZBb3JGM1AwcU1Tenh1Wkw4ajZISE0zMHZ4?=
 =?utf-8?B?RHlhcDRRRWI4MGJPZDRsSXB5NVBjVitDZk1yZjBNWktRc3k5WUg4b01Lck5a?=
 =?utf-8?B?Mm54TGxwUldNQWQ0REhCQzRRODBSRlRnSG9ZMkZNUVpSN0xscktJb3lZUFpD?=
 =?utf-8?B?WGwvQkZlL3BxYmI4WTZsU09PVnRBU1RONWM4N25mSzEvVnJsdnBieWhEaFNF?=
 =?utf-8?B?U1lxbHBDbEhLMzJUclIvMEZ3bU5VN0ZPWWJwY0cvemtzclBXSG00ZWRqaW1X?=
 =?utf-8?B?YTQ1UTMxc1R1enNqOW1rbHBjd2dhbnVUajgxMENONUhYdzc5bFNXWDduOHdU?=
 =?utf-8?B?YklrUmZTQklwQTlid3NSTVl6RGFmNER0UjdhblhOelhuSERueGZ1YWxRRUpG?=
 =?utf-8?B?T0hRY2JpWnMydWloMURVTVBleE1nMzIrUnlva2kvVEJzWndGNE9aVC8rNkli?=
 =?utf-8?B?ZDA1d1EvRVFoMmZrbW5nYWNSb3B0WGMyUk1RYVh4Nkk2OHpPRWtoRUlJRmRl?=
 =?utf-8?B?YXp4ZGlteFpnM3NkRnM1ZU5ENXNwN2UycUVkeFh4RU5lRVd1T2RRa3FKUGxE?=
 =?utf-8?B?ZWJ2MXRBMVNDM2N3U2tmVnhrZVh0bWdCM1JuUGN2YlBaT29sV095NUl3L3dX?=
 =?utf-8?B?eTdpZnFrQmV1Nm00ZWpkbm9xR3pJNTRwQXVjWWo2TVpxZEpBOEJxeWFMVUh2?=
 =?utf-8?B?aTlxNHlYRDM2VGplWXFRbStmb1ZIa3dSNGI5VmYxYWNKRCs3MFIydjcraGRO?=
 =?utf-8?B?VGVVbjBheTlZTW8zQ2hMdWtkMEdXcVlXUllIU29ZZGVaUHFlOHJVZ2JES21P?=
 =?utf-8?B?Qk1kdm90aHBOMGhQVnlkSHBVcHYzNzZTU0RMeFJReGdENXNyeDlqaHY3Zksr?=
 =?utf-8?B?ZVMvcVlIZ0hEeFY2MGtmSGtObGRnWUl6Y2o4blR2SzNzaWRmQmR0V2VQQXIy?=
 =?utf-8?B?TlFMUStFbmVLSEx5eWdPRWh0bHZDcVFwK0dXVjc4RWpkOUVaS0h2MDdFTTBq?=
 =?utf-8?B?a0NTcmFoaHNFUDQyc1BsZzlmanA3bkxXWmw1MHFiWTRGMUtvYVlnODVUWmVW?=
 =?utf-8?B?NkdlTE1BdHhUVTZMOTlsTE5DbzZoc0hFT3h4K2RYK1NLeU9UeUVRcHBrYkcr?=
 =?utf-8?B?TncwNXZ3Z1NvcG9VU3U4MEpOcUpHaFNVRlNjQ0hoWlRqTmhQTktQQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b39c36e-1916-4fa2-9ed4-08df3bcfd8cb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6942.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 06:33:19.4599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +N/Nxfypj2uQAeKvbXxTDRoVO1JFWmRk2XixDhYayLzoAzr4HoespZZUebGA/hdTGzryhdpxiPll44PHflbAow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8976
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_223327_066591_D2A571A6 
X-CRM114-Status: GOOD (  17.67  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgpPbiAxMS82LzIwMjYgMzozOSBBTSwgRnJhbmsgTGkgd3JvdGU6Cj4gQ2F1dGlvbjogVGhpcyBt
ZXNzYWdlIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFVzZSBwcm9wZXIgY2F1
dGlvbiB3aGVuIG9wZW5pbmcgYXR0YWNobWVudHMsIGNsaWNraW5nIGxpbmtzLCBvciByZXNwb25k
aW5nLgo+IAo+IAo+IE9uIFRodSwgTm92IDA1LCAyMDI2IGF0IDA5OjAxOjE0QU0gKzAwMDAsIHNh
c2hpa28tYm90QGtlcm5lbC5vcmcgd3JvdGU6Cj4+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmli
dXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDEgcG90ZW50aWFsIGlzc3VlKHMpIHRvIGNv
bnNpZGVyOgo+PiAtIFtIaWdoXSBpM2M6IGR3OiB1OCB0cnVuY2F0aW9uIG9mIHJ4Zmlmb2RlcHRo
IGluIGR3X2kzY19jb21tb25fcHJvYmUoKQo+PiAtLQo+Pgo+PiBjb21taXQgYzkzY2M2ODQzYjU3
OTkzZDA1M2RiMDNjYzNmN2NlZTI1ZGJkNDM3MQo+PiBBdXRob3I6IFNodWJoYW0gUGF0aWwgPHNo
dWJoYW1zYW5qYXkucGF0aWxAYW1kLmNvbT4KPj4KPj4gaTNjOiBkdzogVHJhY2sgdGhlIHRyYW5z
bWl0IGFuZCByZWNlaXZlIGJ1ZmZlciBkZXB0aHMgc2VwYXJhdGVseQo+Pgo+PiBUaGlzIGNvbW1p
dCBzcGxpdHMgY2Fwcy5kYXRhZmlmb2RlcHRoIGludG8gY2Fwcy50eGZpZm9kZXB0aCBhbmQKPj4g
Y2Fwcy5yeGZpZm9kZXB0aCwgcG9wdWxhdGVzIGNhcHMucnhmaWZvZGVwdGggZnJvbSB0aGUgUVVF
VUVfU0laRV9DQVBBQklMSVRZCj4+IHJlZ2lzdGVyLCBhbmQgZXhwb3NlcyB0aGUgRklGTyBjYXBh
Y2l0aWVzIHZpYSBiYXNlLnR4X2ZpZm9fYnl0ZXMgYW5kCj4+IGJhc2UucnhfZmlmb19ieXRlcy4K
Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kzYy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5jIGIv
ZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkzYy1tYXN0ZXIuYwo+Pj4gaW5kZXggZDExMTlmMjAzZDFi
Ni4uZGQ1NDYyYjEyOTUxNCAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1p
M2MtbWFzdGVyLmMKPj4+ICsrKyBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmMK
Pj4+IEBAIC0yMDMsNyArMjAzLDEwIEBACj4+PiAgICNkZWZpbmUgQlVTX0lETEVfVElNSU5HICAg
ICAgICAgICAgICAgICAgICAweGQ4Cj4+PiAgICNkZWZpbmUgSTNDX1ZFUl9JRCAgICAgICAgICAg
ICAgICAgMHhlMAo+Pj4gICAjZGVmaW5lIEkzQ19WRVJfVFlQRSAgICAgICAgICAgICAgICAgICAg
ICAgMHhlNAo+Pj4gLSNkZWZpbmUgRVhURU5ERURfQ0FQQUJJTElUWSAgICAgICAgICAgICAgICAw
eGU4Cj4+PiArI2RlZmluZSBRVUVVRV9TSVpFX0NBUEFCSUxJVFkgICAgICAgICAgICAgIDB4ZTgK
Pj4+ICsjZGVmaW5lIFFVRVVFX1NJWkVfQ0FQQUJJTElUWV9SWF9CVUYoeCkgICAgKCgoeCkgJiBH
RU5NQVNLKDcsIDQpKSA+PiA0KQo+Pj4gKy8qIFNpemVzIGFyZSBlbmNvZGVkLCAwIG1lYW5pbmcg
MiBEV09SRHMgYW5kIGV2ZXJ5IGZ1cnRoZXIgc3RlcCBkb3VibGluZyBpdC4gKi8KPj4+ICsjZGVm
aW5lIFFVRVVFX1NJWkVfVE9fRFdPUkRTKHgpICAgICAgICAgICAgKDJVIDw8ICh4KSkKPj4+ICAg
I2RlZmluZSBTTEFWRV9DT05GSUcgICAgICAgICAgICAgICAgICAgICAgIDB4ZWMKPj4+Cj4+PiAg
ICNkZWZpbmUgRFlOX0FERFJfTE9fTUFTSyBHRU5NQVNLKDQsIDApCj4+PiBAQCAtOTc4LDggKzk4
MSw4IEBAIHN0YXRpYyBpbnQgZHdfaTNjX21hc3Rlcl9pM2NfeGZlcnMoc3RydWN0IGkzY19kZXZf
ZGVzYyAqZGV2LAo+Pj4gICAgICAgICAgICAgICAgICAgICAgbnR4d29yZHMgKz0gRElWX1JPVU5E
X1VQKGkzY194ZmVyc1tpXS5sZW4sIDQpOwo+Pj4gICAgICB9Cj4+Pgo+Pj4gLSAgIGlmIChudHh3
b3JkcyA+IG1hc3Rlci0+Y2Fwcy5kYXRhZmlmb2RlcHRoIHx8Cj4+PiAtICAgICAgIG5yeHdvcmRz
ID4gbWFzdGVyLT5jYXBzLmRhdGFmaWZvZGVwdGgpCj4+PiArICAgaWYgKG50eHdvcmRzID4gbWFz
dGVyLT5jYXBzLnR4Zmlmb2RlcHRoIHx8Cj4+PiArICAgICAgIG5yeHdvcmRzID4gbWFzdGVyLT5j
YXBzLnJ4Zmlmb2RlcHRoKQo+Pj4gICAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPj4+
Cj4+PiAgICAgIHN0cnVjdCBkd19pM2NfeGZlciAqeGZlciBfX2ZyZWUoa2ZyZWUpID0gZHdfaTNj
X21hc3Rlcl9hbGxvY194ZmVyKG1hc3RlciwgaTNjX254ZmVycyk7Cj4+PiBAQCAtMTEzNiw4ICsx
MTM5LDggQEAgc3RhdGljIGludCBkd19pM2NfbWFzdGVyX2kyY194ZmVycyhzdHJ1Y3QgaTJjX2Rl
dl9kZXNjICpkZXYsCj4+PiAgICAgICAgICAgICAgICAgICAgICBudHh3b3JkcyArPSBESVZfUk9V
TkRfVVAoaTJjX3hmZXJzW2ldLmxlbiwgNCk7Cj4+PiAgICAgIH0KPj4+Cj4+PiAtICAgaWYgKG50
eHdvcmRzID4gbWFzdGVyLT5jYXBzLmRhdGFmaWZvZGVwdGggfHwKPj4+IC0gICAgICAgbnJ4d29y
ZHMgPiBtYXN0ZXItPmNhcHMuZGF0YWZpZm9kZXB0aCkKPj4+ICsgICBpZiAobnR4d29yZHMgPiBt
YXN0ZXItPmNhcHMudHhmaWZvZGVwdGggfHwKPj4+ICsgICAgICAgbnJ4d29yZHMgPiBtYXN0ZXIt
PmNhcHMucnhmaWZvZGVwdGgpCj4+PiAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+
Pj4KPj4+ICAgICAgc3RydWN0IGR3X2kzY194ZmVyICp4ZmVyIF9fZnJlZShrZnJlZSkgPSBkd19p
M2NfbWFzdGVyX2FsbG9jX3hmZXIobWFzdGVyLCBpMmNfbnhmZXJzKTsKPj4+IEBAIC0xNzM4LDcg
KzE3NDEsMTQgQEAgaW50IGR3X2kzY19jb21tb25fcHJvYmUoc3RydWN0IGR3X2kzY19tYXN0ZXIg
Km1hc3RlciwKPj4+ICAgICAgbWFzdGVyLT5jYXBzLmNtZGZpZm9kZXB0aCA9IFFVRVVFX1NUQVRV
U19MRVZFTF9DTUQocmV0KTsKPj4+Cj4+PiAgICAgIHJldCA9IHJlYWRsKG1hc3Rlci0+cmVncyAr
IERBVEFfQlVGRkVSX1NUQVRVU19MRVZFTCk7Cj4+PiAtICAgbWFzdGVyLT5jYXBzLmRhdGFmaWZv
ZGVwdGggPSBEQVRBX0JVRkZFUl9TVEFUVVNfTEVWRUxfVFgocmV0KTsKPj4+ICsgICBtYXN0ZXIt
PmNhcHMudHhmaWZvZGVwdGggPSBEQVRBX0JVRkZFUl9TVEFUVVNfTEVWRUxfVFgocmV0KTsKPj4+
ICsKPj4+ICsgICByZXQgPSByZWFkbChtYXN0ZXItPnJlZ3MgKyBRVUVVRV9TSVpFX0NBUEFCSUxJ
VFkpOwo+Pj4gKyAgIG1hc3Rlci0+Y2Fwcy5yeGZpZm9kZXB0aCA9Cj4+PiArICAgICAgICAgICBR
VUVVRV9TSVpFX1RPX0RXT1JEUyhRVUVVRV9TSVpFX0NBUEFCSUxJVFlfUlhfQlVGKHJldCkpOwo+
Pj4gKwo+Pj4gKyAgIG1hc3Rlci0+YmFzZS50eF9maWZvX2J5dGVzID0gbWFzdGVyLT5jYXBzLnR4
Zmlmb2RlcHRoICogNDsKPj4+ICsgICBtYXN0ZXItPmJhc2UucnhfZmlmb19ieXRlcyA9IG1hc3Rl
ci0+Y2Fwcy5yeGZpZm9kZXB0aCAqIDQ7Cj4+Pgo+Pj4gICAgICByZXQgPSByZWFkbChtYXN0ZXIt
PnJlZ3MgKyBERVZJQ0VfQUREUl9UQUJMRV9QT0lOVEVSKTsKPj4+ICAgICAgbWFzdGVyLT5kYXRz
dGFydGFkZHIgPSByZXQ7Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL2R3LWkz
Yy1tYXN0ZXIuaCBiL2RyaXZlcnMvaTNjL21hc3Rlci9kdy1pM2MtbWFzdGVyLmgKPj4+IGluZGV4
IGY1YjQ0OTFiMjQ3YTAuLmUyMzU1NGJmYzVlNDkgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2kz
Yy9tYXN0ZXIvZHctaTNjLW1hc3Rlci5oCj4+PiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIvZHct
aTNjLW1hc3Rlci5oCj4+PiBAQCAtMTQsNyArMTQsOCBAQAo+Pj4KPj4+ICAgc3RydWN0IGR3X2kz
Y19tYXN0ZXJfY2FwcyB7Cj4+PiAgICAgIHU4IGNtZGZpZm9kZXB0aDsKPj4+IC0gICB1OCBkYXRh
Zmlmb2RlcHRoOwo+Pj4gKyAgIHU4IHR4Zmlmb2RlcHRoOwo+Pj4gKyAgIHU4IHJ4Zmlmb2RlcHRo
Owo+Pgo+PiBbU2V2ZXJpdHk6IEhpZ2hdCj4+IENhbiBtYXN0ZXItPmNhcHMucnhmaWZvZGVwdGgg
b3ZlcmZsb3cgdTggYW5kIHRydW5jYXRlIHRvIDAgaW4KPj4gZHdfaTNjX2NvbW1vbl9wcm9iZSgp
Pwo+Pgo+PiBJbiB0aGUgRGVzaWduV2FyZSBJM0MgY29udHJvbGxlciwgUVVFVUVfU0laRV9DQVBB
QklMSVRZX1JYX0JVRihyZXQpIGNhbgo+PiByZXR1cm4gdXAgdG8gMHg3ICgyNTYgMzItYml0IHdv
cmRzLCBvciAxMDI0IGJ5dGVzKS4gV2hlbiB0aGF0IGhhcHBlbnMsCj4+IFFVRVVFX1NJWkVfVE9f
RFdPUkRTKDcpIGV2YWx1YXRlcyB0byAyNTYgKDB4MTAwKSwgd2hpY2ggdHJ1bmNhdGVzIHRvIDAg
d2hlbgo+PiBzdG9yZWQgaW50byB0aGUgdTggcnhmaWZvZGVwdGggZmllbGQgaW4gc3RydWN0IGR3
X2kzY19tYXN0ZXJfY2Fwcy4KPj4KPj4gV2l0aCBtYXN0ZXItPmNhcHMucnhmaWZvZGVwdGggc2V0
IHRvIDAsIG1hc3Rlci0+YmFzZS5yeF9maWZvX2J5dGVzIGFsc28KPj4gYmVjb21lcyAwIGluIGR3
X2kzY19jb21tb25fcHJvYmUoKSwgYW5kIHRoZSBucnh3b3JkcyA+Cj4+IG1hc3Rlci0+Y2Fwcy5y
eGZpZm9kZXB0aCBjaGVjayBpbiBib3RoIGR3X2kzY19tYXN0ZXJfaTNjX3hmZXJzKCkgYW5kCj4+
IGR3X2kzY19tYXN0ZXJfaTJjX3hmZXJzKCkgd2lsbCByZWplY3QgZXZlcnkgbm9uLWVtcHR5IHJl
YWQgdHJhbnNmZXIgd2l0aAo+PiAtRU9QTk9UU1VQUC4KPj4KPj4gU2hvdWxkIHJ4Zmlmb2RlcHRo
IChhbmQgdHhmaWZvZGVwdGgpIGluIHN0cnVjdCBkd19pM2NfbWFzdGVyX2NhcHMgYmUgdTE2Cj4+
IGluc3RlYWQgb2YgdTg/Cj4gCj4gTWFrZSBzZW5zZSwgcGxlYXNlIGZpeCBpdC4KCiAgSSBjaGVj
a2VkIHRoZSBEZXNpZ25XYXJlIEkzQyBkYXRhYm9vaywgc2VjdGlvbiAxMS4xLjU4CiAgIChRVUVV
RV9TSVpFX0NBUEFCSUxJVFkpLiBSWF9CVUZfU0laRSBpcyBpbiBiaXRzIFs3OjRdLCBhbmQgdGhl
CiAgIGRvY3VtZW50ZWQgZW5jb2RpbmdzIGFyZSAweDAgdGhyb3VnaCAweDUsIHJlcHJlc2VudGlu
ZyAyIHRocm91Z2gKICAgNjQgRFdPUkRzLgoKICAgVGhlc2UgZG9jdW1lbnRlZCBkZXB0aHMgZml0
IGluIHU4LiBUaGUgb3ZlcmZsb3cgZXhhbXBsZSByZXF1aXJlcwogICBlbmNvZGluZyAweDcsIHdo
aWNoIGlzIG5vdCBsaXN0ZWQgaW4gdGhpcyBzZWN0aW9uLgoKPiAKPiBGcmFuawo+IAo+Pgo+PiAt
LQo+PiBTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQv
MjAyNjExMDUwODU0MjUuMzQxODIzMC0xLXNodWJoYW1zYW5qYXkucGF0aWxAYW1kLmNvbT9wYXJ0
PTIKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkz
Ywo=
