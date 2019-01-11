Return-Path: <SRS0=FhwC=PT=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A0AC43387
	for <linux-i3c@archiver.kernel.org>; Fri, 11 Jan 2019 17:44:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBE4820874
	for <linux-i3c@archiver.kernel.org>; Fri, 11 Jan 2019 17:44:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P6RbqXkg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="FKiUdgz2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="P9BbJoTQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBE4820874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KXnEkbx0RCErBY6j1rSgE5Qt8tWUyEjpNZyQlFpGG5w=; b=P6RbqXkg/Ai+wM
	I/9/I3QD78hzpwFpv2Cc4BjBv+P8xONbYr68PPWjdMf6VlgFSa1yHTyiW1E5NUuukiQlAgQRmfw0z
	sTnlzWhJHXDhlPjNh8hfXj5JLvhy4oksSuKf0iFTOh8IXbdIzpmfcKhrlOVr9hMvDaWwAQuFvh6Q8
	h7R7hziCustuCteDXviKNf3pDRmOTsC3UwP+FOw+QlGURWy0HULXOE+UtmSR9fIzi1I4aCecwAgjX
	u2uE3sCR2NDfOG+Hsy4XVC+8vgMl9vOpfC8TlQmUzaZK+4pGVw/hW2j5bHoU21XA2hhgbj7TFkKcm
	4rZK2EBiRKc3xmhhBeJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gi0r1-0004wg-AF; Fri, 11 Jan 2019 17:44:23 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gi0qx-0004vw-NR
 for linux-i3c@lists.infradead.org; Fri, 11 Jan 2019 17:44:21 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0BHhlqo017898; Fri, 11 Jan 2019 09:44:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=Ln9Upbx2UPi70TJ7dUzcB8o1qpWbo4XwXyay1PiJMhY=;
 b=FKiUdgz2PDX6/+YagQ2qKOjnx5994lqjU/hJv1/WgSiuAuMNJQiwMygpSCpIaNkitiKB
 3MjOKzpszuoJIxh6m2dzpLn8HpK9nG8d/XqDvsLIVc+SPXQnZTEtzvJ9K3LQcnz9UN6e
 wvc4IKulLMVu/GAdDfzJz4sXbEY8ytV4FW8XJqe/z4zUliJ1j7pqyXuTuILQL57unySd
 l8nNDjTcd7WEdSYWWVVblFEk18qFUMFjHKgxI+UrdjGoym57KMKHOn/CEjkmG1MJmxlG
 Gf7I20/zU8MoiX8z6kfcJvFAVG+2Zki/UQ04pes9yFDNwuAn94XfKTgbtS+7128Q1rG6 dQ== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2058.outbound.protection.outlook.com [104.47.38.58])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2pts22e9n2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Fri, 11 Jan 2019 09:44:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ln9Upbx2UPi70TJ7dUzcB8o1qpWbo4XwXyay1PiJMhY=;
 b=P9BbJoTQzzPOpFXNd5mbsLr61XxUlDmeNTV3z1MjPJXbAtN983mAft+uB2G/pBjONRzxq6IT2LRQ5Dg2TwZi0VVTMrgH1LN3Q2gsPqKPfSCLbLLKli8SzCOVro2Sj+sNBRCgGQHHfzKDAuf1sb83iumrZ2sjusEnMXYGb3a9yww=
Received: from DM6PR07CA0012.namprd07.prod.outlook.com (2603:10b6:5:94::25) by
 DM5PR0701MB3720.namprd07.prod.outlook.com (2603:10b6:4:7e::32) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1516.15; Fri, 11 Jan 2019 17:44:13 +0000
Received: from BY2NAM05FT046.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::202) by DM6PR07CA0012.outlook.office365.com
 (2603:10b6:5:94::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1516.13 via Frontend
 Transport; Fri, 11 Jan 2019 17:44:13 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 BY2NAM05FT046.mail.protection.outlook.com (10.152.100.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.10 via Frontend Transport; Fri, 11 Jan 2019 17:44:13 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x0BHiAXM028781
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Fri, 11 Jan 2019 09:44:11 -0800
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Fri, 11 Jan 2019 18:44:10 +0100
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Fri, 11 Jan 2019 18:44:09 +0100
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x0BHi94k001766;
 Fri, 11 Jan 2019 17:44:09 GMT
Received: (from pgaj@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x0BHi8Q8001734;
 Fri, 11 Jan 2019 17:44:08 GMT
From: Przemyslaw Gaj <pgaj@cadence.com>
To: <bbrezillon@kernel.org>
Subject: [PATCH v2 0/3] Add the I3C mastership request
Date: Fri, 11 Jan 2019 17:43:34 +0000
Message-ID: <cover.1547227861.git.pgaj@cadence.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(376002)(346002)(396003)(2980300002)(36092001)(189003)(199004)(26005)(336012)(50466002)(126002)(426003)(51416003)(6916009)(47776003)(42186006)(2616005)(4744005)(316002)(36756003)(246002)(16586007)(7636002)(54906003)(476003)(4326008)(107886003)(48376002)(14444005)(8936002)(8676002)(5660300001)(186003)(305945005)(105596002)(2351001)(6666004)(86362001)(356004)(50226002)(106466001)(478600001)(486006)(26826003)(87636003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0701MB3720; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; BY2NAM05FT046;
 1:nvUdhsV7WegSM3YjZ5uJBFR/h/XagHFtQA/be8Av3p3piIZvasFHGncupvfRgapVvj5Hls5FR9yNlT8xsnNwweksjBFjxjczJ9p8JeA4VJqEW53mqchwi71yUJV+SV/xAFxS7ggwLjIeJ01VLr/6ww==
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a3bfd61-b66a-4472-34a2-08d677ec665f
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060);
 SRVR:DM5PR0701MB3720; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0701MB3720;
 3:o7YmTH/rF+EheSyNSRDjUu6krb0FW8OOH1T6qVYW0p3U4OoW6es0jRbzFbvlZN2ZhjT/Q3u8S6lDDPoVTts9lkAILTyCM9+Lrw1Av4+Mm4Z2qDhcwvhbr/uJD3/JpFyLYqIvkhluo/l0uIckxpAs/hnpvR7gGwktJAyOcFoPQEdCq4G/dXCdZY+im586d/ad36Pk4gh4/ZVseq+CUDzTLu0yzhmlkBhzSpEdysqG/gIUZrPwmLnDQ5HzTbLgRn6HWgAhhIwY7v4SjmREACdxFEl4b04dSu60xFYs2igQ3KGWgJMbr0gQbv3R4ydLip/tMeFKy366oa0sLWYALJ8FXQzlTx4FhclFeCotLfjHmxZtMvncO+Lt5zU7L/ABcyoC;
 25:YTLckTrENau8RvnFlAlTrVbHY6yps7SAQXdniNXhZrSzE8qtesfEPsRO/3nhP2uetMqsODxKMkI26uPncJBfbYI++TyJ5rQ8SFZgh8n5rP4YUq4TRE4xRJOqd2OEV/++UjxKbOm7cxzLOUWf1HStwwy0+PlMo08GWpU2e/zx4CSGbQOD2Fq7/8FM6kGvXJ0ihN682PM/iuvwQM8y628Fklwy6iSKN+FIYuj+v0jnL90eO0e7R6KN2w0gZhsxstDUynI9GHKViSJSBzIX1s+jjxMQjMgYj4J1uJ4l4s728QtFTcVgWcJ8mKok9BfjyRmAZJdLfjbgfe15o6s+zxns7g==
X-MS-TrafficTypeDiagnostic: DM5PR0701MB3720:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0701MB3720;
 31:rfWcEJhamG+/FFV+tOPIKMDThIkA09IIQE35flDTVUffsXmxQuHXNGczhG3MEMr8rt0hr234x75qi8RcrRUK3c6rfAGCJfSE0tUtZtyD2orzGybyvu/0+VT/kFAKtMBUt1f49Kj+0+B6V39o4msXyEbUYO22l4hNSMv1IhYLufXSVuZ86bIzqlR3hhNjKFVQ7D2plorFkHwop/mc6zx2zkIn5GNKAxHxkINxXz5MX0I=;
 20:YZzFZ5QD6i2vcFm0bv2P2kJsUEyVOMbpOGVNlDB+DZCSIexR2uyKbCBX1dxk0l0Cx+2YbzcRn4a0J3YdCZ7cCOaYkSH4CmE0sNU3ViihtrFzpXsrwXRdWvYUmi+PraO1s4c+NcaALENm8j+7ptKYQf/zBRj4CajUTQ26ST8XCmvnXlOZ4PlDzAHZqipRKQ6946+E4bB6wnEhgFW+7U+nMnxcLgc5kVq/8Kz71nF2gExStsoSWcEw0u5yOiAY1j9IPVN/IHa46Had0z7Qff8IDA7xS/P3VDwka5ufjtnkWSG+5Y+nelvNpi+Tzyx5h8IoJ+0kDMHY+vxRtym1AxNXCoxkwQhDnoYXQE86uP6Wf9Es4eAbvYdNRMZtiPEolEtGnLbZpk3VopkcjtuKyTEtU9IyLxX1zHa1yXENeoF9iWsViYB9EP8HBoaHONS4uOO3TA+zWhXUtclV8ey+I6XrK4r4uvnTh8rmPUsl88ByBp08ctfAgtKMgdiWcuV8Rd7g
X-Microsoft-Antispam-PRVS: <DM5PR0701MB37207422A1D3CB93FAED7C62C2850@DM5PR0701MB3720.namprd07.prod.outlook.com>
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0701MB3720;
 4:hqyGS2VYFzwNqGoHyXsJZRhjfREVNxiCvvf7/cwULhLaik7Hiwu5SAStu/FrRT5w0YQUwDWBStZ0nHAbRe2KG9oSx7uwbfNZbom+io/FDY4/RC3B3TswEp0QC2zS5ygv/SOWLsiPQ+wG0lZ+fxnbOeNzkPGMiisAK27vENoZbY6y557ruo9A/yQhvfh+YE3YooxER93eeHkHWwL3pXEIUJTixFWzC6YiCH91opP3jeR+XiqQc+i+ZQxIRrZNR+0MQdzFRCUi2sTbJee9U+fCt73EkVWR5t3iEwS2+YitIFscs8vTUmiHyV5DR+1UnXDJ
X-Forefront-PRVS: 09144DB0F7
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0701MB3720;
 23:lHaGQG0lYS8J3hm/5KmV3eg2RRQySP0pouAWSSH?=
 =?us-ascii?Q?zn4vWp/5ZsNjomaCRa2kIpmvTrhfMexCd03Y4rmGAz921ogmXn5iuI9TOaBx?=
 =?us-ascii?Q?ztldy+nGe8tabqPshg2tvyTPW5GBwdLdGJSECEaSZh0NdzMWLHZMJaeByBkN?=
 =?us-ascii?Q?02Nms02ExfB27LhwHt9fr2G4hFe4ED/CqCEEZ9fLwzi8tISdi+odpeR/ugjO?=
 =?us-ascii?Q?IpmxGNWvaQxFXNR88SaG9sXl9+lJ3xZDBNIm5XEPobNH7XMjKcnQMpDvaNhl?=
 =?us-ascii?Q?x/UFdjOuJhrHcfMO06bOwMRhgsIPHpK/rbjhzyFYXhN5uS7sfcS38DoKxbR0?=
 =?us-ascii?Q?yoDyxeQnxWJ9M1I6JTy+MLI9Plf/zgZpaI/dXnCJwPqLXxQ0w0Q/LjTU3dmH?=
 =?us-ascii?Q?pWB+FHwFw2KAb9g6aKhTsn7A1gniWTzvSYwmKdoXHvlec10T3qU6pMEnDUS2?=
 =?us-ascii?Q?hMAq1ZdZxj03WnoppuHIlZexn5JlL4tLslrqzHCaJ/1XDlydabHfefvMWWMY?=
 =?us-ascii?Q?+rxvknh71NUiR/Gm7CivuU21aQgpG771K5Ni3E9hLGRjfbtcPn/g/+HDRgOX?=
 =?us-ascii?Q?jWk6HUKLHzN0Crv7LWLRATnReEgmU2gn8cm45BZuRoET3O9j/aeb+fYLb17a?=
 =?us-ascii?Q?nxmURCHn4/XgAC+Jh0x1ANpjunAdLDx70ENzKaVwiPe2wNOlEJkWhzsBTLrN?=
 =?us-ascii?Q?t4eRyPPGydFiZA7QOOFFZWvpHStMCRvGaMz9csW3cESLlsqBi6/E3bNGIYA9?=
 =?us-ascii?Q?LXXhlbHD5S4joJL+d+rIvcvskmY+WThc2sUdlo9btnFFtQ+tpbyG/4FVwlwW?=
 =?us-ascii?Q?F4jgUnmq6Ns1bEaItXiacgA0zIUptU2AwjavIuAGFpsBic9noVXh/jhYSss9?=
 =?us-ascii?Q?K3Bwhz1tK7Gw/tMcd4vORioeFYTM0skJGNK5jjO4ALHC995hh3CA4dpEmf0u?=
 =?us-ascii?Q?9Cxcnei0sCbos8g1btI4DFD+jWeFNFii6ocYFCfTW3JNeUWH0UUECmPxCuhD?=
 =?us-ascii?Q?m+ULJJLNJcBEnpIPhSY5JCBnNi/peg7WXC0N1U4Fcp8kAqb7m7nlJH+CFq5f?=
 =?us-ascii?Q?sl25HQJdqWzWzk4MI3FzWEDA6dRjP?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 6WTXyeK9VGNiAVMnyYNImkpQiFiYqSM9xvPjMkPRIdg7n0coTUek++NFjZxtcuJbgrLLMnKmtyamhDu0Qyu7iYzXY5qACzOuHt7UTMXbcDFsMMGNWzDP+SZdEMsfqj4j8AFOIKXCS4dAtkUKQNgtZcLe8mitSviHttc7wzmO+a0DYn4o4O2pRClxhFkh46aviET2qWfVk+coQfFS/WXzw+ei5UvtYKiLZtXHeVqOUczCCP4vQkuyYLxSdNmBctM4cbckju6KnOC/YxzHF8a6hr9MI9VvbKgm9pNyFzAnknVtTVLR/ubtg7TFOo+eQZJ/dqlsD2qdh9WFK1SbVU7zZuc335s/tYNcnCsJBS70RGIONg+Wx70GXHVbhRMZ8satPiaKK8n4aH6J/xyK6hMH/Xmt7z7EQfgCELj5TexOMpw=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0701MB3720;
 6:2bpRCp2gi+Q6VJedjmaXyc5L+VC3WKCNXa+LpdRvKexuYfu5TJ1sv6ZJRwliCpE8Wml4BwLV7LGoF4r+/M4QkWTUb0WnofkZFWkvu8tHtoeUZBO4uQSSk2ninQJazJh2eBb+cojicy//a29jqhod67GsGAGf7noxerR9yunnm5lbTDI1WQdumOobvblQBgFxBoLuWfGCakNvX1q7zxU40K1V6Hwq7Ca07JS107iWXC62zKDM/ZgO8acSoYhpmmXFwx89X9s2UBql/H1911SY0P0eDViuuF0ABZq0GjO4Tzs9DvaomN2FZWyPn3j7kt6IRuKEVbHwstRlH+QE0OQ9EsMqczexAW+3OKeUhw0lhP3ggsZ0fCQo2s/6nNx4/M0JabOxwXZgDdLckcaunE7G86m/YbokkfNvnnKXMCaecpNxD+whSVjGlRWa24VoR3oLeoDIu/uF3oBte9wUML7X4Q==;
 5:Ty6BjJOdawixI9epo+UF51p80uzKOQgTi/G8t/O3I7W8QxZxtbzNCZ0FNJORtG0+16C/P+GUTACclk3+NtJ+3xBGkQW/JLy3VBpMhFdxFag39eT7qLkPmleWQFIHjV9oWpIhhavnJbQqtE/9XDsWZk9VcRcvIE6oSe1qBStFkPpRYbNnOOcK2+oImegRy7s6nauBNglOzIHaj8g16UEomA==;
 7:SIwJhVd5AiuCpb51JjTWAcUEAiW/t5B46IxG3X+l5sOyUEbFJeP1TJTn/IVzxupUBAw29yfUmftF4OtWLNiVK73QrBaicRv3eiJnZLP/jU7RIiW/jc9kel01znZ0iX8jWIVoHO1rueTSNBmM6+CdEw==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0701MB3720;
 20:uc1Wtmpn7/6c6ARyqJaOYqehJnptmWCsoHlNucK63C2dmHk5/Gj/CgOElbKFu3cNqfimJXooGFCEqE+4Qux7Axe2NihyyqYQFH/A3AMkkXahbFLb5ZY58YtCZsPMFouhJK1oRu4MjPNRlpfSti87m7KGkN6p173sUfGo8+KBMJnb4QEXmPngmMmEh6xm+s/bYFstwNB039bcXHQr7FEFq6hY8X1x2tUpES/EH/ctIqocKf84HOsI6CqhY8W9e3mk
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2019 17:44:13.2381 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3bfd61-b66a-4472-34a2-08d677ec665f
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0701MB3720
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
 mlxlogscore=887 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901110144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_094420_284872_EBA9B24D 
X-CRM114-Status: UNSURE (   9.17  )
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

This patch series adds support for mastership request to I3C
subsystem and Cadence I3C master driver. Mastership request
allows slave to become the master of the I3C bus.

Main changes between initial version and v2 are:
- Reworked devices registration on secondary master side
- Reworked mastership event disabling/enabling
- Reworked bus locking related to mastership takeover process
- Added DEFSLVS devices registration during initialization
- Fixed style issues

Przemyslaw Gaj (3):
  i3c: Add support for mastership request to I3C subsystem
  i3c: master: cdns: add support for mastership request to Cadence I3C
    master driver.
  i3c: master: Add module author

 drivers/i3c/master.c                 | 258 +++++++++++++++++++++--
 drivers/i3c/master/i3c-master-cdns.c | 385 ++++++++++++++++++++++++++++++-----
 include/linux/i3c/master.h           |  29 ++-
 3 files changed, 611 insertions(+), 61 deletions(-)

-- 
2.4.5


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
