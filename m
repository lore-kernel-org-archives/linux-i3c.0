Return-Path: <SRS0=Pvy7=ZR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4BAC432C0
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 11:50:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7697B207FD
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 11:50:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JKJ29qjv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="KlpzNO9X";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="Hm5VY2p1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7697B207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TUHu83UIE2Ajr6dY/jlyJsF6IjPLC9kPk9m2W46hgzg=; b=JKJ29qjvNLqoot
	vdfKeM0vOIw49rFmGr7DmsJ//qKBhz3lIY3kzaxlWCgOVM8tbZhpi+wAaoXEc97+3MjzCQgFmypPE
	LnIr8MrXFsl9hQj7yayJaXhDaPZqyhUJfwpnNbuqBF/FvHUrivY1TbTgJI7uAqZQSeRhzuUxSoU7B
	pldMWpNf/pPnZqtHTXIZBgMp9k0fplrP11jJp5I1DezapltkhnZ7brF5Uiajfw+2cQq9i24jDJ2Fc
	ixLyH0pvP6jhr8VJlcClnhkmtHftvA5Q8nd8O2b19Y+K3nFYEoEC/hFLlri1W/9WesrTXxrfwtJas
	06qXuL8vy2xIoiJV1UTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZCtC-0004Mn-4G; Mon, 25 Nov 2019 11:50:46 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZCt8-0004ME-PS
 for linux-i3c@lists.infradead.org; Mon, 25 Nov 2019 11:50:44 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAPBlEtT011837; Mon, 25 Nov 2019 03:50:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=A6TAs3X+ZrP3hpXy+SsS6zLB/ak/e7U0gc016Cf6k30=;
 b=KlpzNO9XzdNlp6tBgTkhYC32ZsJ9ozXjPDNpeime1vnbeeq/N+kfxpOnMw6JMaDoSy78
 Ob/mask6kdU4Z/XYaLDKfJDgaS7AHFRlkf4+8P8uKYSdgDY9ZZMj4PJz+K1S7ZPR//vs
 WwyOX2EESAVD1JLYSlLahveswI2f9qZh3nAuZF/Q15XlLVmVWzsfxbFaW0N0Xp0W/GFw
 Hlr/GA6XHfQrBLanWAf3Xb4HmUrXdBHM8zu3dsBvlej/5PD8HS49cmPiD6wTKeiTmg60
 QMmzQRIfBC5Dye5VS7QFc0NjZ/AkeqL14ox5WU96y9MgzTiXnpn0ZsiX6lZgo0yaM7mC Jw== 
Received: from nam01-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam01lp2055.outbound.protection.outlook.com [104.47.33.55])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2wf26xxjxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Nov 2019 03:50:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fF2WNQVoMiBg/ilP+wp0xYxGIrnCtQ9N8AiNkn56VGYyrO+jMzywYvkJqGbbnPDXLmXz7BE3rrnxTPHP4FHfRDTPW7t2UEZjcBWyB8BEmz753NHNu+siKvGNoLKgrqPG3eSO7Gex4YTEBSbvuAjGDozQ3ybmJ85uGwZIAwnLZ3DoWekqTnqj6c23b8tislv2i8VRMmNcIt4Y6bG+emZsEe8qI7j6DgPvo21wVaZZQWAPh3USN1KBS1T5ZCy1+I9Y3l31yKqBjHfIxZa86svG1Z3S8PSG+1WVxj4Uu3jtuUal1WvwQl2ZwlzCxisCh4OibFdRqFAwC5e1sh4n3ViAzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6TAs3X+ZrP3hpXy+SsS6zLB/ak/e7U0gc016Cf6k30=;
 b=FoEuUdL7dRbX4rodY1rWV8biyGW08YCdIgCbtLgA/MUBGWcHuiERG8x2N6MvIrzj9JTztViC6JmIZqIjQ0N+TM4cZHbzNl1flzKwdDi2BvsSUdS6eXMAUbzKFIdA7p7vT70b9zFC1sfWkV1tZTCpwYAUyxfD2tB27aJiU+AWW+g7TFqYv+o8sl0P4x4//Dv1/cpKuiAkt+rUTKIp0tNjr1NEXKYzLJONes8dXwEcSpVbBdPQ91+U9zQGC3Hubm8mJYWEKLeU1hu33e6ciIgUYwa4YwG62sJKr7d9yfh0qFBDtvI/4d57NHTa+wlpwC4qP9q+ga3PalbGktuMlfjLYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.243) smtp.rcpttodomain=synopsys.com smtp.mailfrom=cadence.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6TAs3X+ZrP3hpXy+SsS6zLB/ak/e7U0gc016Cf6k30=;
 b=Hm5VY2p1B6nSozdSx4v8X6XeUGUH9fJ0fSd/K6EWcgpKU+5c36dnH1haR2BJXv1S/qf7jA5tz/C9DhHLOuBglh0CqcxVIZOpg94D9SNHHscgphtI/DLCEdI6gqDmKhbyT0dx0Fl6r1184K64ZbHIf9DtEsQTu78saByTkJDXoLk=
Received: from DM5PR07CA0036.namprd07.prod.outlook.com (2603:10b6:3:16::22) by
 DM6PR07MB4300.namprd07.prod.outlook.com (2603:10b6:5:c3::26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.18; Mon, 25 Nov 2019 11:50:34 +0000
Received: from BN8NAM12FT039.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5b::208) by DM5PR07CA0036.outlook.office365.com
 (2603:10b6:3:16::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16 via Frontend
 Transport; Mon, 25 Nov 2019 11:50:34 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.243 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.243; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.243) by
 BN8NAM12FT039.mail.protection.outlook.com (10.13.182.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.18 via Frontend Transport; Mon, 25 Nov 2019 11:50:33 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id xAPBoUIN177507
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Mon, 25 Nov 2019 03:50:30 -0800
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 25 Nov 2019 03:50:29 -0800
Date: Mon, 25 Nov 2019 12:50:26 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: I3C Mastership RFC
Message-ID: <20191125115025.GC30630@global.cadence.com>
References: <20191110113005.57dcff8e@collabora.com>
 <CH2PR12MB4216A050B76E53194759822AAE740@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191112084127.6efc6fac@collabora.com>
 <20191114061011.GA25288@global.cadence.com>
 <CH2PR12MB42168DCBB3495AD92E8231D1AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191114133214.0b6ecc0a@collabora.com>
 <CH2PR12MB4216E136A2EBB0A2777C6212AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125080220.GA30630@global.cadence.com>
 <CH2PR12MB4216552AAF9BFDCE498837D7AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125123452.7c2549dd@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191125123452.7c2549dd@collabora.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:64.207.220.243; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(376002)(136003)(43544003)(189003)(199004)(36092001)(66066001)(86362001)(47776003)(55016002)(6116002)(3846002)(4326008)(6916009)(7736002)(106002)(6286002)(5660300002)(70206006)(316002)(561944003)(478600001)(2906002)(33656002)(6246003)(70586007)(14444005)(26005)(186003)(16526019)(426003)(336012)(229853002)(81156014)(8676002)(305945005)(8936002)(16586007)(6666004)(356004)(81166006)(1076003)(23676004)(50466002)(2486003)(53416004)(58126008)(76176011)(7696005)(54906003)(386003)(446003)(956004)(36906005)(11346002)(7116003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR07MB4300; H:wcmailrelayl01.cadence.com;
 FPR:; SPF:Pass; LANG:en; PTR:unused.mynethost.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c1597b0-0248-4c98-4459-08d7719dadfa
X-MS-TrafficTypeDiagnostic: DM6PR07MB4300:
X-Microsoft-Antispam-PRVS: <DM6PR07MB4300752A25B34B37C2F495EDC24A0@DM6PR07MB4300.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0232B30BBC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUpoblN6akQ4SFFEWHBXZDVvVTdxaGFIK2xSM05zWTNDWGo3NUpVRnoyN0VK?=
 =?utf-8?B?NmJMdHFIOUQ2VmpJOXd0M2d0dGpobUxTOEJhRE5iZVc0RGQyallCUmNDTkRT?=
 =?utf-8?B?bUhGL0FqZHVFSlgyaHFNK2hXUnZjam5BQVk1WGhHT0xLTzNBdUM4K2JhbnJo?=
 =?utf-8?B?cjE3TVNmMC9BcS83elI1Q3N6T2U4dFJsWWJkRGpFZW02VHVUUm1FYzE0eUZm?=
 =?utf-8?B?MlZ1MC9CMWxxamNDSlBGajBrUDFjNUppRUZWUmU0YUVmK28vQTBZTnFsWmhw?=
 =?utf-8?B?T1d3L3VqM0pEVzhidHNSUHZtUWpWVElyNmR5STN0NDdORUt4dG9qeVl0bFNw?=
 =?utf-8?B?b3ZlSFJ1M2Ryak5WK0lReXo4UXNQN0s5cjIwNkhKbi9ybVh2MmtNTEE5TFdV?=
 =?utf-8?B?TjdtU1UzRks1NVBvYXllcWVyZC9OS0JpTU5xTHFEZk9uL0d4T0pxUTBpdEla?=
 =?utf-8?B?OUQ3VmdJc1VzTStnMjgvWWx2ZzVnOVN0TmhzL0xvVmJPdnZEOGxNaGorUDR4?=
 =?utf-8?B?ZFZtajRMRFlucitOUnlXMzczVTdpWGlBTi95UTkwSXNtUFQ1Rk5CQkRBbkRn?=
 =?utf-8?B?bVUzSksxOUxseGU3NVhHUVVOeU1BTU92eXpybFZacEYwSEdOOURBVkViY3lF?=
 =?utf-8?B?VG1tc0hBWFlldXAvd3NkSUFXdml6NXhIVlA3b2hkU2VkazUwLzVPeFlwTmVh?=
 =?utf-8?B?YmkrbjN3alJ0Q1QrNFM5dDVkSXppRDFBbkIxMHJxdFdNY0NBVWVMeS9PNEJM?=
 =?utf-8?B?dlZwOEthenV6MkpBY2VzSzB3ZENiTkNlam4zbjRpM0s2QkZYY0FxOHZGaFZM?=
 =?utf-8?B?eGErVUsxM2s2TzNvckZmWWFOOFJXcWpFS0cvaXZINnJMUzRoblBzdEpnYXpY?=
 =?utf-8?B?Qk1vTk92Qkdqd2MzeDArMUVWSWZidzVWVThSN1hjVlUwMlpRdVd1RDhJaCs2?=
 =?utf-8?B?Z2lhMHpyc2JhL0dTZU9NdGd3UDJLZW82Vkl2Q2dqeklkMkpZT2k3MERINy9H?=
 =?utf-8?B?NDdMVlFNSDZJMXMzdk1uTnZzdlh5T0tUeFhrWXZHeC9LR2tva0RYRTBNdER0?=
 =?utf-8?B?YlJWWHh1S3E3ZnNhMndWTURGa1d4VEw2WlExRUZkRno5Z2pxcTYzTkNZbS9s?=
 =?utf-8?B?Z2lJV3pTZnplUFBhME5DTStCT1pzUktQWnpoNTQvQXl5VFdaOHlZVVNVNldq?=
 =?utf-8?B?TFlRSVZNMW5IbjBielpJUi9EbFRhaU1KQldCZXBYRkRjM3JHeERJQ2ZSa0p2?=
 =?utf-8?B?aGk2ZEpESTNqdnF3WHdNRUZ3dmVBREFjS3FRVUNySHRVWENkQUV2Ump5ZWtZ?=
 =?utf-8?B?OHplTDZWMmVnN1djZHlmdlV4MHhYSGtkTzEzK0tNdzBDbFdPT2VkY21mdDBO?=
 =?utf-8?B?L3JETTBycTZWUFp1TlFDYTdCUjRPUnhVL2hqd2czdlNqQ2hSRGFGc3dmbFp2?=
 =?utf-8?B?dCtqeHBtaUFzSmR0R0FGQlJiZ0s4cGFZaUVpUnRlalZNdDVOWWx0dVMvL3JM?=
 =?utf-8?B?YlFKS3JJYWdpZ2thbmtPd2dvUlNtS1VEMFQ0YmcrMmRwYTgxdGlVMWxEV2FY?=
 =?utf-8?B?V0c4YVN4Y0tsU0t0c2tpL1VkRFdLM3R5dUJWWTJsL3BtQXFkM0oydjJuS2tw?=
 =?utf-8?B?M0tZTm93azVJeGZ3KzQxcmo3MWFLYzVYazhzbXFGcnpMTDlPUkdDbGxJVjFE?=
 =?utf-8?B?R3VWcDhSYlZETlhDWXF6MTZHZ0g4bldYWnRxOWoyR1FWZUIrOUJBWDdyaDk4?=
 =?utf-8?B?VVNkTER1NDZkNG9LL2NSWXRTSi82dFNJZWNBbGlQV0F3dklEeC9kRXVwUEdB?=
 =?utf-8?B?ZkpIcm0veHMyOXU3OFJCK2E3N2tVaTVCRzhHbkJkWThhcm5neTlZam5GL0xz?=
 =?utf-8?B?UDBBMmxtZzgveGp3TDI2VklrYmNEU0FEamJOSllKR1IrOXBSTHpWRmhkaGsz?=
 =?utf-8?B?RGtmZ3J5TFk4Q2ZuVjdIR2NBL1ZPclczeWxVYU9DWmcwWVBiSFpIcUhSaTlq?=
 =?utf-8?B?L2o2TUVZKzY0bHJoNDFjVkNtaTBjbnBYbWZhMWNCaFd5NnVCSVcyVG9HUHhF?=
 =?utf-8?B?RGpUeWl3K1prb0N6MTFRSUdrUGFlUXUyckpqYURmT3FXck1CYWg5R3JHaVpQ?=
 =?utf-8?B?QUFMVDVXeXh1Y1NMRU0yM1ZuYy9vanNIRVZXQXpTL1krb29FaWluUlRoUDEw?=
 =?utf-8?B?Zjl6Q25BYUtpRUdWMm1YcHMycld2NFhpWHJvZE1wTE1Ba0NDVTVJVHFUY2tE?=
 =?utf-8?B?OHp5MG1BbTY5aTlIRm9JOVJNYm04eDcyZnJLOVdpMnkxR2g3a0k1WlhpempS?=
 =?utf-8?B?OFFJcEdmUFpIYXVlM0RDd1o2YnErZFpzQW5kUmx4dVE3SGFqa3k4VVliTHZF?=
 =?utf-8?B?c0FwRXJ0QUpHVzg0UkNocldkVTlPMjBVK1pGMTk0WUozYkFlYmlROFJ1L0J0?=
 =?utf-8?B?Nis4MVk0dmE1ay9VdVE9PQ==?=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2019 11:50:33.6824 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1597b0-0248-4c98-4459-08d7719dadfa
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.243];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB4300
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-25_03:2019-11-21,2019-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911250110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_035043_191437_0152DB4C 
X-CRM114-Status: GOOD (  33.99  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 Vitor Soares <Vitor.Soares@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The 11/25/2019 12:34, Boris Brezillon wrote:
> 
> On Mon, 25 Nov 2019 11:19:44 +0000
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> 
> > > > > > 
> > > > > > I based in all version and tried to pass everything to master.c file.  
> > > > > 
> > > > > I'm not sure what that means, but okay.
> > > > >   
> > > > > > Right now my challenge it to trigger mastership request when a device 
> > > > > > driver want to access to the bus but I believe we can discuss that after.  
> > > > > 
> > > > > That's kind of a basic feature when talking about mastership handover,
> > > > > but sure, we can discuss it after your RFC has been posted.  
> > > > 
> > > > I need to test if the time that device.c request the mastership and the 
> > > > controller has effectively the ownership of the bus is short enough to 
> > > > call i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers) before of all 
> > > > housekeeping of bus takeover.
> > > >   
> > > > > 
> > > > > Note that I'm not super happy to have to go back to square 1 and throw
> > > > > away all of the work done by Przemek, especially since Przemek was the
> > > > > first one to post a patchset and he never really said he didn't
> > > > > want or didn't have time to continue working on this task (not even
> > > > > mentioning the time I spent reviewing those patches...).
> > > > > 
> > > > > If Przemek is fine with this situation I'm okay making an exception,
> > > > > but be aware that it's not how we usually do: the person that posts a
> > > > > patchset first leads the thing (of course, it's even better if there's
> > > > > some kind of coordination before the patch is posted).  
> > > > 
> > > > Honestly it looks like I'm competing on this which is not the case.
> > > > I just pointed out my concerns about this adoption because I see several 
> > > > issues on it. The point is, at the end you can pick some parts of my sec 
> > > > master code and integrate in your solution.
> > > >   
> > > 
> > > Can you point me to the version of the patch your changes are based on?
> > > And also, can you tell me what issues you faced? I would like to check
> > > if they are already adressed in my code.  
> > 
> > I used v3 and v4. From v5, I found useful the switch case (request, 
> > deliver, handoff, takeover) in hc side.
> > 
> > I didn't hardly test how device.c request mastership but I suspect it 
> > won't work properly. When you do i3c_dev_do_priv_xfers_locked() you might 
> > not be the master yet.
> 
> I'm pretty sure we solved that already (that's what
> i3c_master_acquire_bus_ownership() calls are supposed to take care of).
> Can you be a bit more specific? What makes you think the master might
> not be in control of the bus when i3c_dev_do_priv_xfers_locked() is
> called?
> 

That's it. We solved that already and I remember Vitor mentioned about
that during patchset review.

What about your ->request_mastership() implementation? Does it ensure
you are the owner of the bus when you return from that function?

> > 
> > >   
> > > > As I said previous for I3C spec 1.1 secondary master received a big 
> > > > improvement due the misunderstanding published in 1.0 spec. I don't know 
> > > > any other protocol that implement such kind of feature and for this is 
> > > > from far the most complex feature to implement in SO based systems from 
> > > > i3c spec.
> > > >   
> > > > > 
> > > > > BTW, you mentioned working on a lot of different topics, but most of
> > > > > them were left unfinished (userspace i3cdev interface, I3C slave
> > > > > framework/API, ...).  
> > > > 
> > > > The i3cdev does what we discuss during the proposal of i3c subsystem and 
> > > > only expose i3c device without device driver yet I'm not happy with 
> > > > transfer struct.
> > > > For the tools I have for hdr and sdr transfers, for now I didn't feel the 
> > > > need of a tool for ccc (but for testing purposes it would help a lot).
> > > >   
> > > > > Any plans to post RFCs on those aspects anytime
> > > > > soon? I mean, there's plenty of topics to work on, and I'd really prefer
> > > > > that each developer work on a different topic instead of duplicating the
> > > > > effort...
> > > > > 
> > > > > Regards,
> > > > > 
> > > > > Boris  
> > > > 
> > > > Best regards,
> > > > Vitor Soares
> > > > 
> > > >   
> > > 
> > > -- 
> > > -- 
> > > Regards,
> > > Przemyslaw Gaj  
> > 
> > Again sorry for the delay. I will try to send this soon.
> 
> Can you please share what you have now (even if it's not finished) so
> Przemek can start looking at it?

Yeah, would be great.

-- 
-- 
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
