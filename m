Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582FDC001E0
	for <linux-i3c@archiver.kernel.org>; Mon, 23 Oct 2023 16:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JGJ+Zsf4a+ie70sWOO89nyRE9RDe7Mbwuy9OTbis7dI=; b=3Zbk5U1HRm7zch
	Jo9zuJuWKfcPJKbGMq4eV3ywt9WqgL48TgSnVdl45SHu5nXYYHGIgKHMoHJ81i05Hbv7xjnmTRROy
	/iLkowXZmTK8sYdD/L3i4O8I7yCJQZa2gNVhSo3/aAzIR+ypvj3AabsIiCvhuDvqut8qNqajKeXwa
	ks9rosrSbg4HaAQGZTMDc+kLH/8yHDhNkzYcw4YjeJ0iMEPeXEe9XJnktLyhppIMehMkeZkMyDBXc
	5CtfELvuXIu06lw15q4ULtKpMyqa/zcf2TkIW1tencdFDbojkipFW1CGtR7eYOTUt8SkjJ4eeh+Dn
	XzwBryBBkGnvw2vuQoqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quxcN-007o2f-3D;
	Mon, 23 Oct 2023 16:17:28 +0000
Received: from mail-he1eur04on062f.outbound.protection.outlook.com ([2a01:111:f400:fe0d::62f] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quxcK-007nyM-1p
	for linux-i3c@lists.infradead.org;
	Mon, 23 Oct 2023 16:17:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3t/wGFSe5J7o3cvXafWvvWkh7d6iBVwWFgggd8nFWq1PPU6ixv7hNV/AQXLDncgjGWy/usd33LUd6xtyBW3bzkgL9vmPkdCNj6+bBGBFI8hmp8XTYXDIZDeH1BVPUenCFozKzrAd7RSkj+fHTvdZmpFNDpDDXvYLJqqjpiNKs+AozzIc0vXORSvl4j2Ka4L2J7gN4m1b7wQ1gdUwDEskU0NVEneeTfQ16ydgajBccB5hbEjbuHfQr8JmcoWJ0bCTplUpEpaLra1e3yZA7oJVivoVhJUrAV024zLcL+dpq9M0jr14dHK8kXLZpb8MlJrkUoBFxOGJYla/X7HDJuYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJcAQxBYawmHt4F5h8Rz2JZ46sg6P7hOUVI6G6WO4qs=;
 b=CMHkEw+IiBtGz2jc3iBm2G6/UmHF/0YSoY6KizC6+1iZLG9LgT7ga/cBYqPiGl8QB+h/Ak62h/E2HiyIv2AicM2xcwOscNXzxVtcAuWhF/Co4zWoK2ovn8UZo+VCyGGbQwfwEsm6BwZ9iMF485Ot+jKO45roGZOvlo23oOBgSvKwxAOgBpyEdNnPJgEjcg/DW6XYXGcAvRFV/XQq/feCQ6hE3Rxjv6c2TYSzyg4csE18RdnnkoJ+CdMXNL4sbonumAkQoSvI/ZuhKVSE/SpXKIpkyvuPGW82hn/IqpU1dUZYdm5p25cvfP5HNfPtye6fqFJwx4zGjUFRLDSVHVBcKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJcAQxBYawmHt4F5h8Rz2JZ46sg6P7hOUVI6G6WO4qs=;
 b=YfrBIctZZvCqD5SStvTd/2NQf7LjhG9osMMGjVSGMEGVVlr23Acc93JDvsl4IByr33q9hwBP+OjUsGY+rm5NfWpwaPkCuGMWqH1FJ2n+oQ9AstciU74gkND43AqSFyiAXQyR+yCfUNozw2lxCjs9NpuBATta2m61pXo9TL3r+CE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PAXPR04MB8655.eurprd04.prod.outlook.com (2603:10a6:102:21e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.16; Mon, 23 Oct
 2023 16:17:16 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::97ca:a905:8e64:c098]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::97ca:a905:8e64:c098%6]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 16:17:16 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com
Cc: Frank.li@nxp.com,
	alexandre.belloni@bootlin.com,
	conor.culhane@silvaco.com,
	imx@lists.linux.dev,
	joe@perches.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/6] i3c: master: svc: fix wrong data return when IBI happen during start frame
Date: Mon, 23 Oct 2023 12:16:54 -0400
Message-Id: <20231023161658.3890811-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231023161658.3890811-1-Frank.Li@nxp.com>
References: <20231023161658.3890811-1-Frank.Li@nxp.com>
X-ClientProxiedBy: BY5PR20CA0002.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::15) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PAXPR04MB8655:EE_
X-MS-Office365-Filtering-Correlation-Id: d48a6b18-aad1-4ba2-8d2c-08dbd3e38632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DGJt/1i3AbMH/FS7ITSmYt0LuXfN1kl5jLs0pyRLtgbm4I9f3KHNfBEjCmN1amFEVdMQ8NM06UH/ZNflZ/8FW8K/ClowR64lYlfo7TzCVt5c7Cz6WJ5Zr+FopNkV27S1YiXjaWTME0RnhkZTbqT9jr1SHrSLAww5kNE0wY9YJsFZSu5ZIW9PfhpYL+OiPzCidxWH/VXI57fGAqwtAx5oL0yMsj+qlbzCld8mTmsowUK4ywtlMG14iZZhefG90BJIchEWzYPQKttkirDmviKW+WGr6dTs/q1uG1eTMPAF3wKA+OhlKzHq0A+44RLfzQWFy9jMEVl6KftVD6WLsu+BNs6rNAoBWXMw9VRreaml2i38BWITJE5c7LnKaRH4frHVahXbDa/L64MtLUbhTzrimutLggPDYYP/zXqDEltQuzvXotHluTmPzvAMC3j3WfwYhbDG506dWYYrSra4fbkqlyQp88IdG2ESMf4QEjWNr8PDlKvf2JLwcEZFusIZ8BSSFYU2PdjCRmJ+qF8n0U6BKPX/5vZm7IwB7/wIjSDzhpWvIDQXyblIY+AH/Vm6NtegahEkEdu0a7WuhM0AvKRhFsRgVecR8OqwtD/gwiqfwopTvAHL1Iod0KBb52AmUlio
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(366004)(396003)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(478600001)(6506007)(6512007)(6666004)(86362001)(316002)(41300700001)(6916009)(2906002)(6486002)(5660300002)(52116002)(36756003)(8676002)(2616005)(1076003)(26005)(38100700002)(8936002)(4326008)(66946007)(38350700005)(83380400001)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGJJSGZjQUVLUGdLWHlhcU9Zakp4TXRhSlNlbTk3NlRGNk1jNXRSVjN4Vjhj?=
 =?utf-8?B?eDgvS29rNmRzUXYya09Rak54ZXROeGxxb2prMExLbUNHMEFyVnJXWFRucFdk?=
 =?utf-8?B?RktpZUtaQ0dJYnFOT1AxdUlWNGVPTUh1UlhUZGk3aVd3WjZnWkd6Z3JXaDBX?=
 =?utf-8?B?SlVDQVZPR3lLTUphWUowdVY4bXRkZXVkTkNidEVYOXlCczdWRkxycUNQVU90?=
 =?utf-8?B?bGxEdHdjbFZYeHBHYmt3WEQrWXJaeE1BRmROMWE1bjZzRkF0RkJVUXpWUVZD?=
 =?utf-8?B?V2JEKzY1Z0trY0ZkYTAyZkNGRGRpVkVvbWlDd0didC9TWUlSVDJCMHoxUzVE?=
 =?utf-8?B?YzJqV3FYZVVoL1J2R0ZZcGxJaUNrbTBqVDhhYU1oQXRJcDZvdWVQTytRcEt0?=
 =?utf-8?B?ZkQxV25KTk9aVmlqVTNwTFlvUEpXUEw3eDhIL3djaXhoZVloOG5VWVBFZlJU?=
 =?utf-8?B?WUsyem1GWFFBblhYWXNPdXBzY245SlFZeEpGSFN0aUJ4RERYZ3h2VlJtZ2FO?=
 =?utf-8?B?aGJzL0xPeDlnODRDMEcvSkZiUDRSb0JBZFFQSEZRRW1WelUxTmRvdFRvcTJW?=
 =?utf-8?B?cjNhaExtOGdWUjFzUW1JNFk3M0hZdnU4UlN3dUhQRXBJVmpuTi9EcEJKZHpl?=
 =?utf-8?B?Y2lWRkhCeS90YVdDL1NXbloyaXQyZWRWamFqVlprbzVvcEE2c203SFpobXJB?=
 =?utf-8?B?WUsrVFFwTU1KVzlsODN1VysrNmlvWG43dW4zMHZWT3h3RG1aRFBpamFYeEVI?=
 =?utf-8?B?aWZHOHVITThoanJOVHhLditnTS95UTllMTZvOWNBTFhEU3pyMXE4QmJBUmxK?=
 =?utf-8?B?ZUFrZFdGMnltWFM0d25zdkVMakZRaHpDcVBwYThMUlBpVXp3cldsZGg5UDJY?=
 =?utf-8?B?eGVFZmdkU2gyZWE2cGhYdUxmU2I5dElWVGJkb1JaZHgrbVJTdFVRNEdod1lt?=
 =?utf-8?B?SzcybUZkY052K0VITFYzUk5uMy9wRk9BVUdWZkhWejFhVTBRQU5tU0NGQUc0?=
 =?utf-8?B?YnNvK256NTFrSGI2ckNha1B3U2lrM2lvRWJYNFFDV1VvM0FqbWFrNStobTZV?=
 =?utf-8?B?ZzZLVU1EQ3YyUmFSUWdjTWRhd2FnVmxmL3VMYkx3NUJRTS9jUnFSdjY0ZlRM?=
 =?utf-8?B?UDVhUE5KYzNpUXkyN1h6d0dLbTQrRlQweENXTStqU082SkdXM0Nqa2NNK08r?=
 =?utf-8?B?T2hadXJ1dmszZDVSc2VDY3AvMlBGRHE5RmN4V2ZCQjJObVMrakdLb1VpWmg4?=
 =?utf-8?B?T1FyQ3poRXo3TDRoWGhiYTdCakQ3Qytpc0dwL3NXMnI2OS90eUk0THc5R1Nu?=
 =?utf-8?B?emJoK2ZkZERzNlh0Z0E3V2VBakt3UCtWREdYRGlMd1ZucTk4aytKcDN2VkRu?=
 =?utf-8?B?ZERadlEwL1dvemtrRVIrUzJFUElQbkxlMUVlem83SXVXVkdKZ0lOdS9raTNW?=
 =?utf-8?B?a2Rmakd0S2FXMjdnYnpVZ0dVamJBa1VPZndSUEZaUU9DOWFRTENqTnZ1QjJX?=
 =?utf-8?B?NUU3SUVqS0NIWDlReWw3aFJoYk05aGkrdlBsOCtaSDViS21JME9TQXJPVWxK?=
 =?utf-8?B?WHE3RDFISkU3ay9KMTZnYXVHYlg5Tms4U2dVZXpLYTdmaEppN2tNS2ZOODAr?=
 =?utf-8?B?ek5Fa3BmUTJHUXlKR051MldiRmpGdy9QQjdtNVFOZVhxS3RTZXRKL0tBRDRS?=
 =?utf-8?B?WDg5K21Cb3hSbjZackJYcndMY0pqZUJwUStTeWVrYUJ1OGxzQmRmdmY1bEhS?=
 =?utf-8?B?RFozZGNCck1QMFl2SU5ZeFVaSUxlaC9MSC80eW1lendEcnJoZ2M0SXpMMHFR?=
 =?utf-8?B?YzEvcjl6VHZTT05NN3hPSmR3NEdLOE10VVVpWko4UWxkeVprRFBJYWRRSC83?=
 =?utf-8?B?T0ZVTldhcER4RTJVcTJrUHV5TjhZZUdnS3RtMjlncXluYktjalFIdEJ2a2NW?=
 =?utf-8?B?b2RVK1pZS0llQ1RNd3UxZnZQeTVvUVltV1FPZi83OWdzcUE3aWEvZEltOCty?=
 =?utf-8?B?RFZWYUZvMFVBS2xJV0JHK2ovSHNuNFVLdzROSXFyclBlNlJzQXowaEtvRFBu?=
 =?utf-8?B?RG9SaU9Jb01UVmVHSm11aHJFdWFWY2FvWmYrUkRCTUJrK01Mc1VpYXpkOHYr?=
 =?utf-8?Q?+YCdSaeRYv7SLHB7psO9R7Z5P?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d48a6b18-aad1-4ba2-8d2c-08dbd3e38632
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 16:17:16.7065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uM+OSme/CEM72+aqI7lUpTxo+9mEMSHpDKBsP/oAyHAuVF41ruJPbMCMYdWcQHyW2wgs/tLljFntP38UvOHlaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8655
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_091724_610405_8EB57069 
X-CRM114-Status: GOOD (  11.83  )
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

ICAgICDilIzilIDilIDilIDilIDilIDilJAgICAgIOKUj+KUgOKUgOKUkCAg4pSP4pSA4pSA4pSQ
ICDilI/ilIDilIDilJAgIOKUj+KUgOKUgOKUkCAg4pSP4pSA4pSA4pSQICDilI/ilIDilIDilJAg
IOKUj+KUgOKUgOKUkCAg4pSP4pSA4pSA4pSQICDilIzilIDilIDilIDilIDilIAKU0NMOiDilJgg
ICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUmyAg4pSU4pSA4pSA4pSbICDilJTilIDilIDilJsgIOKU
lOKUgOKUgOKUmyAg4pSU4pSA4pSA4pSbICDilJTilIDilIDilJsgIOKUlOKUgOKUgOKUmyAg4pSU
4pSA4pSA4pSbICDilJTilIDilIDilJgKICAgICDilIDilIDilIDilJAgICAgICAgICAgICAgICAg
ICAgICAgIOKUjOKUgOKUgOKUgOKUgOKUgOKUkCAgICAg4pSM4pSA4pSA4pSA4pSA4pSA4pSQICAg
ICDilIzilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilJAKU0RBOiAgICDilJTilIDi
lIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDilIDi
lIDilIDilIDilJggICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUmCAgICAg4pSU4pSA4pSA4pSA4pSA
4pSA4pSYICAgICAgICAgICDilJTilIDilIDilIDilIDilIAKICAgICB4eHjilbEgICAg4pWy4pWx
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIOKVsuKVsSAgICDilbLilbEg
ICAg4pWy4pWxICAgIOKVsgogICA6IHh4eOKVsklCSSDilbHilbIgICAgICAgICAgICAgICBBZGRy
KDB4MGEpICAgICAgICAgICAgICAg4pWx4pWyIFJXIOKVseKVsk5BQ0vilbHilbIgUyAg4pWxCgpJ
ZiBhbiBJbi1CYW5kIEludGVycnVwdCAoSUJJKSBvY2N1cnMgYW5kIElCSSB3b3JrIHRocmVhZCBp
cyBub3QgaW1tZWRpYXRlbHkKc2NoZWR1bGVkLCB3aGVuIHN2Y19pM2NfbWFzdGVyX3ByaXZfeGZl
cnMoKSBpbml0aWF0ZXMgdGhlIEkzQyB0cmFuc2ZlciBhbmQKYXR0ZW1wdHMgdG8gc2VuZCBhZGRy
ZXNzIDB4N2UsIHRoZSB0YXJnZXQgaW50ZXJwcmV0cyBpdCBhcyBhbgpJQkkgaGFuZGxlciBhbmQg
cmV0dXJucyB0aGUgdGFyZ2V0IGFkZHJlc3MgMHgwYS4KCkhvd2V2ZXIsIHN2Y19pM2NfbWFzdGVy
X3ByaXZfeGZlcnMoKSBkb2VzIG5vdCBoYW5kbGUgdGhpcyBjYXNlIGFuZCBwcm9jZWVkcwp3aXRo
IG90aGVyIHRyYW5zZmVycywgcmVzdWx0aW5nIGluIGluY29ycmVjdCBkYXRhIGJlaW5nIHJldHVy
bmVkLgoKQWRkIElCSVdPTiBjaGVjayBpbiBzdmNfaTNjX21hc3Rlcl94ZmVyKCkuIEluIGNhc2Ug
dGhpcyBzaXR1YXRpb24gb2NjdXJzLApyZXR1cm4gYSBmYWlsdXJlIHRvIHRoZSBkcml2ZXIuCgpG
aXhlczogZGQzYzUyODQ2ZDU5ICgiaTNjOiBtYXN0ZXI6IHN2YzogQWRkIFNpbHZhY28gSTNDIG1h
c3RlciBkcml2ZXIiKQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpSZXZpZXdlZC1ieTogTWlx
dWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KU2lnbmVkLW9mZi1ieTogRnJh
bmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Ci0tLQoKTm90ZXM6CiAgICBDaGFuZ2UgZnJvbSB2MyB0
byB2NAogICAgLSBXaGVuIC0+IHdoZW4KICAgIAogICAgQ2hhbmdlIGZyb20gdjEgdG8gdjIKICAg
IC0gdXBkYXRlIGNvbW1pdCBtZXNzYWdlCiAgICAtIGZpeCB0eXBvIHllaWxkIGFuZCBmYWx1cmUK
ICAgIAogICAgQ2hhbmdlIGZyb20gdjEgdG8gdjIKICAgIC0gdXBkYXRlIGNvbW1pdCBtZXNzYWdl
CiAgICAtIGZpeCB0eXBvIHllaWxkIGFuZCBmYWx1cmUKCiBkcml2ZXJzL2kzYy9tYXN0ZXIvc3Zj
LWkzYy1tYXN0ZXIuYyB8IDIwICsrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
MjAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci9zdmMtaTNj
LW1hc3Rlci5jIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKaW5kZXggOGNk
NzA4Yzk2NTA4NS4uYWJlYmVmNjY2YjJiYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9pM2MvbWFzdGVy
L3N2Yy1pM2MtbWFzdGVyLmMKKysrIGIvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVy
LmMKQEAgLTEwMTAsNiArMTAxMCw5IEBAIHN0YXRpYyBpbnQgc3ZjX2kzY19tYXN0ZXJfeGZlcihz
dHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1hc3RlciwKIAl1MzIgcmVnOwogCWludCByZXQ7CiAKKwkv
KiBjbGVhbiBTVkNfSTNDX01JTlRfSUJJV09OIHcxYyBiaXRzICovCisJd3JpdGVsKFNWQ19JM0Nf
TUlOVF9JQklXT04sIG1hc3Rlci0+cmVncyArIFNWQ19JM0NfTVNUQVRVUyk7CisKIAl3cml0ZWwo
U1ZDX0kzQ19NQ1RSTF9SRVFVRVNUX1NUQVJUX0FERFIgfAogCSAgICAgICB4ZmVyX3R5cGUgfAog
CSAgICAgICBTVkNfSTNDX01DVFJMX0lCSVJFU1BfTkFDSyB8CkBAIC0xMDI4LDYgKzEwMzEsMjMg
QEAgc3RhdGljIGludCBzdmNfaTNjX21hc3Rlcl94ZmVyKHN0cnVjdCBzdmNfaTNjX21hc3RlciAq
bWFzdGVyLAogCQlnb3RvIGVtaXRfc3RvcDsKIAl9CiAKKwkvKgorCSAqIEFjY29yZGluZyB0byBJ
M0Mgc3BlYyB2ZXIgMS4xLjEsIDUuMS4yLjIuMyBDb25zZXF1ZW5jZSBvZiBDb250cm9sbGVyIFN0
YXJ0aW5nIGEgRnJhbWUKKwkgKiB3aXRoIEkzQyBUYXJnZXQgQWRkcmVzcy4KKwkgKgorCSAqIFRo
ZSBJM0MgQ29udHJvbGxlciBub3JtYWxseSBzaG91bGQgc3RhcnQgYSBGcmFtZSwgdGhlIEFkZHJl
c3MgbWF5IGJlIGFyYml0cmF0ZWQsIGFuZCBzbworCSAqIHRoZSBDb250cm9sbGVyIHNoYWxsIG1v
bml0b3IgdG8gc2VlIHdoZXRoZXIgYW4gSW4tQmFuZCBJbnRlcnJ1cHQgcmVxdWVzdCwgYSBDb250
cm9sbGVyCisJICogUm9sZSBSZXF1ZXN0IChpLmUuLCBTZWNvbmRhcnkgQ29udHJvbGxlciByZXF1
ZXN0cyB0byBiZWNvbWUgdGhlIEFjdGl2ZSBDb250cm9sbGVyKSwgb3IKKwkgKiBhIEhvdC1Kb2lu
IFJlcXVlc3QgaGFzIGJlZW4gbWFkZS4KKwkgKgorCSAqIElmIG1pc3NlZCBJQklXT04gY2hlY2ss
IHRoZSB3cm9uZyBkYXRhIHdpbGwgYmUgcmV0dXJuLiBXaGVuIElCSVdPTiBoYXBwZW4sIHJldHVy
biBmYWlsdXJlCisJICogYW5kIHlpZWxkIHRoZSBhYm92ZSBldmVudHMgaGFuZGxlci4KKwkgKi8K
KwlpZiAoU1ZDX0kzQ19NU1RBVFVTX0lCSVdPTihyZWcpKSB7CisJCXJldCA9IC1FTlhJTzsKKwkJ
Z290byBlbWl0X3N0b3A7CisJfQorCiAJaWYgKHJudykKIAkJcmV0ID0gc3ZjX2kzY19tYXN0ZXJf
cmVhZChtYXN0ZXIsIGluLCB4ZmVyX2xlbik7CiAJZWxzZQotLSAKMi4zNC4xCgoKLS0gCmxpbnV4
LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
