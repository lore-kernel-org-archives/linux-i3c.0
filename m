Return-Path: <SRS0=FhwC=PT=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAD_ENC_HEADER,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2740DC43612
	for <linux-i3c@archiver.kernel.org>; Fri, 11 Jan 2019 17:44:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC3332133F
	for <linux-i3c@archiver.kernel.org>; Fri, 11 Jan 2019 17:44:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ih6dvmhV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="HTsCLdig";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="CHzMZees"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC3332133F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OxjO0EoN0Jw3ZxW3vD9ZyoqrUFUup+c4o+piB1WDuZE=; b=Ih6dvmhVAqJToS
	Akexlzl43BVg46Cpr1JdFF7B5ggMj8YyitGiefnn2fu+mUeh2Bnsx97WchxI1LpmtCc10ErZZUGww
	aRbp3EtFLr4FZISW6BFR1BAgtthOhDFzCjmKs23Mloo9h0qWvvcqHjF3IB0VlWx98vrUWCkSvaMWp
	x5bgqqGN2Y8nEz6IgSdBagOowi5wJzBXtiIyjI5U7UpD8DSoNEnE72gLJwF467tZYLjbh/h1x0MH2
	RHrV/TtEbXCeMa765vm6hUNjPlw0VQm+HzoHn0FiLbSUDeSl3s+kAV5Gz8i/XBIYPlgLH1ngow9v0
	mvLHPX/T3QvsoDXO82rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gi0r6-0004xu-IL; Fri, 11 Jan 2019 17:44:28 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gi0r3-0004xC-Mt
 for linux-i3c@lists.infradead.org; Fri, 11 Jan 2019 17:44:27 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0BHhlYR017903; Fri, 11 Jan 2019 09:44:24 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=PrJ5+V7uglqsnQ40EaQN2hI0nEOtD2zkSA5ifizrjDE=;
 b=HTsCLdigk0EmDqf1KOtTeQOGhMzo2yDRDlyWNnzkztZKgy98FnwRGPZs/yfp/o1Locej
 LfJWDHoEJ7vkYmqviWJ5V/Vl2sz6A/4DZOfUwze9jfrEDKW2TsT6kX7VqXCEf3NDO/Ys
 YR7okMPmW0daCqufZ38Mr8wtMdMRX6ssPbDAsN0CSgBsTL5j9l9NyLYN5nuggtyEYp1n
 EE34BS5V7l6+bzT/O8JDD3LXQcHHehVDHABuxUptsGL4wIGktpwQJ1qkkENQIt3Pd11E
 1y9jJ9YOEs9/wcP/53cmlR3jYSbghT2si7k67x5WdpQsJaXKyI6QaOJu0+fxMvEbL2eI Aw== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam01-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam01lp2052.outbound.protection.outlook.com [104.47.32.52])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2pts22e9nf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 11 Jan 2019 09:44:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrJ5+V7uglqsnQ40EaQN2hI0nEOtD2zkSA5ifizrjDE=;
 b=CHzMZeesGT94SyZATtV9kFl1evmHOqUfpixvTUvl6CDts70DOXd8Y//ijrJV7sUAqK3+x6dHRJ1P++nVCX4GvzXKVZIl/Ww3jxITiolfcs6F09Jljw3cdPq+X4q3owE8w6CJRSTrmI2YQJxXGHKZkCzFJI4QGA6PTTss7LHSTnU=
Received: from DM5PR07CA0092.namprd07.prod.outlook.com (2603:10b6:4:ae::21) by
 CY1PR07MB2166.namprd07.prod.outlook.com (2a01:111:e400:59d7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1516.18; Fri, 11 Jan
 2019 17:44:20 +0000
Received: from CO1NAM05FT003.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e50::204) by DM5PR07CA0092.outlook.office365.com
 (2603:10b6:4:ae::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1516.13 via Frontend
 Transport; Fri, 11 Jan 2019 17:44:20 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 CO1NAM05FT003.mail.protection.outlook.com (10.152.96.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.10 via Frontend Transport; Fri, 11 Jan 2019 17:44:20 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x0BHiHqi015835
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Fri, 11 Jan 2019 09:44:19 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Fri, 11 Jan 2019 18:44:17 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Fri, 11 Jan 2019 18:44:16 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x0BHiGTI002044;
 Fri, 11 Jan 2019 17:44:16 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x0BHiGJt002038;
 Fri, 11 Jan 2019 17:44:16 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v2 3/3] i3c: master: Add module author
Date: Fri, 11 Jan 2019 17:43:37 +0000
Message-ID: <2ea613df7d5d806737503fb842cdee329f2183f5.1547227861.git.pgaj@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <cover.1547227861.git.pgaj@cadence.com>
References: <cover.1547227861.git.pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(396003)(376002)(346002)(2980300002)(36092001)(199004)(189003)(478600001)(87636003)(26826003)(2351001)(106466001)(48376002)(50466002)(86362001)(47776003)(105596002)(118296001)(36756003)(186003)(54906003)(336012)(107886003)(4326008)(16586007)(42186006)(316002)(51416003)(76176011)(7636002)(305945005)(26005)(6666004)(246002)(356004)(426003)(446003)(11346002)(486006)(126002)(476003)(8676002)(2616005)(8936002)(50226002)(4744005)(5660300001)(2906002)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR07MB2166; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; CO1NAM05FT003;
 1:JCMejil0F3ikQrWmKz/VE8VZH8S/xrn+2bLtbJSklNKxQjGaHBC5y7y5XsJWN4/pPbCWRxdKzcG7rNsbyyWDKp8mZfO95vQt4kTiMZc2wLtuPdZtVcyV3QpKvR1sP/+Kkyti230zgs7ix/Du0RdK3A==
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5904dd43-0c20-45ab-6afc-08d677ec6aa2
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060);
 SRVR:CY1PR07MB2166; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR07MB2166;
 3:SSM1AVB9XE34Y2FnGpBU9DXVeSfm9alOPCSSNzRaAoUnjlrOHFXhWb77jmNnLHp7vC/wojMcmk+YnyIAmr0VVmhH2E89Z+HUxBrYMp9PTmfwXf5A5kiq1wgjSd3k1Oovh+RhIaG4p/zshEX4UO0qa41BJuxGxqIbWTPN21yTSOW8Z6wiu7Ms5wBKl2ECyhJGkPkCa6i8XGOU7GpA2uDaEXBZy7DDi9pAobOTbWCaYFy3S2lDi4Iyxb25RreHQeg9DPCBtXMsrr8VWlKdcpoUFONaCzPu3rdunyCQo4aRnN7fC1Cl7TMeakuTmlccS4EIWTnIB+1slL7gJLgXP/9EMlWkH52s8a5HutmrV8WLLlUzekifgYqe2G5XuBLRogFl;
 25:E97lOwW2NlYwteqXmIYrHfg99s5P8KE69TAGZGhs32+RUwlkg41izfRs80YIENnA3Isflg8CYGhOfzR+Dwx1bU0P7jCuiRly4MNtc4bTkJbmE4j7oMvC/KxvpCeN+eO39s3jYAE9q5snV+40NRcRfFR6IDqw8K+g0eLHWHfBQ6DkGIWIS8yKb9odOJUce9iJEP7bVU2m9SWiXWGM7hH4C0myKZroRwQbkaTEXqDX0NkoBLFqaOFQXeYlD9AfxmbqMRAiry/7cC3FoIWS2Z658EET121MLnGprqCw2f9PnSXJK3r1BQ82x0I6aPhIJVSTCB7nxVlStUCNO+tgtwwePg==
X-MS-TrafficTypeDiagnostic: CY1PR07MB2166:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR07MB2166;
 31:zlq0ok6Re9Au3UM5bxd0jHfDR6TzymbeIRN8xacDZbiubu7XHa0SQf1S6KCMjIEJEKvwmG9MZECPLsG8/9xggmNyuuQUpWOSbf9M2BG2jTl+4WiyE/WIH8YCwskY1TAijrp/WqzJFsMP7qPgrSjc49SQx74tgnjgJ28MGAGET3Qzm+XhPtqW0wGgJDumVD5hxllkbByR9zgk+HeDBVlTZcpThITTIWAc/t6yJYqTkno=;
 20:DypPgLDpjuQgMaHNCgQzBuzV8ztFR+l8gjZ15y/RFc7+2LVgolO1VV8XHxxUmHJZ5w808W3X7YnzYkhOmSee3AFNhDbVG01FHuMIrA5tCSlleCOrUEejhkxJTmKK33J6/ZkSKPPaD/uiuoxS/u1mWH1IIn4mIh3PiKqxI9Hu4eZRP1lRnxWZw5J3DkRiiJnQHoG/mTfaug9+mopFpCYy+SN7wOLlvEQTqK+dOqThhBe3fGQL/ja/4FAzz/kRE6r3h4pVQk2T8lDJDRjfNX/+Tx4yTKA3T4SL28X2Kz0YwNgIAKJMyRyM0aqqieoGXgzeQfyuWMf9lwugeqN89qA040QiwshquZ/gYRbfP6FipNHNNgvZWuxDoQVn/8tMCKMzOuunfK3PYWm+/vHTeQNJy6YAgWQItrbuGKepHjEzBoISELeUJ2/fDn+CVHrw8hLssMBQzIdJkHvBtAKNhgtPmO1919gwTVrEXosw5nCLCeUSzK6OOI9zobt0Eu9sJUhP
X-Microsoft-Antispam-PRVS: <CY1PR07MB2166F24E0A3D017DC26C1898C2850@CY1PR07MB2166.namprd07.prod.outlook.com>
X-Microsoft-Exchange-Diagnostics: 1; CY1PR07MB2166;
 4:/VrKavLQ+GiX8ESKuMyQ3ptYZgLDVuX4nNEL/DcWiCnYwWnTr6qW1IwwzZHvUjI60iriCQzrfBBZav8P77UoFdZTsoe13xGguVOAOu3v/ugLpmix7IPIGyWdvXkbyqSlhvMnm6rykeH/eIRQ3ArzYR02PtUWSBDvE2ieL8HwdvmboY3WgCkbGQHqVFEEwyxbfTOF5roQ7WpkkXpSQWxkbT0HTrRU7rA5vnWYw7O7BX6p/xsak7HUsV+V9ychmfR59rrWsloG98PsmRm7Qu1/jWS78fZKMF7nOzdUo1Z2SioLQ7uHNt3VgFQJL8keO/+k
X-Forefront-PRVS: 09144DB0F7
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR07MB2166;
 23:98dlm2wbv085eXr8MoOrA7BZyst28PpmUkaaHTiQw?=
 =?us-ascii?Q?KcIc/esYiugANvvqkPZgG4MxrUHKgIbj1kgc11RAI1kphbSumBdcLjM246yT?=
 =?us-ascii?Q?6VNGFSdEmLFwiuh34wKnsTdPJDukbCJ8bUtgutwX14IUdstK8M5ULdJ9s5n6?=
 =?us-ascii?Q?qy3F/UJzAE991JmcX9+0V9D6KnkOxD7ZckevuS9QabibDVgWHIHUs537EaME?=
 =?us-ascii?Q?rv8DIbDWQ0vKGMw508UoXAzg+j1YGQTu/ckD24VTkDbzzgvX9tBigNrkc7Cb?=
 =?us-ascii?Q?+nGbcvsHh6dX9qh+rrY6j1UrQChnzlDWk32+IleSzkJch+QLMtUQ4p/OtnDr?=
 =?us-ascii?Q?fbASq+VkWWfod2Wyvkxg1u4tTGbMFYqJyP9B8RSvrjlSzgQf+E3ZyM6iDjW+?=
 =?us-ascii?Q?VGxb9RNf14zfcRkZqN7LkmkkfUyZDR3RCMXT9FjfDFUnj7rKT/yEc37bI9Ha?=
 =?us-ascii?Q?PEqepJzeLZHYYLPrTC6bTsc3I1rMsEdOFJOuK/MKVM+FLr51WUtjU20/CA4L?=
 =?us-ascii?Q?LMo9Bpb8HVjvLDjWXVoIa5XjJ0bvICwTUyyL57fdBGHkbWA/z/A8GjGScB8a?=
 =?us-ascii?Q?06yQynO5/GG2HNJZOP6pfHgIz/eMUcSXU9/INt+VfhbH0VbKkcP3W9WnTsYg?=
 =?us-ascii?Q?SSymH/VscrPXSrlIU+jlrz8n1Xomdw6WQvT3G/EfUF+IKtzQEuTBCX6H7WRA?=
 =?us-ascii?Q?/qnSXaANJXkdSSbhIf+R3xT9yIVNmkvWPUtWWbJj0B/Yvo4uPv0ZwxhvtwHg?=
 =?us-ascii?Q?SiNNFWq/OFPtm5jQezWxLJdDGcZ1g6xRyzxQ0vVjnT8Q6aey/1NcRGfNWYF6?=
 =?us-ascii?Q?lKt02tdFo76TlP0BuLA7U1jG6L+1Q5sKAnVjNVPxU4hzmd2W9p6uv1d+rG7C?=
 =?us-ascii?Q?71OwVnN5uKYQ73U9n0BFt/ZpH7mMDXeYHmqrFTgYsGbBHw8dxduHTJZS4fiv?=
 =?us-ascii?Q?LHD3eDXpXtO7BxLWM4Ixt0LgXJkTxz+9EjW69gc1vv0ga3+2YzVxquhH/YvJ?=
 =?us-ascii?Q?VxRvtbUuo/UuNWKCIXSoUrpBKVvMatTqUw70/2lK8XU8Mkes6SBvZQNjYarW?=
 =?us-ascii?Q?dLdk9e1Ya6GxFryGlP1yvJruTFn1ITgY3ozELBuij+FrX6ezfsXG5Bmyjec2?=
 =?us-ascii?Q?L241uT7wT+Szd1jkpKL9+VqNCAAxti5?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: OhQeVJDBbqbCOlVLLShQG1TC38HOkkQTyIQgIuXrCv9IIfOC0eIkFew3xvvTiGfeS9FZ1v7qPuImx/4WYgMAa9BZMOja2tTjSqq4HpZ/s+ZrJFw6AiWZFa/gM/UyBZ9YdKy88j5gpCSDArQKoRU6if2j7n/x/UayrV73MJ62dyxuoGWgFrFniwh2ujqw3UOWMr2ufdRnWfUgDe1AdVXNV8Q/vFeQFpuskzG9p86pt+9FlPewRvYF4YcooMEFgUP3m/mWfJ0nvAE156h9+l8LDOki+9hqHwIcd1l2kLFwP6JpbZTEhkKp7VXMcv/4slKGWJFKa2aZ+xaLuLs5iYVcH1o3n9mKzk6WayV8USKBdnocgjAqTXbnmxOuILMe28lntpyFiIfvYGWrD+x8d+ixfWKruJL3harirLtd46gHkVw=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR07MB2166;
 6:05jhB1BUKieVDvVg5F58oNI8Vo8iDxmAVru/vigF4EnKhHGnzLnqKJqLn2YpA+9WWqRjr5e7lsKfzJhG0RRo8klqC6jx+MAHpTvYYFCFYgHM2KzjBJVBhHvJgzXgq6Q5s1GBmtEHKY/OHYN4yslbz9F+f44vexnevAsJWQG4yNi7WUmlz0BnIhwxkAWePtaHptdHU7LmS+bGfzVx0zJcvXJGIBHpWPZ5M69ml9H99v++BMLD5eTbKLOQZ8NAs3rMAfhfezqX3HBHi27aXZAJb82y8RK1usMRKfO3ZMcVuYJ/yzttxXIr3uMhb/kksVYgiGPI9C/4Zy1GzO/uEgR/tVa/3u4Socd5WV2fTnywIurBVfSi6te5QVP6G9aXrG6tkrIDvt/qxYmOQbd4JoCCZIsLXdjXBiNRzPyJUSIcMe+K8BLN1B2qQCH8cBGO9stNgl/S1r+on6XVInYL0sod1w==;
 5:OvZ7sP6spOlUZTKdlWs8DUu1KiaQGQ3S+SSrxwxEplOd5SlHW/csrw6//ilQKuTjVmqqsHF+gsL3k6PCh8FdT96cbPke6VDmESWZaN9Tb2Pc+iuhG+U7vwcp0Botw7ZUS3Rt/8hwNpzaXjrib1GWf7VVq0+7FCQTobNu5QqCw/KVbiRc9FBS1tCzLvs/XF0yeIAcyJo+tSsuXatgjftykQ==;
 7:fLTKiHIMV6tL6KNfyJ90C9rz++HRmDf7C8ZPRVIzU3pnSZzW9gscuU8lzJy2LJ0u8Xdzk+mGBau3pcIaNAY1/d+Rn+qchef6fm5WomEeN3WIqFJnLhNNvEfCKoWPjj5Ky4YW/9ngj3yHw7017sHCiw==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR07MB2166;
 20:d6CV6es4OilKKS+EDXYpeq2EamQXNoeUUu8qztMVO2jUsdUHI8mstuoUrq5fAy8Dl9iOwvq+URCRaCqPGwT/Ju9Lz73uSo1sjVeqCKMzowu4mWSvLKdOPRSgzu30NaXTLCRqYmvPmFNVdvKnVYTStuOjp45MDB/VK2NyFknvFkdXyRoKoS4QZZ0n3A6HFF2blzaI2VTXCxnR75/BdLguQI9QC1Tav2ELYUvVGIzQsMWZ6lZQCiRNVFTekc5EXXV+
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2019 17:44:20.3113 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5904dd43-0c20-45ab-6afc-08d677ec6aa2
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR07MB2166
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-11_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901110144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_094425_864469_B4EC063A 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: linux-i3c@lists.infradead.org, Przemyslaw Gaj <pgaj@cadence.com>,
 psroka@cadence.com, rafalc@cadence.com, vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
---
 drivers/i3c/master.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 320d905..72b1711 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2018 Cadence Design Systems Inc.
  *
  * Author: Boris Brezillon <boris.brezillon@bootlin.com>
+ * Author: Przemyslaw Gaj <pgaj@cadence.com>
  */
 
 #include <linux/atomic.h>
@@ -2885,5 +2886,6 @@ static void __exit i3c_exit(void)
 module_exit(i3c_exit);
 
 MODULE_AUTHOR("Boris Brezillon <boris.brezillon@bootlin.com>");
+MODULE_AUTHOR("Przemyslaw Gaj <pgaj@cadence.com>");
 MODULE_DESCRIPTION("I3C core");
 MODULE_LICENSE("GPL v2");
-- 
2.4.5


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
