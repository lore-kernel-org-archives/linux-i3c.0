Return-Path: <SRS0=Jgsd=LL=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DA9C2B9F4
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Jun 2021 09:13:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D118A613C1
	for <linux-i3c@archiver.kernel.org>; Thu, 17 Jun 2021 09:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D118A613C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yOamaUhgYK04m8Wud5q7kObi0oQa7CjsyOsqD4fIX5w=; b=r2nlZV4X+Mwqki
	IvWafPRtx65yzOI89faKqRNNzjP5RFZNLqQiF5Ol8s4pij/Gv3WkmXrV6TJU2swz+z445h7J5rZCo
	y1PLCT2dd6llMviP+2oGDsB2mFh26v67/aaaJf6tRqnKWAtZdgciukdkJ4GkZ2cn5fDeki3+lPL/E
	82mviDq6ldlYm+TUsr+gtWSpyF7HQd+MlJel74Lw8BEHDQCkeRhF93V43wPdjaJ0rCXjS8scdlOKx
	VWvoEiQ6MzG9dzVA0s0yS2aqj/CPjDmp7D+AFNo6kEzjiv4RdFfdv5ELHYjusrtEOilVKl83ZKxQa
	4ZJvyKon8uq0U671rKIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lto5K-009bwU-5W; Thu, 17 Jun 2021 09:13:14 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lto5G-009bvf-Q7
 for linux-i3c@lists.infradead.org; Thu, 17 Jun 2021 09:13:12 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15H97bKm015813; Thu, 17 Jun 2021 02:13:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=aLJRIvF23mKYK8BFKh5fmT5WPZZA4exKC2Y2PtbTqko=;
 b=tjSRsDYV6SyX6x5lGdJUxp3i0cBd8cXMZR3j1eK2okKPEsuV0YzqbXU59xLlB2aUVNxM
 5tzCV6fiJyci0Zq4eAr1RAORFHL/8HuJx7BlmnUUDEg16VyHnJ1rmcrjxDtCPR+jbde5
 HQhxKZqDHKis2dSMAo3sv3GLeGmulqbThLIY+RSs5+4VtctYiPkMmHkG4FRQoFnRRU+V
 UKboW6XItj00SD+cUHvqgnDdK8K59r9G2Hdw+jMtbb6vVYWwAU2lHh67UrUzKb/psW0k
 qAtt6yXrD8NVfGXddlsd1JxmxlBc9PVf6K86sKDJabZAIwiQ3PC9qX/8UtVfz/OLCrD0 VQ== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2042.outbound.protection.outlook.com [104.47.73.42])
 by mx0a-0014ca01.pphosted.com with ESMTP id 397ajd6467-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 02:13:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FxcQR9haPj1SLS521Kce7qDmcstjjSZNQbk4orrj3LUc0Jt0gsC3ItTU+q9Sdkgw+rXj3qvxzlwopdhJSFgbVrdE0Flm5vHsGSNr69yZ3XRTFw6Gj++pl83rQ9y6Bx2UB3FDoqUuITPUOMFHQiJF33Ja3gPmieQXWtPUHRYGcxLT92wwxMGaKon4nKwbJJZBfA+kemnC0+QY2j7Y1+cEQJDNHNg1u6ODOvwz7Bo3zmQtv7dO5lcdZIw2KJ9z3/4+12x7ADmecX8OvFX/XShiEgc69Ed9AgvDnB8GZB0Hp9xC9CCiU1PL5g3/ERa0Ax9qON9AKWG++xjsuUNAyUQyaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLJRIvF23mKYK8BFKh5fmT5WPZZA4exKC2Y2PtbTqko=;
 b=WaQiP2vayI3JvTYzyf6G2fisPCoegF3umnCyN8duwwv1wzxmfjV5mNCDYsJ+xi3rlrM/vKL3Bfv4p5c/figqunLqlcqeezEMjuRVjMB0Ko7HrxrF+UpIbndfkqMWFpeSv2VglJh0rsQaMzl5O4/lEPLgbM/kbb1P3K03n8zt18irHcfzZVBq1GnhO76lYF39fIuU6mN6QmT2u8/4h6Je+mwlX4mAeqJcEjzVa3AEaxYDkFYOg5RRh8qfGgI9r7/h3WVtGqmOuHbPNKx8RCXlC099AEWruVwgeynx6ZcpmDAaAi7mLbqI9G+uJy0pbIPSFndaYdf05NGjple1CbfxuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLJRIvF23mKYK8BFKh5fmT5WPZZA4exKC2Y2PtbTqko=;
 b=jn8jpo1ewGpFFuSnbZaksu6ygfARYyW+6kJEqIe522rds/iM3BvcIVsih03XjaJ5q1xp7BXxFdKCB20c0yuzKztcq6vQC08qBHrxstIyP+5ILLVLRGPNrnOwKV+iSnzTJui+rj+StCMGDQr9t0a1QB/Nv06muMM75rxrSuNSr64=
Received: from CY4PR07MB2757.namprd07.prod.outlook.com (2603:10b6:903:22::20)
 by CY4PR07MB3512.namprd07.prod.outlook.com (2603:10b6:910:75::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 17 Jun
 2021 09:13:03 +0000
Received: from CY4PR07MB2757.namprd07.prod.outlook.com
 ([fe80::4096:aaf6:cdb7:ba46]) by CY4PR07MB2757.namprd07.prod.outlook.com
 ([fe80::4096:aaf6:cdb7:ba46%9]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 09:13:02 +0000
From: Parshuram Raju Thombare <pthombar@cadence.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
 "vitor.soares@synopsys.com" <vitor.soares@synopsys.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Milind Parab
 <mparab@cadence.com>, "praneeth@ti.com" <praneeth@ti.com>
Subject: RE: [PATCH v10 6/7] i3c: master: sysfs key for acquire bus
Thread-Topic: [PATCH v10 6/7] i3c: master: sysfs key for acquire bus
Thread-Index: AQHWxuDh12Y7IqfMlEOh9hbglXG+fKsL75kAgA0zb6A=
Date: Thu, 17 Jun 2021 09:13:02 +0000
Message-ID: <CY4PR07MB27573869D366E84DBD1BF854C10E9@CY4PR07MB2757.namprd07.prod.outlook.com>
References: <1606716983-3645-1-git-send-email-pthombar@cadence.com>
 <1606717202-4206-1-git-send-email-pthombar@cadence.com>
 <YL/+RvUEqniqcwRt@piout.net>
In-Reply-To: <YL/+RvUEqniqcwRt@piout.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccHRob21iYXJcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy0zNTVkYTk3Yy1jZjRjLTExZWItODYzMy0xMDY1MzBlZjIyZjVcYW1lLXRlc3RcMzU1ZGE5N2UtY2Y0Yy0xMWViLTg2MzMtMTA2NTMwZWYyMmY1Ym9keS50eHQiIHN6PSI1MTkiIHQ9IjEzMjY4Mzk0Nzc5NDgyNTU1MCIgaD0id1pNVTB5YWRzSnVreXM4R1kvZXZXaFNDSXlRPSIgaWQ9IiIgYmw9IjAiIGJvPSIxIi8+PC9tZXRhPg==
x-dg-rorf: true
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [59.145.174.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7310d45c-a9db-48e5-2589-08d931701c3f
x-ms-traffictypediagnostic: CY4PR07MB3512:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR07MB3512A1C939B8634156E95ECAC10E9@CY4PR07MB3512.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mEeUEU+/fXRlJYPaHWM+NrE+EFgj+lHvMl6ZTPKYC2Xi9G80YatV0ccHs6KENUvCsW5W6kTgeKEFuIMCSzChg8dvoWiCrzlqQG75Tl7kqVUab6P9x/v6Fn6xlqjV/mPekCkPDn9KvRrKje4CFmMgkxU/XmEpbDtDoudeC6X4IkWs+CuSdp4fapAdvpVKCbRI8RnWee9fQd7Coufr+SVLg5gxI8zW4+jJmwUl2q+QwL8mQYeOlCem77jlht+WVmf5OErJDWVhlfH6O8DrOY9bbvl3fCB9TTYZrLuEbb3hIoF2EG9Lx4/XgyQ8AUt2ztIy/T6wjvP/3xWupe1QvfhpEczbk1q2tp9kJ1gx1/UgT9RShSz9xuhZkrWP5Hd9GXjLlzC708j1ygBC9AqBABS1G3NcVNSFuoyEnpDEyGMV4SQBv1Be+esh1+3o9pORgJOkV6VEWZpZja9veFNOB5NxE+vIEBsSEt15T+f9Wpzr70o6CecYNNsztZHXDQumMkdfHkZA2ID2UVlB7ZLR9WcnDc1TVxo3dXnVT6E9tC60Ils2C79qxu3hK3vtFGnfRwIWNOOXmZgNsSLyxpVaFmt2pRSLXDaD0UgKL5FpsIfbsiebPiSqiTkcXQhDBCYfhb/pxwZ+J/chbUhnPNJISBM8mg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR07MB2757.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(39860400002)(396003)(36092001)(33656002)(66476007)(66556008)(66446008)(66946007)(76116006)(64756008)(122000001)(316002)(4326008)(52536014)(71200400001)(4744005)(478600001)(83380400001)(38100700002)(2906002)(8676002)(5660300002)(6916009)(86362001)(6506007)(8936002)(7696005)(9686003)(55016002)(186003)(26005)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eRawhxPFun4DX0r2SD9yNcVk3zfbvApyqrCaVLWZ7gGvuj6h/i++MDYa1O+Q?=
 =?us-ascii?Q?kOyUM0FAh23PV1xT15yFXgIlLPW3QLkL/NhEmftdgGFoMOSNAvSUOorjMCeN?=
 =?us-ascii?Q?+xK9V5W0wLSbMHfCfVPKCb21EMwUxn0fGcII8FlwX2KiBlUzRYYlXIxdtD+z?=
 =?us-ascii?Q?ZKkFA2SOh0SWIPqZ/FmaxHtxFmp8UO5PPHCyel2udxJ0I0Ujvar+37MTC8cZ?=
 =?us-ascii?Q?0ZH2bRF9z1o//1MkayaCukLjjS0QgeGzAhQHuM9dZ45gCf6N+/NV1nml7FBY?=
 =?us-ascii?Q?ctYvei7oG7DYxi4Esetd3Nmg7lQwyPBu8Kq2VC7hlDdvaW9RdteIA7YvqCig?=
 =?us-ascii?Q?cnUcGVjUZExFBbJdy5jYtG166Lq3WVZ6FKzNs2uoA1kf7jyXcXvQb30nk1c7?=
 =?us-ascii?Q?cqb+d3buI+qBBO08ZQxeyUGQ+O2CtdpdQocsAck20LOAwGqvZqv8Se+ayx4W?=
 =?us-ascii?Q?OSgnSFs2mwlr9xsELY2h+bwHDy4eGQd3D8i+Y5SZnUaa8TbZwokKHNcI6P2P?=
 =?us-ascii?Q?0pPO74D530BiiYpltKOToDxuRqmOrAcK+ifAyrCjw4/BvQGpBZDZAgSyAa2q?=
 =?us-ascii?Q?Py8cW7OxfvBFTFY2QSOQVNPE9/BGNe73Qj0oV0i/CIkYzJE7xsQqTRx1PJdP?=
 =?us-ascii?Q?swNOcoVim6HU+d961EStZI0vogXSVkltKrHqjDUeYHNadzHiYMQGVHk+cGXE?=
 =?us-ascii?Q?X2QoqlRk/6vcXbWJE5byZpCOVUxGz9hEiL3/5NJW78Kx4hf2doiOlVb1QHpT?=
 =?us-ascii?Q?mZXi17oSquRAyC0tCRSkZUILrR2PypjX+Du15nmT6jpUnR6UxvKsXK+dxKv0?=
 =?us-ascii?Q?7MVMmUPrKsjnTAy0m0qs+pjbokf+uVzawkj/yGfyGp87FR9XQ9GdwawMbF+n?=
 =?us-ascii?Q?NdfZjsJ3Xem5cDeFJRZoUo8YJ6SkAfFIDaAtwrRys1Zig+bRiT600Z9NKnyC?=
 =?us-ascii?Q?dRvSUvNCeSNV8eyKxUS5iyo0CaMEHhKKZaN0imzTeLlg4/1yQpHlioGhsLlm?=
 =?us-ascii?Q?pLVCBDorY5vyFsbRXctU5MJclFx3iqWzyr56TTCMhdFx7RP5AsZjsAd1rFD5?=
 =?us-ascii?Q?HxvIe0yz4qPVMVUURKPYwcBkWajiDjjGH6UnjYv4q5OEka3DI8YZFW58jFjX?=
 =?us-ascii?Q?hgee7JGHKZHf9VmTOHS3RwTT7QVNnsCI9jvWDzS1wjmYlxouFxvJGpKiLkhB?=
 =?us-ascii?Q?hCJYs8dvdJYbINsSDjFXNKgX4Pd2J0u7q8FxB6OcNcaaLp71QbEBpCXH73jQ?=
 =?us-ascii?Q?UUe4ivIBRPeuc5l8pusUWAc5u07/K0rIRQYtJMYFtoikq1sJPAEhU8HQqouS?=
 =?us-ascii?Q?yask/QBamLO65B4AlkTDG6uB?=
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR07MB2757.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7310d45c-a9db-48e5-2589-08d931701c3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 09:13:02.6385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zC2WGazf+d9g4p61TeaRpGshgRX6UmTpPNXcLlvlKkytKXJqKJqswKrqqXrGLa0onP0cWfu2k8Q9FGrTEHSorog9jwMoHiAf1uU6mOaWLsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR07MB3512
X-Proofpoint-GUID: UASfbYiK_SYS8cqJ38WSwsMecUlCeZxm
X-Proofpoint-ORIG-GUID: UASfbYiK_SYS8cqJ38WSwsMecUlCeZxm
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_05:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 suspectscore=0
 spamscore=0 mlxlogscore=763 lowpriorityscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106170064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_021311_180907_41E0FA25 
X-CRM114-Status: GOOD (  12.60  )
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

>I'm wondering whether we should allow userspace to actually control
>that. Shouldn't we simply request mastership when a driver needs to talk
>to a device on the bus? Is it really useful to have that until there is
>an i3c-dev userspace interface?

Yes, for now it is useful for nothing more than triggering mastership request
from user space. It can be dropped and added later if needed for i3c-dev
user space interface.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
