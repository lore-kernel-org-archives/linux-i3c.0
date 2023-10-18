Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EF4CDB47E
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Oct 2023 15:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mC75gBE9iz9boRCGccu8PDJrFRddeF9b5ocmOJ4VsSI=; b=Xy+SdGx6foOFn0
	qZ4YZbXa/ua7g2SXzpOfZJTIHC4Jx7ah2nZ6phMIMbbSuxeyrQQfw9iaH+smd994j38H7nsH+fnNF
	b7zaZiIro6F57d3NFWmm8yAMnybIU35qYIYrPU6SiV7NvYIGne+9eu56FEslihE70FeKizY8Pnowo
	QhJicL4MZmID7ye44NazGyrKLniGT4dDuEk6dLWA5Qg8loPCCoJA0m0XTbiHa4WSmKnTJOc6v79j7
	TUmmrKecHwCjoDKXrPsiZztPhr9SWIak6ylFbODp1Hv/FbxuXColUVXYaG9OuMM7Mex+I0mICToRL
	jkxjoxb1ueAgxSXwWktg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt8ms-00F6FG-0N;
	Wed, 18 Oct 2023 15:48:46 +0000
Received: from mail-db3eur04on0630.outbound.protection.outlook.com ([2a01:111:f400:fe0c::630] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt8mo-00F6EF-20
	for linux-i3c@lists.infradead.org;
	Wed, 18 Oct 2023 15:48:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hft0OZUzi267r/Y59gfOEaksV7+F5W3Q1Mtg1rNRbuzdtqIpLqPR+TktFe/DqxhMsk9mH8CExstb4ktBqHjyom+/uCqZRidbhS7xv4hIHrwFB+4EgHes8g/Fqxfi/eFXiCgRudPOsMDMXPDcTxPREYPKxxP//OYFNW/JLGUZafc4CkJ727a8W+MLznRLoEDPZDYhgdSgfukc5Z8m5Hv/hEBuRYyoe3Rn9LSfHsfDsZfJq4ouiaqcBzefc7jxcFP8ZiFYJAsBwT1pqv3OGd2o/RDeuLbUdS6nJxSgYxDymYKPIDmFKNs2euGxgR6RfzpUNyx6S70pjnTxVgc8HtKdlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwb1VsNDBbozmsOUcMb3xZ3G29YwvH4CvTUONoNOp+w=;
 b=f905wwBdJEPBFVodch/ZymsptFwSk17aa/USZ271WJt9yoRHM8StqVzHtUqeKwnwFI13fdhCDX0bek7Wf0KgVLQ97+5AxmYW8BafFyb30m7iOg1quBPMi5CZehg2o1NDD3DEtfVMq4USXwCaZ7+pCY2/EbamF0ZTqPKrst3Ps3/CeEgGIZyD3GnVmt7OvQfmq3X5YCzln2LK8d8tGeAN1npiHBIeC/nIY26CorGx7GPEEWWR+fbxl+6yz/q7t2OItKpVOIsjov0KQZo1y5DkyeurIcvY32YJztF9m70TAk5Aai+Y8o2klnIbjFbrCLE1BkcDqcgqGc7+efICfZlBfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwb1VsNDBbozmsOUcMb3xZ3G29YwvH4CvTUONoNOp+w=;
 b=g7rO4BhC6CYUKbsPz/Qy1BIa0cJ8+9J3FGCf0nx95tIX6/2eEAau3qULy9bSXrxEfDurK0GKAQgVPxZQM/i18GomNVRRRIN7d8KMkUmz1K3zV5pLuVWs6dZ178JOCfyoJkOu/LxxLxlQZp+iFiF3CFcBMWkSRqNfH503wg2EtH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by GVXPR04MB9777.eurprd04.prod.outlook.com (2603:10a6:150:115::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 15:48:27 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 15:48:27 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com
Cc: Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com,
	imx@lists.linux.dev,
	joe@perches.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] i3c: master: svc: collection of bugs fixes
Date: Wed, 18 Oct 2023 11:48:03 -0400
Message-Id: <20231018154809.3304558-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SJ0PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:a03:331::32) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|GVXPR04MB9777:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d20cd03-fc1a-46c6-3d14-08dbcff1aaf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I0Q+FtdOLGZgi/2QIqQf7ndIAFaaguvX1eEP1SWBOk6QtNN3eTQnMYUSjp+Vfv2SiDEWF6CVU39T2WiZ7pib1kowFKEQd2lg5peWfDx4WV6uM9PobOrszhQ64aklA372PFEALsXbq+MekEo68vIe9qMKjyquo5MGhgIrLLFVWtI0lMWrL6GykCTR6toM6UTnuxgvjsTBLejkTnkqE2fzH7bxy8M4i5Fl2n84gstjGWSs8L6Gt4lhe2fENYuAn/wYKeU/IYE+wAREBjYd40ZsJrWJqQCzm2/gEcBVeozxJ8nEN/SyQuMQgqjhs7Tug+1WA0Eng6aRx/l4sOrEcpxzfYdkeiqPkjlyMuoYMdzwHMNmryd+do77nOjsvejS+DtdmSPaAA+WgMxRPVpQGK5fzucL+/a5Z3uDfDdVPZLM4ENxZztyCoIKn+0nz4uxbPbWwVjyw1Y1yK6W9fkfoeivqb2cYzF7RTuMeMdPvnYZ620ja3M/HbH1VYv7tkSlL18XsTWMyLxAEenLTaz5qRKHgctsIoA2BFVNfWcXr95u5U6zbDNsr2wbotzIUt0LjAlGA5qADmTSzdqZi4a7gfSYm4/v6Q1O0/T1w0qgvC3/6ZbbJOIwtFOMigkyxeIqM1rH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(346002)(376002)(39860400002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(38350700005)(52116002)(6666004)(6486002)(6506007)(6512007)(478600001)(66556008)(6916009)(66476007)(316002)(66946007)(36756003)(2616005)(1076003)(83380400001)(26005)(41300700001)(38100700002)(5660300002)(4744005)(8936002)(4326008)(8676002)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGdVTldCQldXc3A3KzFvR2pFVUpySTFGa2xtWWJZdUVwem9xV2JLemlsTSsy?=
 =?utf-8?B?d3VVSUdON2xDZE4wYWdRTGg2SWxRbENLSDdZNmoxSzBxblNJdm9kODdFOVlC?=
 =?utf-8?B?T2s2eHBmWWZsVHc3RzBGcjIwditNWk1uL2VqUUFINTZtbGxEZEkvdGxxTFNF?=
 =?utf-8?B?Q0dwYTFIcHpBR2VYZ01salZoWW5tUTYrQkxoNG9xVjZmZm9tZlljemkrTXV0?=
 =?utf-8?B?RTEyNHZZbGFKTlEzeE9pRTZKcWFBcU4zV01TMldpT0tieEQwd1B1clFqOGR3?=
 =?utf-8?B?Wm9QYlU4SjJ5SUx5dlNYemQrZHcvUFdaK2FIcElPdnhJajFqQWNKdnducnBl?=
 =?utf-8?B?UzZkdXBKRStuakEyNnQ4dVM4bEk5NmVtbjZORytZL2NScFllK3hHOTk2R2lY?=
 =?utf-8?B?RHFVYWE1T2p1QnBzNTlzNGRCMkhUcFh5Q3hKcDFrQUpLV21WamZlNkR2dTlW?=
 =?utf-8?B?c0kwTThpeEU2akllb1F5Ymp3ZXF6WDlLRVNrbnRjVWluTWtKVkV5YWNaYkJh?=
 =?utf-8?B?aDQvNkhjMEcxQ3FmdlpIZC9Xd3M1MDNUbnlpL0M0dTlVZGdwcEtDMURoaFdw?=
 =?utf-8?B?L3FzcVFmZWJRME5tK2RHekp5Q2FHNFVTZzRLM3VlUy80RTV1T2w1VkZaazhy?=
 =?utf-8?B?Q3RSbVprRDROREM2WFgzU1pKSDBWcWxXOC9YY1AvNGI0UTR3dk9sU3BVV05w?=
 =?utf-8?B?bmNWYVlZZXVZY05NR0lpT3NaU3l1TSt3T2V1ZjRnTmdGaHBwVTIwbGNJMldW?=
 =?utf-8?B?WU1aUkxVZFo5NXVvaHA0ajlqRGZoUzRYNXVhcjlRNWVFRkszTis5MXdmNkRy?=
 =?utf-8?B?d1FrSENKTnpKNTd3QllRY1JJcFVrYjh2U0RXTDQ5anVCTXFnNVlyWTBpS1RT?=
 =?utf-8?B?SmhDeEF2Y0UvU0VYdzdsbWJLdGxYMkEvYzJ2OUM2aVdwTGt2bG1XR2pTNTRN?=
 =?utf-8?B?MTBtODIvNkRGK1loSndxWHZqSmdVZ01lWFBib1BqQlVlQjZhaHBwQ0xyOU8x?=
 =?utf-8?B?eHBLTHlRSlduRjg1NldWcjdEWlZwSXdGbithR2xLNm9EUE51U00ybUE5NXM0?=
 =?utf-8?B?NGh2TWVPYkxQWjJTR0xFL3FjYkltRVg2RUl4VmNVNFIvZnF6SytkUHBhVUJj?=
 =?utf-8?B?VTk2anBJL0pxTmpabVRLZ3Y2b2dOTVBJK0EzdVBuWEdqODkrM1dxWk9MQlAv?=
 =?utf-8?B?T1FRd0FQaUpObGRJTXhaV3hkbC9OaytraXNtOUI1cXFFMHo2UThjNkk1ZDRy?=
 =?utf-8?B?Y3NrYU9rQ1ZCci9IZ202RkQzZjRZVTh2MWlHOVlkTzVMbFdISGtwTHlsakVl?=
 =?utf-8?B?V0lyNm94eVQzUVdyczBkd1I4WGt3NDNhaStoL25sS3E5b0RDMHdFYlZWM09a?=
 =?utf-8?B?TWwxUHdrR3pjY2RlSXVzdU05WmtwRSs4d1dRNzUveXFsSmNTUW4wZEJOMFRo?=
 =?utf-8?B?dkVSeWRMUGhkYmx3ZDFKOHBpNEYvSkZBS1FObG5EV3RXa05oNXY5N2FIUHdx?=
 =?utf-8?B?MjZhbkpBaVU2YmZBL08raHNnaEpWQVF1M0NIRGN5MW1uWFNJeFJOZk90Rjcr?=
 =?utf-8?B?eklKNHpRb3J5V1lTYmNFV002SzBXZzRLUkUwOFdRaGdGc0x0bFFtRjJ2UVhC?=
 =?utf-8?B?VEVDZFhkM0VZZG1oK2w4SzdQcjV5dGxwcGY1dHNOb1Z0MFl6bTFsajlGVlE0?=
 =?utf-8?B?WmZUUnp0bGRsZ0wrYlJqVHBPU09oR1ErS0pmVXNLMll1U28yZU1UTHRubmJC?=
 =?utf-8?B?RllVVW9YV0xiY2JKWnEwY0hmY2hmTUxkQ3dXSTNNeGR3ZUYwWXJoZUFBVDRp?=
 =?utf-8?B?ZjVaMEc3ZXpJYWdlRE5DZDluV2dFQUdkb0dyNUZySTFkTEkyUEN0bnowQzE1?=
 =?utf-8?B?Q213d1VkNmVyVmxLL0JUbUhWdlozTndkOGNudSt6dXBTcVc0bFFQaEhrNy9l?=
 =?utf-8?B?TjIzUzVjN01FTysvZFd1Zkt0dEx2K21adUNSTU8vZElMNkNTNXl2emt2b2E5?=
 =?utf-8?B?RVFqV0tiNzJEbC9mdU42QjVjNWVPNWRRdGZnT1QrTlN4TEt2YVAyeXQrVFEv?=
 =?utf-8?B?citGRnozRXg2RzZMdmFXMFVLUkFnR0NOeWg3Z3l0Skxia25DZEdMc21pOVJH?=
 =?utf-8?Q?is1T1Rpe6tPc2m2yJ/ZOL7Mk4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d20cd03-fc1a-46c6-3d14-08dbcff1aaf5
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:48:27.3516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxvUDA1b5uwfpNFKnj24//qfc3oOI9rWQZKaIrnZuNXVNy5p/9w4NSzSPGaJhbeEkvo/Bj4hszHTBXQoF2IeXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9777
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_084842_684059_F8EB11F8 
X-CRM114-Status: UNSURE (   6.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Each patch is indepedents. See commit message for detail.

Change from v1 to v2.
See each patch notes

Frank Li (6):
  master reduce clock
  i3c: master: svc: fix race condition in ibi work thread
  i3c: master: svc: fix wrong data return when IBI happen during start
    frame
  i3c: master: svc: fix ibi may not return mandatory data byte
  i3c: master: svc: fix check wrong status register in irq handler
  i3c: master: svc: fix SDA keep low when polling IBIWON timeout happen

 drivers/i3c/master/svc-i3c-master.c | 49 +++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 3 deletions(-)

-- 
2.34.1


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
