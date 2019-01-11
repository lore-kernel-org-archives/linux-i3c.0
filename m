Return-Path: <SRS0=FhwC=PT=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAD_ENC_HEADER,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E06EC43444
	for <linux-i3c@archiver.kernel.org>; Fri, 11 Jan 2019 17:44:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D767420878
	for <linux-i3c@archiver.kernel.org>; Fri, 11 Jan 2019 17:44:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kW+m8stQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="pso4cKtb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="SszgikyF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D767420878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C3nsdjqmOz2K+24T0yDGAxTxuFmiFGUheJJK8GWnPEk=; b=kW+m8stQbtxUhu
	QxPhl+DaAvQUTZ/lSZoZHF9HHQyJBazbmXio4QnWhteCj91XdofAgw/O+mZhDjLQLD0SpzPxlKW7e
	zKdyCrRL3CMzZOBjsoWm8HS+f279WYg2t0bq4SjrsNNkLlvJCB4BMslV+gt1bETtmXwg+8kBZlm/N
	39zEmTD5lsLgdsO91pb0V+2ily/kiMtuR5xoOQANq+qefzi0rJABxL3oKFDDlI6/H3lbOpt9762VE
	l/LKx8k6vvhzMpSHIDq71tINDhUWm7EXTW5pah3ffllm3vHyf5f3byX/MVkl1NHiS/ybFoXeEXpV/
	/4XloQCGcGNq6pkNz7iQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gi0r6-0004xq-Fq; Fri, 11 Jan 2019 17:44:28 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gi0r2-0004wq-NU
 for linux-i3c@lists.infradead.org; Fri, 11 Jan 2019 17:44:26 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0BHfYSl007015; Fri, 11 Jan 2019 09:44:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=proofpoint;
 bh=rmCPaek7He04aK0OPqDEO5YgZgN9BjMdQQxFzieKMNk=;
 b=pso4cKtbKfECz8lXCTtGwZoKJ6OWFNVX4Frn0DMV+YbyCcYrDCDY/0IwqtL24yGGYYjd
 nDdXUDhxKpO3kLcAamZaFRDDS+FY2WH4ze5X2tCiT3PIBN0EEP7gd4Md4XxrZMzRi5hT
 HB73EPR8xZKyOqn9aas/YEMxK07TBLUvMx+N6mtd6KI92VTCDsQZVzK3l3RhqI5kViZA
 ddn5hixztKzCG5GZSWf7NfilOvOIzO0T4zVaRgr8RlRmQYLhsfqsm+19IXLtY9FpXhVA
 D3VOAvraqRWqx9cs+zCZmq95i7VDBACzJ517giCZmgwPd5y3wZgvw3PX6+n1o4mRed26 XA== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam03-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam03lp2051.outbound.protection.outlook.com [104.47.41.51])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2px0jqesbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 11 Jan 2019 09:44:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmCPaek7He04aK0OPqDEO5YgZgN9BjMdQQxFzieKMNk=;
 b=SszgikyFLrdWCEJx9XJWjHry2dB4oZjumxN3Kgqr0rF+PaMc1JBkHTmhJboilJQYVqafVHA0fDpVWilu+TpqHCoDnmM6v3RO+vdWra2Hy2gt6iWca8m9+3RldD3+9I0AJ8i5gZzQ4JAJMD1HIH641v4J5HJGONz7FDfoAFv3aFs=
Received: from CO2PR07CA0067.namprd07.prod.outlook.com (2603:10b6:100::35) by
 SN6PR07MB4416.namprd07.prod.outlook.com (2603:10b6:805:59::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1516.14; Fri, 11 Jan 2019 17:44:18 +0000
Received: from BY2NAM05FT044.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::201) by CO2PR07CA0067.outlook.office365.com
 (2603:10b6:100::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1516.14 via Frontend
 Transport; Fri, 11 Jan 2019 17:44:18 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 BY2NAM05FT044.mail.protection.outlook.com (10.152.100.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.10 via Frontend Transport; Fri, 11 Jan 2019 17:44:17 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id
 x0BHiCgb001990
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Fri, 11 Jan 2019 12:44:15 -0500
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Fri, 11 Jan 2019 18:44:14 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Fri, 11 Jan 2019 18:44:14 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x0BHiDF1001936;
 Fri, 11 Jan 2019 17:44:13 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x0BHiDEH001935;
 Fri, 11 Jan 2019 17:44:13 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v2 2/3] i3c: master: cdns: add support for mastership request
 to Cadence I3C master driver.
Date: Fri, 11 Jan 2019 17:43:36 +0000
Message-ID: <bbf21a32340d06d48b98204921b1007ca5ec569e.1547227861.git.pgaj@cadence.com>
X-Mailer: git-send-email 2.4.5
In-Reply-To: <cover.1547227861.git.pgaj@cadence.com>
References: <cover.1547227861.git.pgaj@cadence.com>
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(396003)(136003)(376002)(2980300002)(36092001)(189003)(199004)(4326008)(54906003)(53936002)(316002)(16586007)(42186006)(2906002)(305945005)(48376002)(2351001)(106466001)(50226002)(8676002)(105596002)(50466002)(8936002)(97736004)(118296001)(81156014)(81166006)(478600001)(26826003)(87636003)(107886003)(68736007)(47776003)(36756003)(6916009)(5660300001)(6666004)(486006)(126002)(356004)(186003)(426003)(26005)(76176011)(51416003)(86362001)(2616005)(336012)(476003)(69596002)(30864003)(11346002)(14444005)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR07MB4416; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; BY2NAM05FT044;
 1:3LM039erjY22cDrShT/m1gKIcO1SWgVGRcGA8qK919ztpdIu8vycYeCub/PNIs58rovSC3ewVKQ6HXtKlaOUSRhmUHl4YORYu4Vxf2EYuH7e30+ZyMCZH4xji6pjZVhngfBMt5r2xxnryTwdRHy6cQ==
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5382db33-fa7f-4cb5-a5a7-08d677ec6917
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060);
 SRVR:SN6PR07MB4416; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR07MB4416;
 3:r+XW0hrYIMVVx83r6K7li4Mz7UL9PYcMLi8HXxvloUdtZKwR7Zc086lrVBcQtZLU2iyFb6zZeRTC3B78drcDsqv3DNdOiRNQB2fDYn9GV9oRB5ktdZs6B/PneTIUKIveCZv4ak7IcqGxa4GbWcFXn4Pgn5Ub6DsPpRoEXpY0FHI7x9xrilDfXC+ik8jNN+OVRjLnyXicUiMtbhXWHyG+i0TI8xm9sRMIJY7gFCgCMXB7YjDdnBuA32DCJ3fqcn39bbJ8WCOfwJ5ilGlEy5puKS5CG8fuuGJXIKZ865wyIdLXa6tMrF030k3Fpplfg0TEQd+3h9cLwznHdRVMTCF0JD547Flx3mHs5773oQpuL8kc963Lq+DPC9qYHmLrOlk6;
 25:VBeZpqjru68j/0WCdetst0KfFBaYjASFAx7ff9CQHDapzZXRYp9oiS/hGrcq0G7nj1V+aWRiu/Me7DHtmGbrYbFH7Zgdz6T4M0Pxj/ultF1Sxr8azcrrpAuNudRRyoFU4nzHycbYy2MIitaaIKd86LmLPVR0ftmoGV9VdJ5RYUH7SQaaf1s2QrME+Pd79gAW+yDT9j4pyVYjI4XH5tSIGIy70mVdl78jcw+lCme+n2Vyn9vg0QCYZomLNuJxqbFeFMnv03vSX3gOer2aMaQuxD7ou/m0iePLu4UtRA4RyZveEMyh4DkjXEDVWRLJc/eQEq8/DxvFP/5S5GUHe/TqSg==
X-MS-TrafficTypeDiagnostic: SN6PR07MB4416:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR07MB4416;
 31:Gl7EWji6cSMhsjRRBIosMQSM5JLAsrgPdZEm89SCARv92iofJC221zAFqwg8gndKcbJWOkNAtBgz+WCIAqngA8rXmI4+hr5pG4KhgRw8kG+s62Jt059iUn7gj9+rSYKl66bN1hUv/nUT24RHbRw4zqc6lZOsVhvtR1lgXz86szz34DLyhPtnjoARBp5FA2pRdh6ocq94BFAqi7mwkk9aNGkWLs4dPSNxjg3oUuxWDq0=;
 20:u80ZTYWoFN5Quschlk6HO9j2wV4A85MJw8944W0gutc8SvQtheVAOn6QhLPp6OB2rAmLKRHO3D/94X0Yl8XMF5ACMgsFqIhDW8Q9Ag3xBM/Vi706A2WXHrozAtb23G2GCHvYEvP8SNRVXljAv3FMFsQdnsveejuIypifzPiedBrGuYhtl1+okdzHVrtixYtGdyBrld1BwLJhJGgDx4dLb06NuUA6igqgAZNbSD77q2uJoPsP6DX1LiaFoCS6XrrAxHjKh5Y89a9NJBYd0LLSEIlRhBGKhu7RHNvQ9G9JxF4K4uF/y4NMuX+G0p63ZNCvvkYCd1ozSGZbVL/B/lRm1hTQEDZWAuEr5+RNIQhNQMwT5NP4AVES21nQQTidr7aAcT7VltxuVFrKDm8uXApV9l2bMyyazUteZmTfutCGvQvdxLcPxSmCGsPZlFTpR5E3Br0TAm4EtiaRpQeQxDye/gG2agt0IqmwIShIQSOPIpbLBJehMVrBF6ZkzxZDesz1
X-Microsoft-Antispam-PRVS: <SN6PR07MB4416970A6F0393D0F1EEBF6FC2850@SN6PR07MB4416.namprd07.prod.outlook.com>
X-Microsoft-Exchange-Diagnostics: 1; SN6PR07MB4416;
 4:yVJY/UhMnNy48QqHxL/ryK5Pn5akJuq9zJjPVLk/iVy1/aQqWVIthpaBdwoyp5UwXxWwjASM4dalyzAJXHW2Qd3sW3jvupgvxyTEBXi0CJ7WmjBRY91v8Ulf1dlmhk9/pqv0yW04ynfUBvojh6oybiEr+PDLvcRAVvYZwe/KnKDt2IKz+bxO9LlAAZQDmJ0FjtM90gFDpbm9u+LHdLLDnfdgqPjKEfQiZdINIXZycTJvBHS6Qocn37Gz8qxVKgXsiGLOXdbODSRWw/JwK+XBSHn85NximL1TTxMHjdngIVHqCUdDgiXIepcSmQG/SPm+
X-Forefront-PRVS: 09144DB0F7
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR07MB4416;
 23:plaZ/2heE5B48urSo12Smpcr5c76RBDwErQLWDia/?=
 =?us-ascii?Q?cAGkSF29G/TK49KH3XWLwdV+8M0yrbIklyQcakbYIfSoGP2u11Htu782YFaf?=
 =?us-ascii?Q?tfpyHrImx+94CFh5SLmcoWDwi0V/oQzA4LFME3aAczx5Kl8uVNdW+MqYKzP8?=
 =?us-ascii?Q?2cLGdBL0CNmvXtopFWgpp7jZ7t0LVO/9OzzADS0Ho9AxVwCt78wuAxL2R5Pq?=
 =?us-ascii?Q?/LKJjWRZ1YOa94Ou6i78hApMNGoapr9bTT5KkXQ5e0jkgbtM2reL1B7unDjc?=
 =?us-ascii?Q?ESIgdSxBwqYZ6rhpobAcS6hMRsfRrkPXqWkSqf58Bpm8AF1ogb8k+6MZOZqL?=
 =?us-ascii?Q?/nOTQ3hHDBXD3gxT9Hox0tEcgmMjnfxOqWjcJN30wAWWLdrUKyreE7KCeE5R?=
 =?us-ascii?Q?C0N2sgMxaHMgcmgltUIpnL8uGWy2QHCaLtWXihfoTfU1Q5zHDNHUHnKHexAr?=
 =?us-ascii?Q?u4+/479XA2p1i++hcuf7B+2aq1YwtclFzt5t7Jy3ZcARy+73qPaQzMcSC6ZO?=
 =?us-ascii?Q?86P/SiLQatSYb+dY6x+qtzuGvtjzR/1L1d/62PK1dZ44zs+UevOmhuMFcpFQ?=
 =?us-ascii?Q?AQ1VMyJtsPeO81y6Y5QI3wMGtOn0kiZAz3L9XDUeB0oSHNJbpQ6SPit2rf01?=
 =?us-ascii?Q?UyvzeJA+V26V1eR/Y1Y8AH9aouO6dnCaWOcf3bY9ejtbzDMXp8a38j6I3TNc?=
 =?us-ascii?Q?D9gS1bYpZYm8S+uA1/5wXkHFCzLqlxQvjzlZcJ2JXo2sAPbdaebj+60xFJtC?=
 =?us-ascii?Q?R0TCHWnIl32tGSJUaQEw3jG7YQqviYK+jQVChot7ApCTYmWWdx5V94UGcVg5?=
 =?us-ascii?Q?WKg+GnEDXvTuym6PMQyGUemwQGxCA+OFrKZUD+kP36xyz5DXTIs6XETOoDnZ?=
 =?us-ascii?Q?mNWb6NJRNPS7dW6uUtvAAqm4+beF0OQnJ8qk5pRnuhIH5kTwuRhoRclhpg7V?=
 =?us-ascii?Q?h/Po3ny+Qyju38tQColzPy+wtE5QI5nZyr8Xgs2y93FNK1i2WJvoIR6/mORS?=
 =?us-ascii?Q?YmuVs0Hw3meJ8xJ4y/wxHU38+UPM9cAaIrRtBX6WqMo8hr6FOre+S10XTrRd?=
 =?us-ascii?Q?A0KgYhNX/TjM1Nb48L6WEJdjaT0HmYkxWUawhC8zGvFhKKAkFUlBOtDXQ0IR?=
 =?us-ascii?Q?OyrDDQy4EbVEljb0ouEfgzBMnw3Y7oiK2Bhj+i1yW3+I0pQ317LEauQQIaSc?=
 =?us-ascii?Q?a6/XvZGJ2yOrGg373im0w7N7nsn1GvW9vQt1YAtCy5aa5JSFHIL+7b+yw5is?=
 =?us-ascii?Q?82ndBrBCBwt9e2KseE=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 0N4um4cZmj3r/241C6aNUwQWeVbYYZxWG7FIah9blBmeWFA+T9xzmndrD9FD59vY2l6XLShYf23yS8T0AixF+e9TvTkc4g1gK79rc/3NdoGN5HPzrdVHFDHsezR/x+xY5D6hOnCnUTO6wXgTYGMoxQP/1SD8j3NoXU66o/Ws62fkxj/YYd76Y6LojLUycYQj1SO366zToaE58rp9NG5wxkYjST4GI61XxHN7+QezbefB6Ma5Z0l2zqNf1j6Om4ZbqwzZvNy/ipliK+Z2vJ9y4L8cejoVmhJoNy5iS87PWCLEQ2Xi/zHEBrS19P9QbPRyCPKPfgl0W80SqqfaekefFktR3V2/WDcv058QcKNay+bbOhOXK8LN9jUKIXhuuv7gbBkfY8LgnYUeVTG5MtCN23PfnaY4qcXi8LS1YL1q4rY=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR07MB4416;
 6:U/2jw3Mp94p6rHPNnnr4nQYw7oHnPQrGAAFzuujUQdI9blJ1SkImNHeAJWUNihfMkKqnEoMZ+LsbJID2zYeuLlgHEmMRaGokaznN4TIjGwGTzekFGCXyjRHy0raHJPnvMksEQJTRK4W5STjh85DrGdcEZjtWUJwnSyrREflks8F/rmN+vQcPWhzY7ZSw0lDyce8+ot2iWHdG/xDO+ZD68Z23HO1reIYBcGpF7beB5UYSyBEDKUPhW9/byjHVsJf+fOHt8T7TLkQZDnqFpIOd260FuFLGpUy5D+PJ0kyO2c1Cz441EhtgoKW8N6ntlvgpFs/TXAucg6jZps2SDD4LJtkIEWvZxPyQckEB+VgmVKaf/hGfhDEkpWVHfXtpLjPkK8ZMc5gU8iZP87ELJse8HUe5+lBlz7vpi+SmOyXKW/fBoUJNwE+UtE1INcPdB0yMKQOt/N9oLfbcaHi25hrEjQ==;
 5:jCCMMus6aWP1zGjs3mQBWVcvm860xk3pcwFJLvn3by2m2Sr+Zyc9hjAIiXcSfhl9efDAay/LSpi9kY6Tv3QSIIs8srVV6lLddNpHBcJXdHQKyZSXct8sLbXvf/esFJv9pDVQfqqKXlbnIVJdhmkdzeA6jYRaVvuT1T1uYssbZQNXdexWGRxfkxC3/65qf2A56j3KrnrVwpwsYzLosf7OMQ==;
 7:PnI9vPws+3BEdhOPQ/Af7aB5SWmn/y4pSxLj3CA8ULG/jYbhWf+Zu1h1rj/8k/Sf/+7F0etyXDxOq8D5R66E1L43AycgAThetBBhHuZu1qD7dC111XQPPRtasQyud7EMngtR5NdkPwr9Ndy/MQEeqw==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; SN6PR07MB4416;
 20:zcAVp0FiR0IxZ/5IitCP4vWkE7+JUQ7JAjCSpKuahdNFguKgS9PnkuoD1m7P4QKz2IxJWbP7XVgkiDtF718QbFPQELMDYCeLVltaU2UMD4ro7/0wdd127QQ3aHePbjeBGR+eOSKrucaOZL6a8DVoN5Xvd21CkbRZjEBa+L/uvwzk0SEz2FQitJ6vABwtNr90+9SaqSE+aZu9JwnIxXOCAxdIh4udPpm1MWZz9dYEgEjnJWobyOp0rGuV/e53ezaO
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2019 17:44:17.6147 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5382db33-fa7f-4cb5-a5a7-08d677ec6917
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB4416
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-11_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901110144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_094424_883005_7DB619AB 
X-CRM114-Status: GOOD (  12.67  )
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

This patch adds support for mastership request to Cadence I3C master driver.

Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>

Changes in v2:
- Add work structs for mastership purpose
- Add missing mastership disable feature
---
 drivers/i3c/master/i3c-master-cdns.c | 385 ++++++++++++++++++++++++++++++-----
 1 file changed, 339 insertions(+), 46 deletions(-)

diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 02a8297..578fc1e 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -157,6 +157,7 @@
 #define SLV_IMR				0x48
 #define SLV_ICR				0x4c
 #define SLV_ISR				0x50
+#define SLV_INT_DEFSLVS			BIT(21)
 #define SLV_INT_TM			BIT(20)
 #define SLV_INT_ERROR			BIT(19)
 #define SLV_INT_EVENT_UP		BIT(18)
@@ -390,6 +391,12 @@ struct cdns_i3c_xfer {
 
 struct cdns_i3c_master {
 	struct work_struct hj_work;
+	struct {
+		struct work_struct handover_work;
+		struct work_struct takeover_work;
+		struct work_struct request_work;
+		u32 ibir;
+	} mastership;
 	struct i3c_master_controller base;
 	u32 free_rr_slots;
 	unsigned int maxdevs;
@@ -664,6 +671,89 @@ static void cdns_i3c_master_unqueue_xfer(struct cdns_i3c_master *master,
 	spin_unlock_irqrestore(&master->xferqueue.lock, flags);
 }
 
+static void
+cdns_i3c_master_i3c_dev_rr_to_info(struct cdns_i3c_master *master,
+				   unsigned int slot,
+				   struct i3c_device_info *info)
+{
+	u32 rr;
+
+	memset(info, 0, sizeof(*info));
+	rr = readl(master->regs + DEV_ID_RR0(slot));
+	info->dyn_addr = DEV_ID_RR0_GET_DEV_ADDR(rr);
+	rr = readl(master->regs + DEV_ID_RR2(slot));
+	info->dcr = rr;
+	info->bcr = rr >> 8;
+	info->pid = rr >> 16;
+	info->pid |= (u64)readl(master->regs + DEV_ID_RR1(slot)) << 16;
+}
+
+static void
+cdns_i3c_master_i2c_dev_rr_to_boardinfo(struct cdns_i3c_master *master,
+					unsigned int slot,
+					struct i2c_dev_boardinfo *info)
+{
+	u32 rr;
+
+	memset(info, 0, sizeof(*info));
+	rr = readl(master->regs + DEV_ID_RR0(slot));
+	info->base.addr = DEV_ID_RR0_GET_DEV_ADDR(rr);
+	rr = readl(master->regs + DEV_ID_RR2(slot));
+	info->lvr = rr;
+}
+
+static
+int cdns_i3c_sec_master_request_mastership(struct i3c_master_controller *m)
+{
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	u32 status;
+	int ret;
+
+	status = readl(master->regs + MST_STATUS0);
+	if (status & MST_STATUS0_MASTER_MODE)
+		return -EEXIST;
+
+	status = readl(master->regs + SLV_STATUS1);
+	if (status & SLV_STATUS1_MR_DIS)
+		return -EBUSY;
+
+	writel(readl(master->regs + CTRL) | CTRL_MST_INIT | CTRL_MST_ACK,
+	       master->regs + CTRL);
+
+	writel(SLV_INT_MR_DONE, master->regs + SLV_IER);
+
+	ret = readl_poll_timeout(master->regs + MST_STATUS0, status,
+				 status & MST_STATUS0_MASTER_MODE, 100,
+				 1000000);
+
+	return ret;
+}
+
+static void cdns_i3c_master_update_devs(struct i3c_master_controller *m)
+{
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	u32 val, newdevs;
+	int slot;
+	struct i3c_device_info i3c_info;
+	struct i2c_dev_boardinfo i2c_info;
+
+	newdevs = readl(master->regs + DEVS_CTRL) & DEVS_CTRL_DEVS_ACTIVE_MASK;
+	for (slot = 1; slot <= master->maxdevs; slot++) {
+		val = readl(master->regs + DEV_ID_RR0(slot));
+
+		if ((newdevs & BIT(slot)) && (val & DEV_ID_RR0_IS_I3C)) {
+			cdns_i3c_master_i3c_dev_rr_to_info(master, slot,
+							   &i3c_info);
+			i3c_master_add_i3c_dev_locked(m, i3c_info.dyn_addr);
+		} else if ((newdevs & BIT(slot)) &&
+			   !(val & DEV_ID_RR0_IS_I3C)) {
+			cdns_i3c_master_i2c_dev_rr_to_boardinfo(master, slot,
+								&i2c_info);
+			i3c_master_add_i2c_dev(m, &i2c_info);
+		}
+	}
+}
+
 static enum i3c_error_code cdns_i3c_cmd_get_err(struct cdns_i3c_cmd *cmd)
 {
 	switch (cmd->error) {
@@ -1045,22 +1135,6 @@ static void cdns_i3c_master_bus_cleanup(struct i3c_master_controller *m)
 	cdns_i3c_master_disable(master);
 }
 
-static void cdns_i3c_master_dev_rr_to_info(struct cdns_i3c_master *master,
-					   unsigned int slot,
-					   struct i3c_device_info *info)
-{
-	u32 rr;
-
-	memset(info, 0, sizeof(*info));
-	rr = readl(master->regs + DEV_ID_RR0(slot));
-	info->dyn_addr = DEV_ID_RR0_GET_DEV_ADDR(rr);
-	rr = readl(master->regs + DEV_ID_RR2(slot));
-	info->dcr = rr;
-	info->bcr = rr >> 8;
-	info->pid = rr >> 16;
-	info->pid |= (u64)readl(master->regs + DEV_ID_RR1(slot)) << 16;
-}
-
 static void cdns_i3c_master_upd_i3c_scl_lim(struct cdns_i3c_master *master)
 {
 	struct i3c_master_controller *m = &master->base;
@@ -1259,15 +1333,17 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
 	prescl1 = PRESCL_CTRL1_OD_LOW(ncycles);
 	writel(prescl1, master->regs + PRESCL_CTRL1);
 
-	/* Get an address for the master. */
-	ret = i3c_master_get_free_addr(m, 0);
-	if (ret < 0)
-		return ret;
+	if (!m->secondary) {
+		/* Get an address for the master. */
+		ret = i3c_master_get_free_addr(m, 0);
+		if (ret < 0)
+			return ret;
 
-	writel(prepare_rr0_dev_address(ret) | DEV_ID_RR0_IS_I3C,
-	       master->regs + DEV_ID_RR0(0));
+		writel(prepare_rr0_dev_address(ret) | DEV_ID_RR0_IS_I3C,
+		       master->regs + DEV_ID_RR0(0));
+	}
 
-	cdns_i3c_master_dev_rr_to_info(master, 0, &info);
+	cdns_i3c_master_i3c_dev_rr_to_info(master, 0, &info);
 	if (info.bcr & I3C_BCR_HDR_CAP)
 		info.hdr_cap = I3C_CCC_HDR_MODE(I3C_HDR_DDR);
 
@@ -1289,6 +1365,23 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
 	return 0;
 }
 
+static
+struct i3c_dev_desc *cdns_i3c_get_ibi_device(struct cdns_i3c_master *master,
+					     u32 ibir)
+{
+	struct i3c_dev_desc *dev;
+	u32 id = IBIR_SLVID(ibir);
+
+	if (id >= master->ibi.num_slots || (ibir & IBIR_ERROR))
+		return NULL;
+
+	dev = master->ibi.slots[id];
+	if (!dev)
+		return NULL;
+
+	return dev;
+}
+
 static void cdns_i3c_master_handle_ibi(struct cdns_i3c_master *master,
 				       u32 ibir)
 {
@@ -1366,27 +1459,105 @@ static void cnds_i3c_master_demux_ibis(struct cdns_i3c_master *master)
 
 		case IBIR_TYPE_MR:
 			WARN_ON(IBIR_XFER_BYTES(ibir) || (ibir & IBIR_ERROR));
+			master->mastership.ibir = ibir;
+			queue_work(master->base.wq,
+				   &master->mastership.handover_work);
+			break;
 		default:
 			break;
 		}
 	}
 }
 
+static void cdns_i3c_master_bus_handoff(struct cdns_i3c_master *master)
+{
+	struct i3c_dev_desc *dev;
+
+	dev = cdns_i3c_get_ibi_device(master, master->mastership.ibir);
+
+	writel(MST_INT_MR_DONE, master->regs + MST_ICR);
+
+	master->base.bus.cur_master = dev;
+}
+
+static void cdns_i3c_master_mastership_takeover(struct work_struct *work)
+{
+	struct cdns_i3c_master *master = container_of(work,
+						      struct cdns_i3c_master,
+						      mastership.takeover_work);
+
+	writel(SLV_INT_MR_DONE, master->regs + SLV_ICR);
+
+	master->base.bus.cur_master = master->base.this;
+
+	if (master->base.init_done)
+		i3c_master_bus_takeover(&master->base);
+
+	writel(readl(master->regs + CTRL) & ~CTRL_MST_ACK, master->regs + CTRL);
+}
+
+static void cdns_i3c_sec_master_mastership_request(struct work_struct *work)
+{
+	struct cdns_i3c_master *master = container_of(work,
+						      struct cdns_i3c_master,
+						      mastership.request_work);
+
+	if (cdns_i3c_sec_master_request_mastership(&master->base))
+		dev_err(&master->base.dev, "Mastership takeover failed\n");
+	else
+		dev_err(&master->base.dev, "Mastership takeover succeed\n");
+}
+
+static void cdns_i3c_sec_master_event_up(struct cdns_i3c_master *master)
+{
+	u32 status;
+
+	writel(SLV_INT_EVENT_UP, master->regs + SLV_ICR);
+	status = readl(master->regs + SLV_STATUS1);
+	if (!(status & SLV_STATUS1_MR_DIS) &&
+	    !master->base.bus.cur_master) {
+		queue_work(master->base.wq, &master->mastership.request_work);
+	}
+}
+
+static void cdns_i3c_sec_mastership_done(struct cdns_i3c_master *master)
+{
+	writel(SLV_INT_MR_DONE, master->regs + SLV_ICR);
+
+	queue_work(master->base.wq, &master->mastership.takeover_work);
+}
+
 static irqreturn_t cdns_i3c_master_interrupt(int irq, void *data)
 {
 	struct cdns_i3c_master *master = data;
 	u32 status;
 
-	status = readl(master->regs + MST_ISR);
-	if (!(status & readl(master->regs + MST_IMR)))
-		return IRQ_NONE;
+	if (master->base.bus.cur_master != master->base.this) {
+		status = readl(master->regs + SLV_ISR);
 
-	spin_lock(&master->xferqueue.lock);
-	cdns_i3c_master_end_xfer_locked(master, status);
-	spin_unlock(&master->xferqueue.lock);
+		if (!(status & readl(master->regs + SLV_IMR)))
+			return IRQ_NONE;
+
+		if (status & SLV_INT_MR_DONE)
+			cdns_i3c_sec_mastership_done(master);
+
+		if (status & SLV_INT_EVENT_UP)
+			cdns_i3c_sec_master_event_up(master);
+	} else {
+		status = readl(master->regs + MST_ISR);
+		if (!(status & readl(master->regs + MST_IMR)))
+			return IRQ_NONE;
 
-	if (status & MST_INT_IBIR_THR)
-		cnds_i3c_master_demux_ibis(master);
+		spin_lock(&master->xferqueue.lock);
+		cdns_i3c_master_end_xfer_locked(master, status);
+		spin_unlock(&master->xferqueue.lock);
+
+		if (status & MST_INT_IBIR_THR)
+			cnds_i3c_master_demux_ibis(master);
+
+		if (status & MST_INT_MR_DONE)
+			cdns_i3c_master_bus_handoff(master);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -1455,30 +1626,46 @@ static int cdns_i3c_master_enable_ibi(struct i3c_dev_desc *dev)
 	return ret;
 }
 
-static int cdns_i3c_master_request_ibi(struct i3c_dev_desc *dev,
-				       const struct i3c_ibi_setup *req)
+static int cdns_i3c_master_find_ibi_slot(struct cdns_i3c_master *master,
+					 struct i3c_dev_desc *dev,
+					 s16 *slot)
 {
-	struct i3c_master_controller *m = i3c_dev_get_master(dev);
-	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
-	struct cdns_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	unsigned long flags;
 	unsigned int i;
-
-	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
-	if (IS_ERR(data->ibi_pool))
-		return PTR_ERR(data->ibi_pool);
+	int ret = -ENOENT;
 
 	spin_lock_irqsave(&master->ibi.lock, flags);
 	for (i = 0; i < master->ibi.num_slots; i++) {
-		if (!master->ibi.slots[i]) {
-			data->ibi = i;
+		/*
+		 * We only need 'SIR' slots to describe IBI-capable devices.
+		 * This slot may be used by mastership request interrupt,
+		 * We can ruse the same 'SIR' map entry.
+		 */
+		if (!master->ibi.slots[i] ||
+		    master->ibi.slots[i] == dev) {
 			master->ibi.slots[i] = dev;
+			*slot = i;
+			ret = 0;
 			break;
 		}
 	}
 	spin_unlock_irqrestore(&master->ibi.lock, flags);
 
-	if (i < master->ibi.num_slots)
+	return ret;
+}
+
+static int cdns_i3c_master_request_ibi(struct i3c_dev_desc *dev,
+				       const struct i3c_ibi_setup *req)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	struct cdns_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+
+	data->ibi_pool = i3c_generic_ibi_alloc_pool(dev, req);
+	if (IS_ERR(data->ibi_pool))
+		return PTR_ERR(data->ibi_pool);
+
+	if (cdns_i3c_master_find_ibi_slot(master, dev, &data->ibi) == 0)
 		return 0;
 
 	i3c_generic_ibi_free_pool(data->ibi_pool);
@@ -1487,6 +1674,37 @@ static int cdns_i3c_master_request_ibi(struct i3c_dev_desc *dev,
 	return -ENOSPC;
 }
 
+static int cdns_i3c_master_enable_mastership_events(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	struct cdns_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+	unsigned long flags;
+	u32 sircfg, sirmap;
+	int ret;
+
+	ret = cdns_i3c_master_find_ibi_slot(master, dev, &data->ibi);
+	if (ret)
+		return -ENOSPC;
+
+	spin_lock_irqsave(&master->ibi.lock, flags);
+	sirmap = readl(master->regs + SIR_MAP_DEV_REG(data->ibi));
+	sirmap &= ~SIR_MAP_DEV_CONF_MASK(data->ibi);
+	sircfg = SIR_MAP_DEV_ROLE(dev->info.bcr >> 6) |
+		 SIR_MAP_DEV_DA(dev->info.dyn_addr) |
+		 SIR_MAP_DEV_PL(dev->info.max_ibi_len) |
+		 SIR_MAP_DEV_ACK;
+
+	if (dev->info.bcr & I3C_BCR_MAX_DATA_SPEED_LIM)
+		sircfg |= SIR_MAP_DEV_SLOW;
+
+	sirmap |= SIR_MAP_DEV_CONF(data->ibi, sircfg);
+	writel(sirmap, master->regs + SIR_MAP_DEV_REG(data->ibi));
+	spin_unlock_irqrestore(&master->ibi.lock, flags);
+
+	return 0;
+}
+
 static void cdns_i3c_master_free_ibi(struct i3c_dev_desc *dev)
 {
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
@@ -1502,6 +1720,39 @@ static void cdns_i3c_master_free_ibi(struct i3c_dev_desc *dev)
 	i3c_generic_ibi_free_pool(data->ibi_pool);
 }
 
+static int cdns_i3c_master_disable_mastership_events(struct i3c_dev_desc *dev)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
+	struct cdns_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+	unsigned long flags;
+	u32 sirmap;
+	int ret;
+
+	ret = i3c_master_disec_locked(m, dev->info.dyn_addr,
+				      I3C_CCC_EVENT_MR);
+	if (ret)
+		return ret;
+
+	if (data->ibi < 0)
+		return -ENOENT;
+
+	if (master->ibi.slots[data->ibi]->ibi->handler)
+		return 0;
+
+	spin_lock_irqsave(&master->ibi.lock, flags);
+	sirmap = readl(master->regs + SIR_MAP_DEV_REG(data->ibi));
+	sirmap &= ~SIR_MAP_DEV_CONF_MASK(data->ibi);
+	sirmap |= SIR_MAP_DEV_CONF(data->ibi,
+				   SIR_MAP_DEV_DA(I3C_BROADCAST_ADDR));
+	writel(sirmap, master->regs + SIR_MAP_DEV_REG(data->ibi));
+	spin_unlock_irqrestore(&master->ibi.lock, flags);
+
+	cdns_i3c_master_free_ibi(dev);
+
+	return ret;
+}
+
 static void cdns_i3c_master_recycle_ibi_slot(struct i3c_dev_desc *dev,
 					     struct i3c_ibi_slot *slot)
 {
@@ -1529,6 +1780,10 @@ static const struct i3c_master_controller_ops cdns_i3c_master_ops = {
 	.request_ibi = cdns_i3c_master_request_ibi,
 	.free_ibi = cdns_i3c_master_free_ibi,
 	.recycle_ibi_slot = cdns_i3c_master_recycle_ibi_slot,
+	.request_mastership = cdns_i3c_sec_master_request_mastership,
+	.update_devs = cdns_i3c_master_update_devs,
+	.enable_mr_events = cdns_i3c_master_enable_mastership_events,
+	.disable_mr_events = cdns_i3c_master_disable_mastership_events
 };
 
 static void cdns_i3c_master_hj(struct work_struct *work)
@@ -1537,13 +1792,31 @@ static void cdns_i3c_master_hj(struct work_struct *work)
 						      struct cdns_i3c_master,
 						      hj_work);
 
-	i3c_master_do_daa(&master->base);
+	if (!master->base.secondary)
+		i3c_master_do_daa(&master->base);
+}
+
+static void cdns_i3c_master_mastership_handover(struct work_struct *work)
+{
+	struct cdns_i3c_master *master = container_of(work,
+						      struct cdns_i3c_master,
+						      mastership.handover_work);
+	struct i3c_dev_desc *dev;
+	u32 ibir = master->mastership.ibir;
+
+	dev = cdns_i3c_get_ibi_device(master, ibir);
+	if (!dev)
+		return;
+
+	if (i3c_master_mastership_ack(&master->base, dev->info.dyn_addr))
+		dev_err(&master->base.dev, "Mastership handover failed\n");
 }
 
 static int cdns_i3c_master_probe(struct platform_device *pdev)
 {
 	struct cdns_i3c_master *master;
 	struct resource *res;
+	bool secondary = false;
 	int ret, irq;
 	u32 val;
 
@@ -1585,15 +1858,27 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&master->xferqueue.list);
 
 	INIT_WORK(&master->hj_work, cdns_i3c_master_hj);
+	INIT_WORK(&master->mastership.handover_work,
+		  cdns_i3c_master_mastership_handover);
+	INIT_WORK(&master->mastership.takeover_work,
+		  cdns_i3c_master_mastership_takeover);
+	INIT_WORK(&master->mastership.request_work,
+		  cdns_i3c_sec_master_mastership_request);
+
 	writel(0xffffffff, master->regs + MST_IDR);
 	writel(0xffffffff, master->regs + SLV_IDR);
 	ret = devm_request_irq(&pdev->dev, irq, cdns_i3c_master_interrupt, 0,
 			       dev_name(&pdev->dev), master);
+
 	if (ret)
 		goto err_disable_sysclk;
 
 	platform_set_drvdata(pdev, master);
 
+	val = readl(master->regs + MST_STATUS0);
+	if (!(val & MST_STATUS0_MASTER_MODE))
+		secondary = true;
+
 	val = readl(master->regs + CONF_STATUS0);
 
 	/* Device ID0 is reserved to describe this master. */
@@ -1609,6 +1894,7 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 
 	spin_lock_init(&master->ibi.lock);
 	master->ibi.num_slots = CONF_STATUS1_IBI_HW_RES(val);
+
 	master->ibi.slots = devm_kcalloc(&pdev->dev, master->ibi.num_slots,
 					 sizeof(*master->ibi.slots),
 					 GFP_KERNEL);
@@ -1617,13 +1903,19 @@ static int cdns_i3c_master_probe(struct platform_device *pdev)
 
 	writel(IBIR_THR(1), master->regs + CMD_IBI_THR_CTRL);
 	writel(MST_INT_IBIR_THR, master->regs + MST_IER);
-	writel(DEVS_CTRL_DEV_CLR_ALL, master->regs + DEVS_CTRL);
+
+	if (!secondary)
+		writel(DEVS_CTRL_DEV_CLR_ALL, master->regs + DEVS_CTRL);
 
 	ret = i3c_master_register(&master->base, &pdev->dev,
-				  &cdns_i3c_master_ops, false);
+				  &cdns_i3c_master_ops, secondary);
 	if (ret)
 		goto err_disable_sysclk;
 
+	if (secondary)
+		writel(SLV_INT_EVENT_UP,
+		       master->regs + SLV_IER);
+
 	return 0;
 
 err_disable_sysclk:
@@ -1666,6 +1958,7 @@ static struct platform_driver cdns_i3c_master = {
 module_platform_driver(cdns_i3c_master);
 
 MODULE_AUTHOR("Boris Brezillon <boris.brezillon@bootlin.com>");
+MODULE_AUTHOR("Przemyslaw Gaj <pgaj@cadence.com>");
 MODULE_DESCRIPTION("Cadence I3C master driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:cdns-i3c-master");
-- 
2.4.5


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
