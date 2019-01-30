Return-Path: <SRS0=WTHI=QG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A84B8C282D5
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jan 2019 08:30:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73DC521852
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jan 2019 08:30:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AeOG+u4D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="raJ6QF6+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="iV/pcSFZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73DC521852
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mo71wr1blJgHKgY0jzjvGIwTnC5WOfmK47FVPEtTQ6U=; b=AeOG+u4D7dS2Q4
	k9cwBWNzyaQosTbmeccqKEtw+8ara0gYYEV3F8nWsAKEI61zSD6fPIngmUJ4XLlI3P8DeFpWGZnZw
	AZqJcDY6Y7wUTs7zmdFE1DfmWD9RE0KO9wwyI+jMEsSLGCbTPzT7+Whn30OBofpnrx73JbdXjuZ8D
	V0w8XyE/aSA1kHX2JIRtMYJgw2l74ui48g8TDLwt832mStRhgx70h6yCRFotNXgJHo1jq1n9KA6OS
	4u14VI0Y8Y9sn7wmELXd/csAVZzkqUvaZcFp7z/vFQli9c2CLGpDhood+40jJ41uuZTfT00i8sWpK
	v+RpzKnfy5Tk7lPYexbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1golFy-0005MN-NE; Wed, 30 Jan 2019 08:30:02 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1golFu-0005Iu-NN
 for linux-i3c@lists.infradead.org; Wed, 30 Jan 2019 08:30:00 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0U8Qrfj007596; Wed, 30 Jan 2019 00:29:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=kPGSCguMWKkA5UAlRT9YaQ5+zN3puOGYLmBchh9C5u8=;
 b=raJ6QF6+U8ziF3Hj2QGW48bGTv1Snr7IM0TUAdBBNSBaFalpHidjNt2juVN5ivFYm4Zp
 zLdqCMM8RiQluC8mO/fKq+tOU97Hk8xLlrVbZcRSaQTJe8rnvIwO15IbAslHv4Y89EvP
 8fBO8lzC+iLiJYHfWIwlGOExa55sWmJAK9K0ypE+NZMMrjnS0jXYUPIbKM7g85mc5GnL
 mwcU9n8dCnsiZiBrbIYM8oOm3JnQ/G7vF0zqotUZvSaX6KZKs8y0FEkjW/0JQggsdjzE
 BDdIW4lDizVO7SXiKTc00oEj/czwUz7MsLETAFcMKf171TnQiA7+IByGTrBndbmp/JDh uA== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam05-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam05lp2059.outbound.protection.outlook.com [104.47.49.59])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2q8n007pm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 30 Jan 2019 00:29:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPGSCguMWKkA5UAlRT9YaQ5+zN3puOGYLmBchh9C5u8=;
 b=iV/pcSFZg88fbZ4H9W9eOnTqCDgyw8CHXBEU1bS4WBHdivA87WfvOC6K917zfm4cvp4t8otB4NEWUGUBviUR/kKJoHD9RjhT3Ztvhwx+KXgAKFLUvI5IuyP4HV5ZMpVECVeMh9be8PZBKt3hYUjjGZaE+WGePHISIAbE5skjYo8=
Received: from BYAPR07CA0052.namprd07.prod.outlook.com (2603:10b6:a03:60::29)
 by MW2PR07MB3979.namprd07.prod.outlook.com (2603:10b6:907:6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1558.21; Wed, 30 Jan
 2019 08:29:51 +0000
Received: from BY2NAM05FT036.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e52::202) by BYAPR07CA0052.outlook.office365.com
 (2603:10b6:a03:60::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1580.17 via Frontend
 Transport; Wed, 30 Jan 2019 08:29:51 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 BY2NAM05FT036.mail.protection.outlook.com (10.152.100.173) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1580.2 via Frontend Transport; Wed, 30 Jan 2019 08:29:51 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id x0U8To2P026948
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 30 Jan 2019 00:29:50 -0800
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 30 Jan 2019 00:29:47 -0800
Date: Wed, 30 Jan 2019 08:29:45 +0000
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: Re: [PATCH v2 1/3] i3c: Add support for mastership request to I3C
 subsystem
Message-ID: <20190130082944.GB8271@global.cadence.com>
References: <cover.1547227861.git.pgaj@cadence.com>
 <1eca82e2d7bbff19597b78a3ce1ad62273015529.1547227861.git.pgaj@cadence.com>
 <20190115220953.400d06e7@bbrezillon>
 <20190129181335.GA8271@global.cadence.com>
 <20190130085626.7576b311@bbrezillon>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190130085626.7576b311@bbrezillon>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(376002)(346002)(39860400002)(136003)(396003)(2980300002)(36092001)(189003)(199004)(486006)(54906003)(7696005)(2486003)(6916009)(16586007)(476003)(93886005)(126002)(14444005)(4326008)(33656002)(229853002)(66066001)(26005)(186003)(55016002)(16526019)(6116002)(3846002)(316002)(246002)(58126008)(7636002)(7736002)(1076003)(47776003)(305945005)(76176011)(50466002)(2906002)(356004)(336012)(26826003)(53416004)(105596002)(446003)(106466001)(8936002)(956004)(478600001)(23676004)(345774005)(6246003)(11346002)(426003)(386003)(86362001)(8676002)(6286002)(18370500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR07MB3979; H:sjmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; BY2NAM05FT036;
 1:7bfKoyScQvzc8FoDOSn+whHRwXw0HpZepKeprARmRiHzB6ahxglwHWywov6zide/tNZa4/2/C740vd0qXsl7/Zs7waaZuKil8yvQl5f9bJCGb3wSmO2/3gHNeeHDJUfdQKwg3qa3D+OBZwOIkezyvPgrO0GxI12vmtqDECGgAXI=
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4449a578-80e4-4ca4-ba8a-08d6868d1a6e
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:MW2PR07MB3979; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR07MB3979;
 3:OBfYe+kyFdRJa3ORdvdMgsSPlSOhN+yTUhfmpAQzFwOL62vkOT8zRY7K5gkeiIoqS5dbBwCrxd9Y42wExStMNNebC51r73aHoJ8YAlnOpJKjzQBRJUFkQqmA005p5hA6QeoyDBcloGiyRN+1RQhvzTBdL1u5K+LO6SNbHrvj/E60RnrFpHvAzDZUIMihGTo0thlTGwtysFLN76W8XaPzzTnatej+4KPaBh7NXY6eEjediKPqoNAuI/5pYF31Z3WYaEvSzdH1u2KK0UnYSJqNodFGCSfWEiQcpKDpMI6LqC0Zsmsl+uBCQVQIy2SxYk7Czi5jO6ePXxp3xyNvvLn8fFDVzjek4F9kFR5RLOJobd4sDOHQOyOV+kzWFviNnyOU;
 25:KhFHQMfwxg4w+WsmYIk+TrSwliio2vhAWaW/cKrQQar3OW88WvLqNPkWPV2+dpuuX8vpzRXEjQ+ZxBci1qMz/j/yl3sQ0oP4fR1jdduQg1w3nhRomfxMgfe5dZBKtd0YEjiiqvwVfrf/3H0dg/dT6vMf3dNN7VGsLyH3x3M/Onb6tI4vkema2FTdr6G4Y2BmCTCkO9V6x8eQk2nIoj+jcPvrPIPoetVcSkWXlOshRj880TXw4h1ohlFnjIkPOEeKywNRFyAqtDP/4nGgMfAnImXIAkmig11tWaH+reTZb+ReVCg4hZr4rUWpMX6LwMalrBSWSJ2TxX/C5hTtQZ5GRQ==
X-MS-TrafficTypeDiagnostic: MW2PR07MB3979:
X-Microsoft-Exchange-Diagnostics: 1; MW2PR07MB3979;
 31:emqHeAxc1AXgc9fM6wLEK+ti42HLodkjzRvy0h83kGr0H/8tNyNjW2sD0fKkq/rIRi7SL/C8p1KyQs0OmrcSUr3faHX9V2yuDnPGW38o667oxCFHp/dMIgiHQZ8HCX7Hn/g2mlT3imf8bCcovBWvrGizGp+oabgXW7TU8gCBcSP0FJzCPWXet8s1QAcagCC0Aor/JmBdJCO7iL75gQCsLruI8hMTPm0efwV1HsExYZE=;
 20:KlCGTmPco1zQlGw/SOYYfxHN9U68mRi6PaHP6Z9vPrr5LApFj9kteqpTMEqR6EAA/ioJhjPt6sxi0glvcqbXbpeoB7gA62vI3Hy8x92jCwFb1qvamA0Zxd3Ks4hWopvFLfwyuSt1EPWPybaSPTbUv01hHbjQ3P8ajkpS4O3tyXjQ8yHdx3izeg01a/QCnNdOaiwaW9ff0qh+Nezc2hvG574EO/Szoz5wZMUm8xW+6t+Gp9OOdyNeAQbHsWboUS1925r/Nr7ZVimZPkl69jGawt3+16+PYDqPv0ziYrSCSWyM8PPlaqMzFGZEoqyHG1nxKAOV0NJE2DTqH/nyXvxWQ6rPCGGNTEW86A7UFBCSMHL7NecI/A+kfuBNNdzfddhT/RGfOrA/8RufrPzZtY2qquRl9GJPqdcBc4yEn5uPm9VevFikFofcg0WgCindvj9CiwkQed5zSk7qBylQAVCqxRV1GFstHvaYNxHY/6zz06qiW+fRkEcoiGxGZXPvgb/y
X-Microsoft-Antispam-PRVS: <MW2PR07MB397977623685061435359281C2900@MW2PR07MB3979.namprd07.prod.outlook.com>
X-Microsoft-Exchange-Diagnostics: 1; MW2PR07MB3979;
 4:Q4AWjRSQ+2xjyN324LMSFd755zXMfuxlR+pTtgreKFFD8Wx2SZ5dq7yMR+FqVUvvBt/uysqwc91sKjOjSw3WKLZLK4RxKPib14NPFNm9N/kSSHwFy7S+y3tPZlWcCwL2EHY/EEfv/Krj6lBOtrOlOtwUnvQMoFu5Cixs0bVu/mtz09c2OmBYDwWZJfRvirhE79zRQ+Z8Rx2AvXChgHa8ql1e5sZtyspGXG5A41Bai2+uFLPllrPlUlal7p+uufBYo56ZhO0N7HImhknuvGWLjpV2EusmzkLPMkN5ywSvIPdCs460JljurJCef68hxKy7
X-Forefront-PRVS: 0933E9FD8D
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtNVzJQUjA3TUIzOTc5OzIzOmkyVUxTR2htMFJjRUhqc1kwMC9xZkZDS1Fm?=
 =?utf-8?B?OFdtNUdUeVlVRFFIdWtscWJuRis5dzB6WlhZV0p6UjRObEFrTmdnRXBxWHR0?=
 =?utf-8?B?eHQvTFRSWWtRa203LzhQQ2t4QmRvcENkckk3ZWFFcDA2VHRUend6TUZzaWtD?=
 =?utf-8?B?MFJLN1dtblpRbTZGbG94a0s5ellYcEluclc5WnFPUDRvKzErbHRRcGtOeVFX?=
 =?utf-8?B?NFlVb2VMOURTRm0xSkMvUkNpNXg4SE0yTm5XZXBnWG95aklYVXZSQ3hLbUpB?=
 =?utf-8?B?NEZuQjd4cCt2ZWhzSFBpcTdSSXg4V25YSGZFV2x2TWhJL2dVam5VcldUYzlT?=
 =?utf-8?B?TlVsa0VIT2xWMzZlNWxXVTRCendHcEdoZGhxMUtmdklMWVhsVXppUVUyRmRi?=
 =?utf-8?B?Y25lcnNNcDYrUlBPMExPekkvQy9kQ0ozdWFUT3JZcVlFQnU5c05kQlpobnVl?=
 =?utf-8?B?OGJHdVM4WUhqR2RQTUlObkVSOE03dlBMbzNUSHRiMGdoUEFnZmR3UkNialla?=
 =?utf-8?B?UE1KeTUrZ3pkWWUvNmlubFpHdUFsY0VRZ2ZnS2EyUENGTGdITWk4MXNSdkdt?=
 =?utf-8?B?NTVQR21ZT0ZIRXU1OFdBTlBrNnVKS0JrL2NQQldJQzVDU3hqWW5tUUp3ZUNI?=
 =?utf-8?B?WWtTdUNzVFpQbk1mWUJyS1I3M3V4cHlkZ0NPVlAzLzkxVVZxWGhnNU5OUjFz?=
 =?utf-8?B?cEdFQTAwblRtNTE5SEhmV1ZjZ2xFNVNxOC90K3N3aXBoenhNQWZFczYwR1dW?=
 =?utf-8?B?bUNjby95RW1rcUVOekFIZTlwdW15T1pxejN4N1VseXpPWDg0OTZVdWszLzNo?=
 =?utf-8?B?Uk1oblFFOVBjUTAxMG84L01mYWdTZ0hSbUhjRVliQ21CY3I5ZktONndzUmYx?=
 =?utf-8?B?R095SHBHZCs4RGkwbkV6aldEN1RhTnJCbndvN3BHMGxTRkdINHIwL1dpUm5i?=
 =?utf-8?B?bXdWRFVNRjF1VGczemUwNkxBNktrU0hVYTVZS09mSy9MOEZQN09Va1Z5dkpV?=
 =?utf-8?B?V3pPSTBIbnlxKzVTRis1VlY3R3c3N25EN3RieEJuRkRmSTlONVY5K2NlME9t?=
 =?utf-8?B?enl0SUwyMGJHdHg0RmQzUzFDVlNCeXVMUW8yNVRBRUNsY3NqY1J2WlBNbFVV?=
 =?utf-8?B?cXZPOC9QTTBWazkvYmlCeWw5b2d6TlFqTzFLakIrWDZJTElJeUNQbktXbHRH?=
 =?utf-8?B?TGR3YUN3N3JHZmZ2d3MrVGNLU1BER1ROWk92Zlo5QVg2YnFlTDZ4Y1pXMGJ0?=
 =?utf-8?B?a3Nta1M0SWVnclgxaDFvR2cxVENveG1DS2dpMGRiMnJCZ2RsN0kwOGRsS3V0?=
 =?utf-8?B?NzlHeTdoWWlCNXBvc1JOdEdYeCtmZFpTMm11QU44SHZZSHkvblJ6eDdrUksy?=
 =?utf-8?B?NmJ5WlhNUTV5d2IwakxSUFJOZHV2TDAvMGhwbHdpNE1JZ1dyYllZV2xodnov?=
 =?utf-8?B?YWtnTHNnWWNrSXVuNlpaV1NYOGJ6YWZLUjhWc3graktvazhVUEkyMTFUanlv?=
 =?utf-8?B?ZEJJK29TZk82TkNMU3lqY0FlRlg2REMvQUVTVVZhVTdSbDZiekV0dlEyVGFJ?=
 =?utf-8?B?SnprMW00RDc2UnFNVytRSGRNS1JnSDJEMUhDL25SK3Y4a05mdktubGthcjQz?=
 =?utf-8?B?bDBkRElwczcwU3VBSzVxTWNBZkY1L1Z2c2l0YVRYa1RkanBjSkRaZkJoMHli?=
 =?utf-8?B?TXVHSTFjcnA4MGg4ZWlJYS9HTjB1ZThkQU9TN2tkTldFYmZyVXNzb0pvVGtu?=
 =?utf-8?B?bDJDNVEvNXJoemhiZkwvdz09?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: N/tkmBW9mecWoGpdgFKIglZpcnbId7dVfb4MikHRDxDjin7ZMAs5+rhsJd7gcllAkIr/TDIj8/1sGZsI454jeFiDhWlsnykc3LLez4chO/VLgrrPp29JqfSIKneQ05JVEHTat9IjBAUGNxIi7rE5i7GffM6U4gzqvtoAig0kXsSqZ3HnqKw1oqR9CiEcinbIkp5m8CKacSOv6MYhkFZQxjQGgm2EKkd5O6nQ50RJ4xBAjgdzcvNN7iL/s088eqjZoP8UHgFYNFNtVJwmCOjQUGLQsZfPpe9Vsu447lVZofpEgkHNGeRqZIMs9MaIY42ju9gyvP5Jkm4uceBO8d7WuGFxjmtNEP7Unym78GclTCtKDJP/4yddNpIb4gHcAYCe/HnaK7eCaRDQLQmEbfVVKOQY5SRH359S3Q1oMeYk2Ww=
X-Microsoft-Exchange-Diagnostics: 1; MW2PR07MB3979;
 6:9/AcfHEJ6IH+1q+wrrJArEckKi0CZG/a8h+uX/6MNfIa1nqqozKRWrPH45J6v7V8qyYptfA91Ujm31FBWFEqW3EMLtH14uA3mymMsr5l7SiLDxThJshqgPEdth1TJGHwzH6Y7OhcUriFEfUb+HJyESVX9ZUp8+Kjgj9jgq+Dt8P57seVXf4yqpSmKiik2fmlj4Sfi8lut3eaN6n+7QiwODIu6zGTzbD2eFp1I36ugGhTOoZxGj9TpvIHRvFatcWyPGIuTH/3HtLm0SOSQgUVGi7UPspDWdtXLf1YpJ0Db0yRXS/GBQw5xYeW/iGt4k83Uxe0tY0uaDcL+y49E2heS0U+fdO3/x6tqDxUpCbX+Wy547Rfciyox+g8TAwcP/Wf01vo6JI+HDT/W5uAFl4exswH6+Icdfy4DyC42aV95tl30queYdHqygVAGsKmteg2oBMBw0wGsireO3OjEgPMng==;
 5:44zd/xPQjybNdpOMb+j0Z0N0t87oGC4Ls2cQ5ZXOzEOud1BXoPp1wQm3kBCNX4fy3j8IECQpI1eJZ5Iz5KL7FODHoqrpIsXMvT6z/WC6mMNTMksBsEtgeehfeYZLBjUbJoFxA2blKJboRGF58ieNDZP+VeMya6TgvakQT4vHdPTgTno6U7LVZaLy38oX1JzDgoZc9/JJsLPHmvKSV5zC/w==;
 7:r29SJi5AcjgPct/wEIf+JtI9yjBHPOKdKAxQpplvVsyC9/kEMZC2FiWYSwqz2RkCkbSs8LKp+Pp1A11o8Wx3wkpZbTCwN2nZ0QyVP3lnhW89CXdocQrlTd2cVCHJ9naOaowXCzeF8EuUSUdcL6WaNw==
X-Microsoft-Exchange-Diagnostics: 1; MW2PR07MB3979;
 20:d9VgEbQ+CeXHXWYYxM+mg/NItj6DOCdpT2hBmAgJe91J9Hh/BzLtJ7deh0lco0M2ZbR6O0I68re4IJTD/yHZgpuu4er6vSXhZEzqldosSBfFflwLHCgi3aT/lsIu6HL0BP1XONHnObhel9zkgZYMxx5tQNiJogBfSchRIcnTMSnOnBJJ9Ve3f96tyziC8XRMCWaSiVWDnXpOCIqcsCVbgNz/ZenzO9prKkKg5SqtEgMEV/8KXTW8OqBbhOAzbtIo
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2019 08:29:51.0858 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4449a578-80e4-4ca4-ba8a-08d6868d1a6e
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR07MB3979
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-30_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901300067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_002959_164090_230FF8A6 
X-CRM114-Status: GOOD (  18.68  )
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
Cc: linux-i3c@lists.infradead.org, psroka@cadence.com, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The 01/30/2019 08:56, Boris Brezillon wrote:
> EXTERNAL MAIL
> 
> 
> On Tue, 29 Jan 2019 18:13:37 +0000
> Przemyslaw Gaj <pgaj@cadence.com> wrote:
> 
> > The 01/15/2019 22:09, Boris Brezillon wrote:
> > > EXTERNAL MAIL
> > > 
> > > 
> > > On Fri, 11 Jan 2019 17:43:35 +0000
> > > Przemyslaw Gaj <pgaj@cadence.com> wrote:
> > >   
> > > > +		i3c_bus_normaluse_unlock(i3cbus);
> > > > +	}
> > > > +
> > > >  	i3c_bus_normaluse_lock(i3cbus);
> > > >  	ret = sprintf(buf, "%d-%llx\n", i3cbus->id,
> > > >  		      i3cbus->cur_master->info.pid);
> > > > @@ -663,6 +728,12 @@ static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
> > > >  		    !rwsem_is_locked(&master->bus.lock)))
> > > >  		return -EINVAL;
> > > >  
> > > > +	if (!i3c_master_owns_bus(master)) {
> > > > +		ret = i3c_master_request_mastership(master);
> > > > +		if (ret)
> > > > +			return ret;
> > > > +	}  
> > > 
> > > As I said above, I think bus ownership should be requested in
> > > maintenance mode, which means it has to be done before entering this
> > > function. You can probably start acquiring the lock in write (AKA
> > > maintenance) mode and downgrade it to read (AKA normal) mode before we
> > > start sending the frame (CCC, SDR, I2C or HDR). 
> > >   
> > 
> > So, I'll have to call all the _locked functions with maintenance lock.
> > Inside i3c_master_send_ccc_cmd_locked() I will downgrade the lock to read
> > (normal use).
> 
> No, definitely not. The prefix _locked() means that the lock has been
> acquired by the caller, and the function itself is not responsible for
> downgrading the lock. What I meant is that the
> i3c_master_owns_bus()+i3c_master_request_mastership() sequence does not
> belong in xxxx_locked() funcs. It should be done by the caller with the
> lock held in write/maintenance mode, and then downgraded to a read/normal
> lock once the bus has been acquired. i3c_master_send_ccc_cmd_locked()
> was probably not the best example, as this function might be
> intentionally called with the lock held in write/maintenance mode
> sometimes (depends on the CCC command), but for other funcs, it should
> be pretty easy to do:
> 
> int i3c_master_acquire_bus_ownership_locked(struct i3c_master_controller *master)
> {
> 	if (i3c_master_owns_bus(master))
> 		return 0;
> 
> 	return i3c_master_request_mastership(master);
> }
> 
> int i3c_device_do_priv_xfers(struct i3c_device *dev,
> 			     struct i3c_priv_xfer *xfers,
> 			     int nxfers)
> {
> 	...
> 
> 	i3c_bus_maintenance_lock(dev->bus);
> 	ret = i3c_master_acquire_bus_ownership(master);
> 	if (ret) {
> 		i3c_bus_maintenance_unlock(dev->bus);
> 		return ret;
> 	}
> 
> 	i3c_bus_downgrade_maintenance_lock(dev->bus);
> 	ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers);
> 	i3c_bus_normaluse_unlock(dev->bus);
> 
> 	return ret;
> } 
> 
> > Isn't it inconsistent that after _locked functions I will
> > unlock the bus from normal use, even if I locked it for maintenance?> 
> > Also, I will have to downgrade the lock in case of failure in all _locked
> > functions to unlock the bus properly using i3c_bus_normaluse_lock(). DO you
> > think this looks good?
> 
> No, see above for an explanation.

Thank you for the explanation. It's clear now.

-- 
-- 
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
