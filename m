Return-Path: <SRS0=xuKL=FM=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B16AC4361B
	for <linux-i3c@archiver.kernel.org>; Tue,  8 Dec 2020 06:00:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2644523A57
	for <linux-i3c@archiver.kernel.org>; Tue,  8 Dec 2020 06:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2644523A57
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z2hNpXesfFM5UjxdOiSykE3dVvplPev1RGZCWrVmPaY=; b=ffdnQalGJ5qGuOx+hkRx0ZA+C
	RJtL/EURlroWk4bh0GEaRh8GnSRTf2ihQAQ5fEfArj6JTAdqo2DbWulEL4dfVBPp/T+P7wzCrWPYX
	3nZ/LIH9E0pRMASnMDL9zN+B4hlUnTm9XApGB74+BT7vYtGn7BSuzX5XftAklx7yCnsDd+6KnuT/U
	aU0vOcnrAYwxNwPqPcOfMUG2JwZhJDUKPSP5wxmQDDjg9umis6r3VLweQYmtR/dmA0xKqokisPvYa
	PLC6l2XajCs+sEvb/mjUMy1D6pD7KSdVVt5Z+AnBYVqL1qB0xNrXSOCVnmXJJQ3CTq8DkQDYYMlrP
	5/7H0/P6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmW3J-0000P0-9H; Tue, 08 Dec 2020 06:00:45 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmW3G-0000Ob-Gv
 for linux-i3c@lists.infradead.org; Tue, 08 Dec 2020 06:00:43 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B85r609003437; Mon, 7 Dec 2020 22:00:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=Xk2GcRthI8MCFWjBw0l8g+JF3fllb7wFzc8npN1h1E4=;
 b=q9yLaiWYOsir+lJOwAToB1U6fNyppzCB8uIgYkxZTvzkPeReLP5pNKS2mIoW8H2Gl9kz
 CwXLVI2e3MoXZMdrDsSEVjeef4VBpXxFxv0Jq58ezOMkj6ZCRWK+heKoIRaswZ1QyWib
 IFjNLRY+LyE8I/tO9xZucSMOEiQyS3vf6SOOFgr7iizczhvaqmAy609SYnGQRdMxP043
 HwFCE9yItHVxUTk9dIn9ggu7CHlbi62lG04S/IomAgenbXwLlgVeBhvV6Vy33+w5z3B+
 Iivszaft2VEqFl+lIGP5er7LcL7ZrAYtwD+x1xjoeM6NeKFhJPlcugIc/60dLCxQtSsz SQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by mx0a-0014ca01.pphosted.com with ESMTP id 3587n2q8w6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Dec 2020 22:00:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UzNQOLbo9R49V4+x+F0GirXzalb8lmgYwuSt615s37qknuVgPWjqMWpecdWTZlwL1VdMUeyytkfLThJFGEanDIg4uwwzVRC64X+mkvxgEPj+ePspKQPOPDSiAhu+BxeCAP9zz/1JMMs7euOjHWlUEd/8MKT10U17J+PJCevvXnSZ0rBYYropT9s3qsPPjXpuGws4h4M2GPB6TVIZcNP2qU8/iVD+eY9zXiYb5WrdhVdfC0DGCre9/KmaA6xpetWKj61FUREZfP+F7YAbB69vxwvubLn+QVOEK0fForX9LAjDrM55Y12ZVi7cm5EbWXvVbZvgaEl+DwybYJJwvrtIRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xk2GcRthI8MCFWjBw0l8g+JF3fllb7wFzc8npN1h1E4=;
 b=ZMIBRsR3R4TQfsTfAL2Eo3gFMMJ4hIZxaTivtidfMastEm8XH47QKJAaCoyOg+essewkfLBb1NsaaCCkR7DcnRr/IIOAunIW0T8oJW7ShGu+z7o7FH2/gMOVw2YJhbcY3E1rEPHMZ7BoDviLYQ/+zYX9Ci9r75p80MiDKvhclNcfmmtRS0lTrAeulsxcHX7gGV2+5V2oq56TARxnw9rS1KZcAVLXd8cOHy/EE+P0P+tLn2BB/YXT8i1JWSYBGVsTwC9wQftiXJMXIt2EaA/a3imzQaqGJyJz7zkDd888fKP3eVK1Jp1Yz6/2kYW7WkJQR6h0TiAIJXUvE1V4aLgkng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xk2GcRthI8MCFWjBw0l8g+JF3fllb7wFzc8npN1h1E4=;
 b=A3mO2MCBLoRbORe04R6oGsZPhC0aMwu4mMdbexYjVwOtkRkRAs+1kJWGok1qCPpGBf3K5B70pp7zacQUTjVo0ULuYv7FUJZHrohPQfr3ukASdUzg2+cJGqLpd95MsbVffwRW/9NnGPyPgcUodON2LZ/HIxSBSg/t6xfYleZa6bg=
Received: from DM5PR07MB3196.namprd07.prod.outlook.com (2603:10b6:3:e4::16) by
 DM5PR0701MB3767.namprd07.prod.outlook.com (2603:10b6:4:7e::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.22; Tue, 8 Dec 2020 06:00:33 +0000
Received: from DM5PR07MB3196.namprd07.prod.outlook.com
 ([fe80::cc3:be90:e83f:516]) by DM5PR07MB3196.namprd07.prod.outlook.com
 ([fe80::cc3:be90:e83f:516%3]) with mapi id 15.20.3632.021; Tue, 8 Dec 2020
 06:00:33 +0000
From: Parshuram Raju Thombare <pthombar@cadence.com>
To: Nicolas Pitre <nico@fluxnic.net>
Subject: RE: [PATCH v10 3/7] i3c: master: add i3c_secondary_master_register
Thread-Topic: [PATCH v10 3/7] i3c: master: add i3c_secondary_master_register
Thread-Index: AQHWxuCYQMo/4ARcS0SW4IExT24PAKnmYduAgAZbv8A=
Date: Tue, 8 Dec 2020 06:00:33 +0000
Message-ID: <DM5PR07MB3196275A203E9BD8370A9549C1CD0@DM5PR07MB3196.namprd07.prod.outlook.com>
References: <1606716983-3645-1-git-send-email-pthombar@cadence.com>
 <1606717090-3847-1-git-send-email-pthombar@cadence.com>
 <sq1q9262-8q61-7qop-9ps2-q5o6qo5q3p63@syhkavp.arg>
In-Reply-To: <sq1q9262-8q61-7qop-9ps2-q5o6qo5q3p63@syhkavp.arg>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccHRob21iYXJcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy1hYjkyNThiZS0zOTFhLTExZWItODYxYS0wMDUwNTZjMDAwMDhcYW1lLXRlc3RcYWI5MjU4YmYtMzkxYS0xMWViLTg2MWEtMDA1MDU2YzAwMDA4Ym9keS50eHQiIHN6PSIxMDk3IiB0PSIxMzI1MTg4MDgyODU3ODQ5NjQiIGg9InN5dDVRWUM3UVJ3dFE3bjhPNkpHaEt4Q2dOUT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
authentication-results: fluxnic.net; dkim=none (message not signed)
 header.d=none;fluxnic.net; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [64.207.220.243]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6250caef-ead0-45f0-85e2-08d89b3e931f
x-ms-traffictypediagnostic: DM5PR0701MB3767:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR0701MB3767235B811ADA9C90BEA9A7C1CD0@DM5PR0701MB3767.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1rn6ZsS/NXfid5RSKgtrC7pJFApCDAR25EV7XA2YUIstdirv0KcpdbW+pXhaJCyBrXvocoxR9yxxj6W4f6pfhSnwwFryEEXSgTdQCxPE4VdBizzO+a8Ol7BaqO9yj0KTzaYWFP6MXxtdQwaEe7T104oTk1E4Rn8Xj1wKEvMr9BR+SICxMKiWbHw5YmN5j45nhC1tcqOh5sJ0cbIMNRqq3BiuilnKpCnEamBPeG+UJuFXWF0mqrGpmjV6028qIFPP5FsfqnPdZWQgLiTmFj5lTQpREj0qK6jSXYxUh7rikOD9Vy5XlWdfV19z0d1d8VqpgA7uuViYFoDqkq53Lq3TLeyiajKqLPOYDhTWjgq0fMoR7Tp3lfu9ir12NNMpa3k0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR07MB3196.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39860400002)(376002)(346002)(36092001)(4744005)(2906002)(316002)(83380400001)(8936002)(66446008)(26005)(86362001)(33656002)(6506007)(186003)(52536014)(6916009)(5660300002)(4326008)(9686003)(66556008)(66946007)(7696005)(66476007)(71200400001)(55016002)(8676002)(478600001)(54906003)(64756008)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?kB0RY6GshAPOC4lmIE+RXVoC0hATSRFqPm7FS6Sqw1/h9E9mdloxdCLsOoFW?=
 =?us-ascii?Q?K/7uyuaR44mm66Ur2FW9s3kqh8drdqjsVdGSop7TofsQvmLDaw52KShyg6Ld?=
 =?us-ascii?Q?uaj87wJJ3KXeAjGtCH5r4+iW99Dn0HEOhlJ3Tsb4mRWhDHWdzcS9E9K5G2v0?=
 =?us-ascii?Q?GGKkZZASesiPD5MnDco4iNeZ6Emy7/DsXFyCipDptKogoKFxiQu+D1CxIXxQ?=
 =?us-ascii?Q?bFZQ85S1a2mrmaQVOTBma2ERKDyamRXEfv2aX8vi/qWPeAxEkSx6tJjdtEgP?=
 =?us-ascii?Q?VrATCTVOmJ2uKrVupUPJgw/kTj13emvyx4pv0sIwK7tbTLvH9DnY+0QbXZSC?=
 =?us-ascii?Q?T6pYMdcvQx04wNPFXhdJJrXEDI9sx7INh3zv+xd1TZr3Q/dohaPnEa+RO9m5?=
 =?us-ascii?Q?asg4x1NR5EqDVSJ4yTKfJgE8YoTnOvLYWYWuzCBacnDfXeJS0WzYAhvp62lN?=
 =?us-ascii?Q?H/RT8BeIB1D9QWlhDBKKgwYAh9/GNyuGPcObItT2VS+n58AxzilJTaRlA1uj?=
 =?us-ascii?Q?phvjWYd+5rElFo1n471bOjl/Kki3q7mj2bj3u9jfgR723qrgY7roNTkACVDQ?=
 =?us-ascii?Q?chVMfmZk4MHSMCINDbz9iOQT8sjNSQ/0JZFD6mJTdqCwO5vWUFrHhdgFw/pX?=
 =?us-ascii?Q?IKvO1N6SQD3jtlGFmk4G3bDkCz8Ks2KlaHrkUMzjLNURPg9dhjzS5lm0jJQ/?=
 =?us-ascii?Q?DI/LpVMf3STnXFkwHc1nDgIatjFXSIlk1WA0VHXroLaW5PeYfgdBXIBUwVdw?=
 =?us-ascii?Q?l8QU3RYof5XeMRG+d/n/Xf3nY2lVEf/SlbQpvsE6xEXiJAufAAe40xvdufAG?=
 =?us-ascii?Q?Vv2CjqKMblzCEman+pnAAywyD7wh34kK4V2yEKmW0iPHkZjCJP/fwxE36cIY?=
 =?us-ascii?Q?+wLcXqXccN3zBkBjbI2LzvtO8LtK4JzTegfbagPkjoRuLMydzVrhGCHKuisj?=
 =?us-ascii?Q?VKDb3cxRO2QfiHi8W2Y90hy9eImVlcno5kysxL+8ZpQ=3D?=
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR07MB3196.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6250caef-ead0-45f0-85e2-08d89b3e931f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2020 06:00:33.0349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BjQFL/55zyctixE73ayRs/VrA+k5Dzz0wFYNPJX334HEZRdnfKV50YMvUTjUNsF9cDa4EIjEi4h8JRyJ3A9lm2JaUfi+OJMkTtIRumT/TKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0701MB3767
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-07_19:2020-12-04,
 2020-12-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012080036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_010042_710233_2DF4280B 
X-CRM114-Status: GOOD (  11.96  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Milind Parab <mparab@cadence.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "praneeth@ti.com" <praneeth@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vitor.soares@synopsys.com" <vitor.soares@synopsys.com>,
 "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

>I'm not sure about the logic here. Why would the secondary master
>initialize the bus? If you make a distinction between primary and
>secondary, then the primary should be the owner of the bus and it should
>have enumerated it already. You should populate the bus structure with
>info provided by the primary master not from DT?

Here the bus initialization means programming HW for communicating over
I3C bus and initializing i3c_master_controller object, which is needed for both
primary and secondary masters. Yes, primary master is initial bus master,
it assign addresses to each device detected on I3C bus in DAA and broadcast
the list through DEFSLVS, which is used by secondary masters during their
remaining initialization. 

Initial approach was to allow secondary master to get information about
devices on bus from DEFSLVS only, but it was later decided that secondary
master should parse DT as well for any I2C and I3C device information. 

Regards,
Parshuram Thombare

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
