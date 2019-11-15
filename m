Return-Path: <SRS0=ua2+=ZH=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5835BC432C3
	for <linux-i3c@archiver.kernel.org>; Fri, 15 Nov 2019 11:51:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 298132073A
	for <linux-i3c@archiver.kernel.org>; Fri, 15 Nov 2019 11:51:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tRL87jsT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="Ebp4m7Jm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="ZymzHhRT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 298132073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+DnSIC80o/Vnb2zYEzVOIJxGnn4QyZ6ifUMTWkSeW8=; b=tRL87jsT57CSKS
	3qmkJpwZTTV9iZsu73w778GxOMPG514brqcbss0D5ibi7tm6RQy+G1+o0PXpUMhkGj2/BcPu4AbgD
	1QorYYlrYn7iZlBDSYvGT7a3Aq73zOBVVaS0dn1HqE6mgkrehLifaaMCw6feyxAUlRpL/1WRLkQyT
	Gov6ogEYiIOxafnVX4snnu5nrYu92RTeclPe3KyAgY2ILo/GGAxxck1sgubumk0jDwk1KAOTDbGaX
	Ox7r4J2pXUvarOam8d0MG5pep7UKZT7nbMu1HWEJs5fF3RJWwGigxRcH+52qPl0h04YPg1VOgWiDy
	qxDgM7h8PVqnQuNsWbIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVa87-0004DP-PC; Fri, 15 Nov 2019 11:51:11 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVa83-0004Cz-Vi
 for linux-i3c@lists.infradead.org; Fri, 15 Nov 2019 11:51:09 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAFBknlA002811; Fri, 15 Nov 2019 03:51:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=1fma9Qlt/y7g3997CANc3F0MQF/M//YxHufoso9IxPI=;
 b=Ebp4m7Jm1tu9QdQfwOKB0Vh3JBpoS7W9cGGtNbUxPXnqd9N3sbGZj2D6E9Mo64wdPbtO
 bzh0s6luM65ZwziFEPeF2sr0E45mLJGG3k0yR8XLBY4iONtj74kMyY4zgk5Q4OeljP0G
 v/kincZvS/BnVF8nFpiKhImg1HwXS8rM8T8V2Vv4QbE5smMWnlKyS0bG98tYcy8xMUon
 vMRd5gCQoOEOTKe7D7ns8sx+s5fyGdg9yegRN+SAM2Q+eGRHWZ5R91Tk/Ojl+FwptZdZ
 Qj2anNyMRBNrhHabD5wb9XC+7V+Cu9JKUG501/ucpxNuB2DwgUbZXpZqdl6076Eqf7Fw dg== 
Received: from nam01-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam01lp2057.outbound.protection.outlook.com [104.47.32.57])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2w9dqythbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Nov 2019 03:51:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXlxSdRzhNSZIYwEEB8+Si5lIEfUHpTqNbUxjbkXRqXN08xd6T5FP4bImba5xwr9ioBBdM3H75tcczz03ge0nNEiL24VzuY34ElEmdkH2Y73j0UX/DX/tmv3Ex462v2+9sG5a4g5kbGcIDRyLfmc/fy+P9MOVQtyN1w8yUzdeF2Dpdkg8wuu4BXszC6kFvmzdKmU1+P2jiplYw9o6+o+GFxz/FZ4xOrxjVyf+amDzQEnePxL8fgIu9vpMs0dM/m04qUn7ai7oSe+3601dOmBINxQVAQZ5mHvTsr2Z+jzT+1We/WnCdlv1H/MOQde8L1PMetByNOOhR50tLXSAhiFnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fma9Qlt/y7g3997CANc3F0MQF/M//YxHufoso9IxPI=;
 b=h28+gwxqOmNQOSZvuQDko4HqF90ZDIGRlgBJ1TId5pCLL3sOw3OBmPlFl4YNsCr7KthvfUvm860IrheG1cuDp9ga1VknJP9lhjOowjGwaz747rwh2/EuT4H5nFcX2afeWxSRR4wQPWIsPY+IRf8EOvtaKeYByJV52TGqBkMUfGke/YCyquVlDg3k8pYY1tedaAhrZSO/qV0GVCxu16TQv9PXBObPwahKj2xPSon5IhH4EAOPbFZ3eziiN+Q0KXh24yIM+48vyjaeun3GeAS+65afz0pQssdpEoMz+sCuJf7MV17Mh8y8OMytIK3mbj8n1ziXTIMorPeXmhZHTSCeHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 199.43.4.28) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=cadence.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=cadence.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fma9Qlt/y7g3997CANc3F0MQF/M//YxHufoso9IxPI=;
 b=ZymzHhRThUGbb7Xav9bDVGz//MWPWfkdJjgQD+JEj+8XEloBIouOosJVyuJyR3fG0OnQj3Z9Rn23mVh2728QPbSoenq9Cgjvf7k2d7svf7O5v4RTGCTF5uFO6gyKUiyJNvxlIgYX/l1mf+Dc4+/r6oI4WPqb9mwvFCnNXDSzg3Y=
Received: from BYAPR07CA0047.namprd07.prod.outlook.com (2603:10b6:a03:60::24)
 by SN6PR07MB5710.namprd07.prod.outlook.com (2603:10b6:805:e6::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.22; Fri, 15 Nov
 2019 11:50:40 +0000
Received: from DM6NAM12FT003.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe59::207) by BYAPR07CA0047.outlook.office365.com
 (2603:10b6:a03:60::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.22 via Frontend
 Transport; Fri, 15 Nov 2019 11:50:39 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 199.43.4.28 as permitted sender)
Received: from rmmaillnx1.cadence.com (199.43.4.28) by
 DM6NAM12FT003.mail.protection.outlook.com (10.13.179.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23 via Frontend Transport; Fri, 15 Nov 2019 11:50:39 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by rmmaillnx1.cadence.com (8.14.4/8.14.4) with ESMTP id xAFBoaS6026497
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Fri, 15 Nov 2019 06:50:38 -0500
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 15 Nov 2019 03:50:35 -0800
Date: Fri, 15 Nov 2019 12:50:32 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2] i3c: master: cdns: add data hold delay support
Message-ID: <20191115115027.GA11616@global.cadence.com>
References: <20191115062326.16476-1-pgaj@cadence.com>
 <20191115120555.53c1b745@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115120555.53c1b745@collabora.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:199.43.4.28; IPV:CAL; SCL:-1; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(376002)(189003)(199004)(36092001)(186003)(16526019)(86362001)(478600001)(1076003)(386003)(2486003)(7696005)(76176011)(33656002)(4326008)(26005)(50466002)(23676004)(6666004)(356004)(53416004)(7736002)(70586007)(70206006)(305945005)(6916009)(316002)(26826003)(76130400001)(16586007)(54906003)(58126008)(11346002)(956004)(446003)(3846002)(336012)(6286002)(426003)(229853002)(47776003)(66066001)(2906002)(486006)(126002)(6116002)(476003)(8676002)(81156014)(81166006)(55016002)(6246003)(8936002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR07MB5710; H:rmmaillnx1.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bb40dc9-152a-44e4-8eef-08d769c20925
X-MS-TrafficTypeDiagnostic: SN6PR07MB5710:|SN6PR07MB5710:
X-Microsoft-Antispam-PRVS: <SN6PR07MB5710D3DF31C61183C6759B1DC2700@SN6PR07MB5710.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 02229A4115
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OtIzUxDZ8rbbBmV9Vst5nUT2LpPha5eaLk0G9iyO+EiSiAcAXU6xCzG/49pYitUeSBmVYiIPeTBZM5DVrVdi1XbhqHnH9vm48tEiLpIx3GG5+k1RjN/oyo1voHWOJWBhIQ9a38Ne+6eOset/ovngVgNx8v4o4GN/3XUmmrqXcMEJL0lJGLnFzi/6F7T6TRqE83WLVgviruPw0vfQA+DmJj9jckN7sFDs1sGQrnU1+Mm6nVZ3ubbDKa4NsN/0hMmF/HDptcwKGxhtzaZARIHD/hWksukxFTbp/f/GvXvrwxSOgD7pJ1LDxTXFI2uxLpG9HSnWc0I2aW0gGk3gx7g4SS7LlcBvsveKqUcPqWX8GWlA4+r0OBN0E+g3iI/SppkV2+H30hGFx9hukjqHoGPzskiP21o8rQF6QsY0DMxyI7S5VrtP6zobUtjNVUmbnjJ3OAzT1U2PWaT3OAoaeYqtHQ==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2019 11:50:39.3602 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb40dc9-152a-44e4-8eef-08d769c20925
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[199.43.4.28];
 Helo=[rmmaillnx1.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR07MB5710
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-15_03:2019-11-15,2019-11-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911150112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191115_035108_164202_F784EF68 
X-CRM114-Status: GOOD (  28.01  )
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
Cc: linux-i3c@lists.infradead.org, agolec@cadence.com,
 vitor.soares@synopsys.com, rafalc@cadence.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The 11/15/2019 12:05, Boris Brezillon wrote:
> 
> On Fri, 15 Nov 2019 07:23:26 +0100
> Przemyslaw Gaj <pgaj@cadence.com> wrote:
> 
> > This patch adds support for THD_DEL (Data Hold Delay) to Cadence
> > I3C master constoller driver.
> > 
> > As per MIPI I3C Specification 1.0, Table 75 (page 142) defines
> > non-zero minimal tHD_PP timing on master output (Fig 65). This
> > setting allows to meet this timing on master's soc outputs,
> > regardless of PCB balancing.
> > 
> > Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> > 
> > ---
> > 
> > Main changes between v1 and v2:
> > - Add device-specific data which holds the thd_del value
> > - Remove device tree property
> > ---
> >  drivers/i3c/master/i3c-master-cdns.c | 37 +++++++++++++++++++++++++++++++-----
> >  1 file changed, 32 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> > index 10db0bf0655a..3531396f04fd 100644
> > --- a/drivers/i3c/master/i3c-master-cdns.c
> > +++ b/drivers/i3c/master/i3c-master-cdns.c
> > @@ -22,6 +22,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/spinlock.h>
> >  #include <linux/workqueue.h>
> > +#include <linux/of_device.h>
> >  
> >  #define DEV_ID				0x0
> >  #define DEV_ID_I3C_MASTER		0x5034
> > @@ -60,6 +61,7 @@
> >  #define CTRL_HALT_EN			BIT(30)
> >  #define CTRL_MCS			BIT(29)
> >  #define CTRL_MCS_EN			BIT(28)
> > +#define CTRL_THD_DEL(x)			(((x) << 24) & GENMASK(25, 24))
> 
> DEL is a bit ambiguous, how about _DELAY().
>

Yes, I can change it. I took this name directly from register map. As
rest of the names :-)
 
> >  #define CTRL_HJ_DISEC			BIT(8)
> >  #define CTRL_MST_ACK			BIT(7)
> >  #define CTRL_HJ_ACK			BIT(6)
> > @@ -388,6 +390,10 @@ struct cdns_i3c_xfer {
> >  	struct cdns_i3c_cmd cmds[0];
> >  };
> >  
> > +struct cdns_i3c_data {
> > +	u8 thd_del;
> 
> Same here, thd_delay. BTW, is the clk driving the I3C master clk
> expected to be fixed? If not, I'd suggest expressing this delay is
> seconds (nano or micro depending on the precision you need) so the
> driver can calculate the proper thd_delay value based on
> clk_get_rate(master->sysclk).
> 

Ok. I'll think about that. It is possible to change frequency so maybe
it's good to calculate that instead of hardcoding that value.

> > +};
> > +
> >  struct cdns_i3c_master {
> >  	struct work_struct hj_work;
> >  	struct i3c_master_controller base;
> > @@ -408,6 +414,7 @@ struct cdns_i3c_master {
> >  	struct clk *pclk;
> >  	struct cdns_i3c_master_caps caps;
> >  	unsigned long i3c_scl_lim;
> > +	const struct cdns_i3c_data *devdata;
> >  };
> >  
> >  static inline struct cdns_i3c_master *
> > @@ -1264,6 +1271,15 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
> >  	 * We will issue ENTDAA afterwards from the threaded IRQ handler.
> >  	 */
> >  	ctrl |= CTRL_HJ_ACK | CTRL_HJ_DISEC | CTRL_HALT_EN | CTRL_MCS_EN;
> > +
> > +	/*
> > +	 * Configure data hold delay based on device-specific data.
> > +	 *
> > +	 * MIPI I3C Specification 1.0 defines non-zero minimal tHD_PP timing on
> > +	 * master output. This setting allows to meet this timing on master's
> > +	 * SoC outputs, regardless of PCB balancing.
> > +	 */
> > +	ctrl |= CTRL_THD_DEL(master->devdata->thd_del);
> >  	writel(ctrl, master->regs + CTRL);
> >  
> >  	cdns_i3c_master_enable(master);
> > @@ -1521,17 +1537,33 @@ static void cdns_i3c_master_hj(struct work_struct *work)
> >  	i3c_master_do_daa(&master->base);
> >  }
> >  
> > +static struct cdns_i3c_data cdns_i3c_devdata = {
> > +	.thd_del = 0x3,
> > +};
> > +
> > +static const struct of_device_id cdns_i3c_master_of_ids[] = {
> > +	{ .compatible = "cdns,i3c-master", .data = &cdns_i3c_devdata },
> > +	{ /* sentinel */ },
> > +};
> > +
> >  static int cdns_i3c_master_probe(struct platform_device *pdev)
> >  {
> >  	struct cdns_i3c_master *master;
> > +	const struct of_device_id *of_id = of_match_device(
> > +		of_match_ptr(cdns_i3c_master_of_ids), &pdev->dev);
> 
> The of_match_ptr() is not needed since cdns_i3c_master_of_ids is always
> defined.
> 
> 
> >  	struct resource *res;
> >  	int ret, irq;
> >  	u32 val;
> >  
> > +	if (!of_id)
> > +		return -ENODEV;
> > +
> 
> Not sure ENODEV is the right error code here. If of_id == NULL that
> means cdns_i3c_master_of_ids[] is not filled correctly, so I'd suggest
> returning EINVAL.
> 
> >  	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
> >  	if (!master)
> >  		return -ENOMEM;
> >  
> > +	master->devdata = of_id->data;
> 
> If you do:
> 
> 	master->devdata = of_device_get_match_data(&pdev->dev);
> 	if (!master->devdata)
> 		return -EINVAL;
> 
> You can get rid of of_id (and the associate assignment/test).
> 

Ok. Thank you.

> > +
> >  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >  	master->regs = devm_ioremap_resource(&pdev->dev, res);
> >  	if (IS_ERR(master->regs))
> > @@ -1631,11 +1663,6 @@ static int cdns_i3c_master_remove(struct platform_device *pdev)
> >  	return 0;
> >  }
> >  
> > -static const struct of_device_id cdns_i3c_master_of_ids[] = {
> > -	{ .compatible = "cdns,i3c-master" },
> > -	{ /* sentinel */ },
> > -};
> > -
> >  static struct platform_driver cdns_i3c_master = {
> >  	.probe = cdns_i3c_master_probe,
> >  	.remove = cdns_i3c_master_remove,
> 

-- 
-- 
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
