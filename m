Return-Path: <SRS0=+Y+5=Z4=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4F0C43603
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Dec 2019 08:26:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1E8224677
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Dec 2019 08:26:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pX9Prm7o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="HllnE/QI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="VCvp1mN+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1E8224677
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HIWwHoYzvdXVFge8mcVvKsvBnBCPttIYgcbPz6PMwWQ=; b=pX9Prm7oekVGJS
	jLUiRpMgmA3ku6TS4QjYKTMRTKwro2DiU8Y1a/x3YAG7AX1/J8ndqJnIAoco3FP/nL0pk0E+mj+o7
	RLBR32TJ8r/UH6BvtThZwhcBig6XBsKLqHng1vpzpYJIgrbmgq78xSoiGKgUobm6dPsAO0vHVihn0
	XBHq0xHSjjdr4yIRRHTeTUA7IktBlTyN/63PRinyLpEh5GtfihiDqWYnXPjryCpSgk9VEV9j5nQq2
	8VtjRfyODlGlUX5l6LhpoKa/MH+g/6ivR5H+uDUKniZ/2aZw3prkmhz36Juw5OhHrRp2UxN9LKM8E
	pmSqOZsO3IzGMKki1Jhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1id8w6-0003lb-NH; Fri, 06 Dec 2019 08:26:02 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1id8w3-0003kR-3v
 for linux-i3c@lists.infradead.org; Fri, 06 Dec 2019 08:26:01 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB68Lqfj023881; Fri, 6 Dec 2019 00:25:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=nagjNf5Jm3ajFPsL2jZI8q/CnR0B9yRouVlZOX1jvwc=;
 b=HllnE/QIuTPfKptzb7jjYq/7onDC23ngHW/VdBP09hrc6z102xLYzGk9AU8kpP7BbXhX
 UPSIRsalw/lfhVh9uZVOAY6NIFFoExJ3BvUn13eEyJfqf0ZhP1Sf2nopiXIal1dZoiCU
 vXondZ3Fa+BvxiZTLsP+EqqNL2F1G7EV8I7t2WPklpt+Ji4avKv2tVt6yKBJzfed+0qt
 SUKEJHOnGxZSckZM85uR80z0gVOCCNNCd/kPgc6QacjzKkjPbc7U30zqifE84pePQYkx
 IyU6YoJy+TSly/FCxdHov13WmlEL+1EXd7VKCw8oYPyi8SWLVAfvVc8jFVUf7YbbAfwD lQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2wknv19vnq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Dec 2019 00:25:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAYs1yBuXOXtF+tOc5WqB0ph4+DOWjPHu5AzhGEo3enIBisyChwyAVRDkQ+/4p2Q1xp47GplPs+S2yGnGQodgD7EHLZ1bO6Et0mq50y1+njR9znIJ/pztJ4jG1lU4XuD7KRDdmySzXvlpqlYjPZghgB3ds2s9zSPfzvf8IP/XNiiIfencgrFamagmMybxwGL4+ChJr7Dls+zZmLe6zVoniTMplSy1h4JXr8ZjH0pXDRVxNhMki+QGQpcF7IqHDLJg6FibakzFR5oqIk56VuATq8vAL9MHJIN/0u2M5p5xiddG30+JcCKUzYbey72STV/4WQZVGdCep3lOsVRe1VBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nagjNf5Jm3ajFPsL2jZI8q/CnR0B9yRouVlZOX1jvwc=;
 b=BfLyThU7g2zg3WsvHL5L7KTpinRTCVx6QhPIOqN1VRasFoy2sObAMyrC2xBBULl+smd0Lfh23mRSxTxFA2MbwLL72D+CfA0nZyeMUMoT8ceYzhHXoHxfzRnfWtmp6KiC+mCHEovWK+R35rVj4Y5Wnoo35wTaIPyr3+vmWhEhnTZLp31LKXoouqONcuTyYWbiPPvT7h6YJTzBX/F7PnhwGYGPgk1Kf9sur9OXRaSRD5DL5xpQHYJ3vjUuoLWSQk8NA9ERTqbdQgbL20V43nm11RVClHx1d5sM6Ac11VUhrKjK4egBnFRcsgHIkDzyxmaGXAjywI5Q+OE7e8OJ8Zkb5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 158.140.1.28) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=cadence.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=cadence.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nagjNf5Jm3ajFPsL2jZI8q/CnR0B9yRouVlZOX1jvwc=;
 b=VCvp1mN+b0DMtgxWWM4NRiww/Jg91YSMVMtqiae3+XHBeb8OIfwJt7LdhDj4JfVfwlT4ECeu4Bk2EfKobAAFkIyVLOoGEGNSPod+nzDNaesjjPtF9WwXRE4mzR/KmXB25VQMJ4zvSV3RutPa7iH2U15wOrDB+aO+w6KuVG3O7m0=
Received: from BYAPR07CA0008.namprd07.prod.outlook.com (2603:10b6:a02:bc::21)
 by MWHPR07MB3485.namprd07.prod.outlook.com (2603:10b6:301:63::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12; Fri, 6 Dec
 2019 08:25:53 +0000
Received: from MW2NAM12FT007.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5a::207) by BYAPR07CA0008.outlook.office365.com
 (2603:10b6:a02:bc::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12 via Frontend
 Transport; Fri, 6 Dec 2019 08:25:53 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 158.140.1.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=158.140.1.28; helo=sjmaillnx1.cadence.com;
Received: from sjmaillnx1.cadence.com (158.140.1.28) by
 MW2NAM12FT007.mail.protection.outlook.com (10.13.180.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Fri, 6 Dec 2019 08:25:53 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by sjmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id xB68PqoF018894
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Fri, 6 Dec 2019 00:25:52 -0800
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 6 Dec 2019 00:25:51 -0800
Date: Fri, 6 Dec 2019 09:25:48 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [RFC 1/2] i3c: Add preliminary support for secondary master
Message-ID: <20191206082547.GA10148@global.cadence.com>
References: <cover.1574897246.git.vitor.soares@synopsys.com>
 <a9466e3de90e1aae1111a17bbbd08311e7bf87c3.1574897246.git.vitor.soares@synopsys.com>
 <20191128055007.GA11250@global.cadence.com>
 <CH2PR12MB4216CDCF7713E8F8929E66FAAE470@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191128125805.GA11351@global.cadence.com>
 <CH2PR12MB4216AAB670F1886F9C9E839BAE470@CH2PR12MB4216.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR12MB4216AAB670F1886F9C9E839BAE470@CH2PR12MB4216.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(396003)(346002)(199004)(189003)(36092001)(50466002)(229853002)(186003)(478600001)(316002)(4326008)(16586007)(54906003)(76130400001)(6286002)(2906002)(1076003)(6666004)(356004)(86362001)(7696005)(8936002)(26826003)(70206006)(33656002)(6916009)(956004)(53416004)(70586007)(5660300002)(76176011)(107886003)(246002)(23676004)(11346002)(55016002)(58126008)(16526019)(26005)(8676002)(305945005)(426003)(336012)(7636002)(4744005)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR07MB3485; H:sjmaillnx1.cadence.com; FPR:;
 SPF:Pass; LANG:en; PTR:corp.Cadence.COM; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7beb8592-3727-4f34-2f96-08d77a25e8dd
X-MS-TrafficTypeDiagnostic: MWHPR07MB3485:
X-Microsoft-Antispam-PRVS: <MWHPR07MB34859C2D1394309C1C852D58C25F0@MWHPR07MB3485.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0243E5FD68
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p/T836VmSAPfIso6h1eomFYzWXpkZ2BClDJHMMHFoeUrmWA5WcxsQfSPRHs+fDrzabfJhTVzT5Zq5l8oO8lVTG4FV0owXNijmciTl52neAj6sLZIE3wsWwffUy7+JTF5PdWdmBor9jjPdOa+BgJYMBqRGWS386Nbh6JgHuu1VUFR9WDGMfBdmR6ehlKxPgshySp7FTSY9lX0qXNBj0kWZwyzDETYsVbR+vnIXOiM88NC3DlDXcUpYi45KYmIMzvjt9d0eAgeA/+mMMxFZU658/6AScvpKadPpKxPC+BJUtr4V0zKbV79/pOW1i/gvwlA3y19boaC7KDign49ZMJ7zA7hhojhRR3zWhx7qHaHpScukTDLSclAp9fDypYRjt5yz2LfK0N/hpER0zArsRXjehjWaqsGNrEcTs6Ga6xGeu1NmjL+NkIKpeQKxfCgozoN1lVdKSyMvOBiHmM9uHOYENKoSgTvuz+Plitr3BWgYf0rRDzPqREp/uNY3O4m7A1CRygd5Rt3luy/tJIhpDF6oUu/RZApHW/7eOsYRuZsUmc=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2019 08:25:53.4870 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7beb8592-3727-4f34-2f96-08d77a25e8dd
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR07MB3485
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_01:2019-12-04,2019-12-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 adultscore=0
 spamscore=0 suspectscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912060073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191206_002559_797338_16A58558 
X-CRM114-Status: UNSURE (   6.22  )
X-CRM114-Notice: Please train this message.
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
 Joao Pinto <Joao.Pinto@synopsys.com>, rafalc@cadence.com,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Vitor,

I would like to share the document with you. This should help us to come
up with better implementation / implementation which fits everyone's needs.

https://annuel.framapad.org/p/i3c-mastership-handover?lang=en

Please comment / add additional sections / ideas which you have in mind.

Regards,
Przemek


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
