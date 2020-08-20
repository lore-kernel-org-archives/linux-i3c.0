Return-Path: <SRS0=A1g0=CB=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C2AC433E8
	for <linux-i3c@archiver.kernel.org>; Sun, 23 Aug 2020 09:47:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2969A207C3
	for <linux-i3c@archiver.kernel.org>; Sun, 23 Aug 2020 09:47:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nhrtj7ID";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="pcs1LUlT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="OYWuB4h8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2969A207C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s3fzM/rJL0ux281Jlgx+0N+I4wPLSBeI+8pH6eP3MVM=; b=nhrtj7IDhjIDkQO2+r3MZ5YIt
	SJ2Aj4BDlOkB2cGLS2cPxIQVSPY3BaZSWV1yQVQIa5rJ3e2tVIqtB5TeTzeJ2MuIkrJb0DXOqYHsM
	6eaR+TzFP+L1Anpi+70SYwQvt5Ckp5iPrHAeLvHtMTxjJttSLw1nBjeAsIkukT8b5zA1ULfFDRPoK
	b3L2a6/13rjZGogCUrwafsSBsQHjGmuIvgCP2N6+qj77A9rOsqGHJy4mlLVZUCxFM73hfCFs1kDZ/
	/sGAebRAKJQ6Je4sYcGml2ZdZGiismnNf1kNXnLGQi9XC6Yh7kbploc61Ll8lJMGyPQ/eA2KPtRxH
	NKHXXhf1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9maf-0001k6-Ix
	for linux-i3c@archiver.kernel.org; Sun, 23 Aug 2020 09:47:05 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8p6s-0002SW-T2
 for linux-i3c@lists.infradead.org; Thu, 20 Aug 2020 18:16:25 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07KI7C7C026113; Thu, 20 Aug 2020 11:16:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=XI+SoE+86c+vGhkAGNLKZkNuIHK22AOEWF3luOvPdR8=;
 b=pcs1LUlT0wMr+c52TbfawVxiTqXfR0ruQum9in6cvJ3rGV8AHLPL42fKOL05XX14M48D
 jtJV+dyQ+YagPRGU4oxIuYIqkM2tvSLZGtZb1TSRIGTWARjXg9iAV+DhHL1/nZ10ooTd
 l+bEfp+4OdnBiO34FO7OOIe3je4zYCiiu6YE1UR4WQzIy3PnBeYvwV2MctKasUEqzqn6
 4yAHNT94MV2qAWs0nswxZYCc4D8hsovf8ZqZMi3Vf/61IfE0eUxJaFXlMqlcnoJa6jA/
 ZJLS9OMNzVW3hAguElv4lZeQSMBqAM676EF5xmgLvSO9s06ikc160JYWVohPf9fdx/uM aw== 
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2059.outbound.protection.outlook.com [104.47.38.59])
 by mx0a-0014ca01.pphosted.com with ESMTP id 331ctjue3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Aug 2020 11:16:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJU+L/rPrjlWXJb3nA/RSEcPHkpi3tdlMZje4oiWDGj6dGpOlcLyYstA1w5JGFFfYgDQsgiDRijaQ0S6ZbGcICP9IzFqK78QIRwX0emI0mdxVnsTbIfI5eKC6uU03giDt1e3kxHoU2WqrDWvPUnMaAGafTAECfGwqqv9+tUzSbn91Q6/uwy3vdAfxPLtdG9ohKgA3ZGyvOtEpaNr90+NVhVuwNlOrQg/Faa2Sg8P+xDhJnx5qpVJSFvUQTWJOzJDuFbDObg3vnPrMkfyE5gavuEiY08BOykC44eukVyxZs61XZo9TCm/8M7hni8jBJZnRcnbVoY9z2+5o6P0PQLkGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XI+SoE+86c+vGhkAGNLKZkNuIHK22AOEWF3luOvPdR8=;
 b=VbwCDemM4nDJsYewskdQkCzCu7oxoFjVP2kZcaAK9AuzTiOIAhxrQglJ7rtG5gj+jzxxPO6jZrmwg8Kt8Gfv5UqJq2JmvcXfgTsuEu7Hu6JysymfAjyCkqXYzHel9FjvgfT96udOnZvejBpwEfoMlCaByxfcp3pKuw+bO/PMjo0D/xiHaWADpHlp4SKM1QmJK7WB0O4EdP/j5OUIycbAsZm3VpBkKaLCsgfKvbpehm/TAKqd5oKmohhRNecDjC0dZWs0SZKsrHFYoHF8tJApZzThYaKkiYoeqKfTLav6VXX3ziODQQmtfVGLSF3ZRXsvrln5bnZbFq47Z5yNSoykYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XI+SoE+86c+vGhkAGNLKZkNuIHK22AOEWF3luOvPdR8=;
 b=OYWuB4h8DEDX2MgpoQSANk8ykS2ULrU3j4QCHK2IS2O63+sDgyffu2l8/1gJ1ES1Vwf4K9u4mPbhQnUd6MHlPDmc7iCm0PNoXN322wSEMCl6JNd8Wpk7Uh8C2VNsPAc73PgxAqxZUsc0ooqV3PCIh0R0ngefxJId5w5hzZFpgjQ=
Received: from DM5PR07MB3196.namprd07.prod.outlook.com (2603:10b6:3:e4::16) by
 DM6PR07MB6889.namprd07.prod.outlook.com (2603:10b6:5:1f0::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.25; Thu, 20 Aug 2020 18:16:14 +0000
Received: from DM5PR07MB3196.namprd07.prod.outlook.com
 ([fe80::fcc9:65c7:8aed:f107]) by DM5PR07MB3196.namprd07.prod.outlook.com
 ([fe80::fcc9:65c7:8aed:f107%12]) with mapi id 15.20.3305.024; Thu, 20 Aug
 2020 18:16:14 +0000
From: Parshuram Raju Thombare <pthombar@cadence.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: RE: [PATCH v3] i3c: master: fix for SETDASA and DAA process
Thread-Topic: [PATCH v3] i3c: master: fix for SETDASA and DAA process
Thread-Index: AQHWdvc2nK9xkXfr/kODGwYfmmKGXqlBE/UAgAAwIfA=
Date: Thu, 20 Aug 2020 18:16:14 +0000
Message-ID: <DM5PR07MB3196085F8628478E7E2F5FC8C15A0@DM5PR07MB3196.namprd07.prod.outlook.com>
References: <1597930706-15744-1-git-send-email-pthombar@cadence.com>
 <20200820164820.4fec97b3@collabora.com>
In-Reply-To: <20200820164820.4fec97b3@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccHRob21iYXJcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy0zODhjYzRjYi1lMzExLTExZWEtODYwMS0wMDUwNTZjMDAwMDhcYW1lLXRlc3RcMzg4Y2M0Y2MtZTMxMS0xMWVhLTg2MDEtMDA1MDU2YzAwMDA4Ym9keS50eHQiIHN6PSIyMzcyIiB0PSIxMzI0MjQyMDk3MDM3Mzk1NzciIGg9InFoR2E3L3VwL1g4RXptM3dvM3RDRmxYTDdEOD0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
authentication-results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [14.142.6.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: edd1027b-ec3a-4b0e-a9de-08d845351fe7
x-ms-traffictypediagnostic: DM6PR07MB6889:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR07MB6889E71C13AC3D2428A41031C15A0@DM6PR07MB6889.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nehHH9l1BsTyq8a4Vwp+ZD74LK8wJRXrBsYVmauHBIetMod94HwvfrbgRUqsOfXttIYPjtGc5d3w6vwuXDS2Uusssxn5Lat+vm5sphgwBh2e1crq7X0+R4dyB06i1Jg5g027QCF5xvW3D7SN9cXfRSgoY+5WmM16gaZCJwJFcoLVO3Kw92dykVx7jzoNmCzLtANSC7HURYFvTVAEpwTbtJN5YJ7g0nDY+Yg6qADKA23SF1jzpMGrQnG6/ojJtPu855rI8cGFf4/61sO0Ztn1tL0jNgV4G/DHPlXBiX6j4t5U4qaGndAMEocZ8QzwQnfRrA/heklbEaJtIElsRAsxddevfFa+s0Mg+VSvJEBkkd1Edc3uhJimsJvqEf/gwuxq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR07MB3196.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36092001)(33656002)(71200400001)(186003)(86362001)(55236004)(2906002)(6506007)(7696005)(26005)(5660300002)(9686003)(54906003)(83380400001)(55016002)(52536014)(498600001)(66946007)(66446008)(64756008)(66556008)(66476007)(6916009)(8936002)(4326008)(8676002)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: OPadP+ms3bO3syvp6BYgnT+A7MkjsP+DNeWFSjglmxPSWtnMQP9alQqla0yJ1VjxvMEoiQ/erseumX4vIzP4KDKehIytXoUCKXuDwC0JJYvckpC4yQk6I17u8GrRJfmDeCwiQTYCUjWqNKfvMhdQ7l5HL0oAxhQ8gjjCIcrbKBrM+fSoIJopoJ9I2e6ASduKtuJNO0aCMN7lXoqhD+s+WI86F5OzQBUaaF/izMa5C53xvvuN8codzU0kNsIiPDJ/VD0lLDTjoVSPGUdUD4W4ccRev41zWDKBt7KZm0jDLFZd1EdpRLDP3FW1riEDJRa9KKXDkMVs6+C/4KgouJuLiJxWZW47e2ZESl6QPSBQx0vetMeXznR+rM8XJyhkxgzuGzDQgr0iZBAy8fXH54euAYQL9zC2JUc9zYJYGmv3D8dyIAPWsLvWAHYwdHDddnxgkMjClUjZ+/QHJ0mHyjsmcmrzZ6L7UabDkOXE18l71c07EtzVDXB6UCModXLEIV1IA0/ESflPae71+zgrOFBxcXyFchHZc8rGx082aX9Dj8bACEcBgXCJuJts/hNdGVIWP+g4Hd9i7SGj3giu9HGKyQgLDREfjaaHgqcpr2UoJlLwMIGICoQOS27NpwCX236ottKJEQqCvWuphV2ym9BEuQ==
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR07MB3196.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edd1027b-ec3a-4b0e-a9de-08d845351fe7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2020 18:16:14.3004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d1s4t4748iJ6B/Cj7NlX/uey9spPXWH25pS5XedNWZIk0lEqpAYgxt3aaMkFxLwlOPd4S6zsvcO45EnG1XMI7QmNMa9GI4zM/ClpFW6NyYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB6889
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-20_03:2020-08-19,
 2020-08-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008200147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_141624_062989_3FC8343F 
X-CRM114-Status: GOOD (  19.37  )
X-Mailman-Approved-At: Sun, 23 Aug 2020 05:47:03 -0400
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
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "praneeth@ti.com" <praneeth@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vitor.soares@synopsys.com" <vitor.soares@synopsys.com>,
 Przemyslaw Gaj <pgaj@cadence.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

>Hm, not sure that qualifies as a fix. The current implementation was
>correct, it was just reserving a slot in the device table for devices
>that didn't have an init address or on which SETDASA failed.
If I3C controllers like ours use hardware slots to store slave devices info, 
due to limited available slots this can cause issue. 
 If some slots are lost due to
1. only init_dyn_addr and no static_addr in DT 
OR
2. SETDASA failed
at the end of DAA some devices may be left without dyn_addr allocated from master
and hence can't work properly.
I think during our discussion we recognized this change as a bug.
That is the reason I added fixes tag, but if you think otherwise I can remove this tag.
 
>> -static void i3c_master_pre_assign_dyn_addr(struct i3c_dev_desc *dev)
>> +static int i3c_master_pre_assign_dyn_addr(struct i3c_master_controller
>That function now does more than just assigning a dynamic address: it
>also creates the i3c_dev_desc. It should be renamed accordingly
>(i3c_master_early_i3c_dev_add() maybe).
Ok

>You should reserve the address before calling
>i3c_master_pre_assign_dyn_addr():
>
>		/*
>		 * We don't attach devices which are not addressable
>		 * (no static_addr and dyn_addr) and devices with
>		 * static_addr but no init_dyn_addr will participate in DAA.
>		 */
>		if (!i3cboardinfo->init_dyn_addr ||
>		    !i3cboardinfo->static_addr)
>			continue;
Don't we want to cover the case when only init_dyn_addr is present ?
I am not sure if we can't have init_dyn_addr without static_addr.
May be what we need is 
		if (!i3cboardinfo->init_dyn_addr)
			continue;

		ret = i3c_bus_get_addr_slot_status(&master->bus,
						   i3cboardinfo->init_dyn_addr);
		if (ret != I3C_ADDR_SLOT_FREE) {
			ret = -EBUSY;
			goto err_rstdaa;
		}

		i3c_bus_set_addr_slot_status(&master->bus,
					     i3cboardinfo->init_dyn_addr,
					     I3C_ADDR_SLOT_I3C_DEV);

		if (i3cboardinfo->static_addr)
			i3c_master_pre_assign_dyn_addr(master, i3cboardinfo);
IMHO this is functionally same to what I sent. Just that init_dyn_addr is reserved before,
and we leverage the change in reattach to bypass failure due to second attempt
to get init_dyn_addr in reattach called from i3c_master_pre_assign_dyn_addr().



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
