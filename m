Return-Path: <SRS0=pqjR=ZU=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD5AC432C0
	for <linux-i3c@archiver.kernel.org>; Thu, 28 Nov 2019 12:58:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A6622176D
	for <linux-i3c@archiver.kernel.org>; Thu, 28 Nov 2019 12:58:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="byCxxUSx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="XSutvN1G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="xgP29+Fx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A6622176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SFyDGIVIS397pYsoB+sm1cVqJ+zx9BLMtDJrByuNAyA=; b=byCxxUSxdNt9AX
	YXr+HELVghdSeMY9HMrNz19zWCaYf0WVv0SKjwZEukaxMpJMPTI8Z5fT5FSyogjlZMvzvN8RBCr7X
	Od0Bc9fC0zE8uylwEnH+NeBPyvDvoVoi8HZn9/qITjFWzD8yF4R0ixoCe740EAs1U1nkp48JiovDX
	UUEOJtULsvFOF3bXREO2KnUJ9jbSBVhSLLJQwo2AhtchHUrCfD8AXZcXRL1SynsxI96OgwCbVkzV8
	O5W+vuJACT6VnrAqHTMezR3+4xbgt+fdsCJyolg9LbTYZ9QkjIjxZ+ewAp71Hv/Zgq3MajMlRz8Br
	cVadXF3swVAKXxR4qciA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iaJNG-0004xi-BN; Thu, 28 Nov 2019 12:58:22 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaJNB-0004wy-Iy
 for linux-i3c@lists.infradead.org; Thu, 28 Nov 2019 12:58:21 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xASCvJ5O003209; Thu, 28 Nov 2019 04:58:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=2NK5ODDN/YaLStyu7mKUv88hasTvsSF7ElJeBJsVi2o=;
 b=XSutvN1Gihjhcpb3uQ1UtwI77VCkbqdy6+x3YJHqLJlw/oO3fcZKALZYUN/0d9ZTy5zR
 PMAgDqcPpn0ouet6jWRKRZczIrqXv8CF5lQNWXpvE9QlomYW+aeZJ3QjCgbl3gGSExgF
 z0pxtkJBm5+gukBAP9R4L7m3MAMXsGYJf6UhbCMEi3r5Mxi87oUDypeY3pgT8PmDRZFF
 PtpgMSXFsaYvtgXpz17kTNkQq86C/Rhgpjf19Xh6K9PZ+SK6UaxQVBfSkAEnBa+mmFVH
 e0kppfEnJhFl4DhpOc6ig0VXR7GLWgVbTopYjhpVJuPkSYfLW0dV43cCXCm+NB/YxTyL vQ== 
Received: from nam04-co1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2052.outbound.protection.outlook.com [104.47.45.52])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2whcxgra2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Nov 2019 04:58:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGUnbjTLXUqNHyogK4t8gCFQDe1BzKxFS5q1WuHuCp/yd8MLONZTnjW9E+AlphplM7HXrSmVNU2iAsSlz+NGPLn7YQ0+gaJU3NpzsDzKi44P2yWzDA0FFOiytQvFf8JcZalWsiUeoEnofmhdonqzVWS6/l1f+HbBakX5y4z7TcpHJk66OR2boYRDqVzZ7E9DiF3OpDvVvy+pjuIK+vgb6lqwxA+gwXFgyIFlFkfd5hPinLxgIQcZ4N7EDvSon1KPpUENT0JTb+z0BONM3CF9tMzfy+uXf9X5TQAxuQZI91K5WVYcz6LX5X76pECB91YKdKv9uKcoZ1sr5dw2NDtlDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NK5ODDN/YaLStyu7mKUv88hasTvsSF7ElJeBJsVi2o=;
 b=KELCWvcXsOUYx7vKDvEItSyOPmRTAths+gZWIfbRBvMZspDZ2sKIgSUGDIXyF0vOv4zTl0MQQNgcrJhwbaGC0VoKLyxwA0bT/Lxq7+zFHC3Us8w/zBbbMP14wPx/GdW46UmoRVCb9tc/6DEwIuKMHZEHk4PC4Udl10OLp6uqVKWr4vUhlOdIIzMs7FRtgcVV5H2Gp9vFgPiTwD9iBw39D5KqlkuypuBdkJ8+NS5ZMrt0ZfxyfuB70M5ei6OKKBjP1MLlBngdi17JCaAMyEflTZxqruMMMJhOIEJj8vSMdSiddSoARhB2wodTU+MhZTnTRyUJ+c4L+fOzgzzh4iRmcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=cadence.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=cadence.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NK5ODDN/YaLStyu7mKUv88hasTvsSF7ElJeBJsVi2o=;
 b=xgP29+Fx1eNeTUlqQsJplZR2VFIfBwIozvvkCdqjANme7R4aad7V/RydJeXUJRVobGRrc/3GI2eOiBPlg34w/KGvoMmjRdbymzR4egaYibAE9QqDv8q+BuNZeKH447KJmOD9hQIK+qeERTI0dLH8YuIMCidNPhGwiw5wBi3Q33g=
Received: from CY1PR07CA0010.namprd07.prod.outlook.com
 (2a01:111:e400:c60a::20) by MWHPR0701MB3643.namprd07.prod.outlook.com
 (2603:10b6:301:7d::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.16; Thu, 28 Nov
 2019 12:58:12 +0000
Received: from MW2NAM12FT010.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe5a::207) by CY1PR07CA0010.outlook.office365.com
 (2a01:111:e400:c60a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18 via Frontend
 Transport; Thu, 28 Nov 2019 12:58:12 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 MW2NAM12FT010.mail.protection.outlook.com (10.13.180.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Thu, 28 Nov 2019 12:58:12 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id xASCwBsg031307
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 28 Nov 2019 04:58:11 -0800
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 28 Nov 2019 04:58:09 -0800
Date: Thu, 28 Nov 2019 13:58:06 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [RFC 1/2] i3c: Add preliminary support for secondary master
Message-ID: <20191128125805.GA11351@global.cadence.com>
References: <cover.1574897246.git.vitor.soares@synopsys.com>
 <a9466e3de90e1aae1111a17bbbd08311e7bf87c3.1574897246.git.vitor.soares@synopsys.com>
 <20191128055007.GA11250@global.cadence.com>
 <CH2PR12MB4216CDCF7713E8F8929E66FAAE470@CH2PR12MB4216.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR12MB4216CDCF7713E8F8929E66FAAE470@CH2PR12MB4216.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj6.global.cadence.com (158.140.32.112) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(199004)(189003)(36092001)(6116002)(7736002)(7636002)(356004)(5024004)(305945005)(3846002)(14444005)(16526019)(336012)(8936002)(16586007)(6246003)(76130400001)(316002)(4326008)(2906002)(54906003)(8676002)(6666004)(66066001)(246002)(6286002)(2486003)(23676004)(5660300002)(26005)(7696005)(186003)(956004)(50466002)(55016002)(58126008)(47776003)(478600001)(446003)(53416004)(426003)(11346002)(6916009)(70206006)(76176011)(386003)(70586007)(26826003)(33656002)(86362001)(1076003)(30864003)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0701MB3643; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.Cadence.COM; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ac63d2e-93d5-4d6a-286e-08d77402a029
X-MS-TrafficTypeDiagnostic: MWHPR0701MB3643:
X-Microsoft-Antispam-PRVS: <MWHPR0701MB3643E7A20636A0E680DE8D21C2470@MWHPR0701MB3643.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0235CBE7D0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gm4yfUeRX35FEiTK29P1Byi24MlhCnlsawCfTtufeNj2fHLegrGkopn1aLqkWpaJDcbLxEhLwjTr7Q/KVe8ZQL4bgAfbpQXhFxnaUCAF623MiTFyjlZyPiE5SW2dgQMKx0gxuL5damNF/JbAi341ETsecGgNzvJT5hjCrCTuqqnLp6XJpUw04/BzeInyHCmfpx6QYJqgAGSWjBOySaz4e/YFRcyX5nJijmOn4umx12bUXVCSDzi7+qT15nmAvh9iApIpAqiXXWAja/Q/aGiZH15swrDxbW1OfYUR7kqwOdUJqbXNRfn5+lRbjYHgGlCdshZx+PYwO4oHCETeMVTQQbaHrlrnBZrQkQhU+7OCQMSV0J4h4QMsMqdKQiC8blceZJFgeUCgkgtEDcXiCOe4Oq08nd2yQTpgv58ayQXk+e1NGHxVcDppS1Vb8Ki0OkKmhE72kl2bYbhbNtErmLXjEQ==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2019 12:58:12.1272 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac63d2e-93d5-4d6a-286e-08d77402a029
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0701MB3643
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-28_03:2019-11-28,2019-11-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 mlxlogscore=999 suspectscore=2 malwarescore=0 phishscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1911280114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191128_045818_199132_B0C1AE36 
X-CRM114-Status: GOOD (  31.47  )
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
 Joao Pinto <Joao.Pinto@synopsys.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

The 11/28/2019 12:20, Vitor Soares wrote:
> 
> Hi,
> 
> 
> From: Przemyslaw Gaj <pgaj@cadence.com>
> Date: Thu, Nov 28, 2019 at 05:50:08
> 
> > Hi Vitor,
> > 
> > First, you woke up my son and he couldn't sleep the rest of the night
> > :-)
> 
> Sorry for that.
> 
> > I appreciate you sent that so we can discuss it.
> > 
> > The 11/28/2019 02:15, Vitor Soares wrote:
> > > 
> > > This patch adds the preliminary support for secondary master feature to
> > > i3c Framework for testing purposes.
> > > 
> > > Key points for consideration:
> > >   - mastership_[show/store] are only used for testing
> > >   - secondary master registration is made in two steps, one in
> > >   i3c_master_register() and another in i3c_sec_master_bus_init() when
> > >   secondary master became current master first time. This is made in this
> > >   way to get all dt declared boardinfo list, create defslvs list and
> > >   provide work_queue.
> > >   - When the current master wants to deliver_mastership it necessary to
> > >   disable all in-band events to avoid unwanted interrupt during bus
> > >   ownership exchange. For now this patch doesn't reflect all
> > >   improvements/changes made in v1.1 I3C Bus spec. But it can be extended
> > >   by adding some commands and checks to the flow.
> > >   - i3c_defslvs_info: The DEFSLVS info can be differently stored in
> > >   diferen HC. Hence it is used a defslvs list similar to boardinfo list in
> > >   the bus structure to hold this data. Them HC is taccking over the bus
> > >   ownership can initialize each device of that list. For now, this not
> > >   address the i2c devices since they are only statically described.
> > >   - [request/deliver]_mastership(): Mastership request deliver may be done
> > >   differently in different HC, hence the need to have a call back for each
> > >   process.
> > >   - Add dr_mode to DT: Similar to USB, HC can be programmed to Master only
> > >   mode, Slave only mode or Secondary Master which aren't necessarily
> > >   hardcoded.
> > >   - bus_mode definition: The bus mode is defined even without defslvs
> > >   information with DT info since the definition of i2c devices are those
> > >   that have impact on bus_mode definition and need to statically declared.
> > >   The only use case that may cause issues is when i2c devices aren't
> > >   declared in secondary master side and bus mode doesn't match the
> > >   main master. Anyway this can be solde without extra complexity.
> > > 
> > > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > > ---
> > >  drivers/i3c/master.c       | 365 ++++++++++++++++++++++++++++++++++++++++++++-
> > >  include/linux/i3c/master.h |  39 +++++
> > >  2 files changed, 396 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > index 0436916..b398d77 100644
> > > --- a/drivers/i3c/master.c
> > > +++ b/drivers/i3c/master.c
> > > @@ -449,6 +449,46 @@ static ssize_t mode_show(struct device *dev,
> > >  }
> > >  static DEVICE_ATTR_RO(mode);
> > >  
> > > +static ssize_t
> > > +mastership_show(struct device *dev, struct device_attribute *da, char *buf)
> > > +{
> > > +	struct i3c_master_controller *master = dev_to_i3cmaster(dev);
> > > +	ssize_t ret;
> > > +
> > > +	if (master->secondary)
> > > +		ret = sprintf(buf, "Secondary Master\n");
> > > +	else
> > > +		ret = sprintf(buf, "Master\n");
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static ssize_t
> > > +mastership_store(struct device *dev, struct device_attribute *attr,
> > > +		 const char *buf, size_t count)
> > > +{
> > > +	struct i3c_master_controller *master = dev_to_i3cmaster(dev);
> > > +	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
> > > +
> > > +	if (i3cbus->cur_master == master->this) {
> > > +		dev_err(dev, "I'm current mater.");
> > > +		return count;
> > > +	}
> > > +
> > > +	if (!master->ops->request_mastership) {
> > > +		dev_err(dev, "mastership_request not supported.");
> > > +		return count;
> > > +	}
> > > +
> > > +	if (master->ops->request_mastership(master))
> > > +		dev_err(dev, "mastership_request failed");
> > > +	else
> > > +		dev_err(dev, "mastership_request success");
> > > +
> > > +	return count;
> > > +}
> > > +static DEVICE_ATTR_RW(mastership);
> > > +
> > >  static ssize_t current_master_show(struct device *dev,
> > >  				   struct device_attribute *da,
> > >  				   char *buf)
> > > @@ -457,8 +497,11 @@ static ssize_t current_master_show(struct device *dev,
> > >  	ssize_t ret;
> > >  
> > >  	i3c_bus_normaluse_lock(i3cbus);
> > > -	ret = sprintf(buf, "%d-%llx\n", i3cbus->id,
> > > -		      i3cbus->cur_master->info.pid);
> > > +	if (i3cbus->cur_master)
> > > +		ret = sprintf(buf, "%d-%llx\n", i3cbus->id,
> > > +			      i3cbus->cur_master->info.pid);
> > > +	else
> > > +		ret = sprintf(buf, "Not Current Master\n");
> > >  	i3c_bus_normaluse_unlock(i3cbus);
> > >  
> > >  	return ret;
> > > @@ -497,6 +540,7 @@ static DEVICE_ATTR_RO(i2c_scl_frequency);
> > >  
> > >  static struct attribute *i3c_masterdev_attrs[] = {
> > >  	&dev_attr_mode.attr,
> > > +	&dev_attr_mastership.attr,
> > >  	&dev_attr_current_master.attr,
> > >  	&dev_attr_i3c_scl_frequency.attr,
> > >  	&dev_attr_i2c_scl_frequency.attr,
> > > @@ -854,6 +898,53 @@ int i3c_master_enec_locked(struct i3c_master_controller *master, u8 addr,
> > >  EXPORT_SYMBOL_GPL(i3c_master_enec_locked);
> > >  
> > >  /**
> > > + * i3c_master_getaccmst_locked() - send an GETACCMST CCC command
> > > + * @master: master used to send frames on the bus
> > > + * @addr: a valid I3C slave address
> > > + *
> > > + * Sends an GETACCMST CCC command to offer bus Mastership to an
> > > + * I3C Secondary Master.
> > > + *
> > > + * This function must be called with the bus lock held in write mode.
> > > + *
> > > + * Return: 0 in case of success, a positive I3C error code if the error is
> > > + * one of the official Mx error codes, and a negative error code otherwise.
> > > + */
> > > +int i3c_master_getaccmst_locked(struct i3c_master_controller *master, u8 addr)
> > > +{
> > > +	enum i3c_addr_slot_status addrstat;
> > > +	struct i3c_ccc_getaccmst *accmst;
> > > +	struct i3c_ccc_cmd_dest dest;
> > > +	struct i3c_ccc_cmd cmd;
> > > +	int ret;
> > > +
> > > +	if (!master)
> > > +		return -EINVAL;
> > > +
> > > +	addrstat = i3c_bus_get_addr_slot_status(&master->bus, addr);
> > > +	if (addr == I3C_BROADCAST_ADDR || addrstat != I3C_ADDR_SLOT_I3C_DEV)
> > > +		return -EINVAL;
> > > +
> > > +	accmst = i3c_ccc_cmd_dest_init(&dest, addr, sizeof(*accmst));
> > > +	if (!accmst)
> > > +		return -ENOMEM;
> > > +
> > > +	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETACCMST, &dest, 1);
> > > +
> > > +	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
> > > +	if (ret)
> > > +		goto out;
> > > +
> > > +	if (accmst->newmaster >> 1 != addr)
> > 
> > I really like this check. This is something I realized working
> > on next patch version.
> > 
> > > +		ret = -EIO;
> > > +out:
> > > +	i3c_ccc_cmd_dest_cleanup(&dest);
> > > +
> > > +	return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(i3c_master_getaccmst_locked);
> > > +
> > > +/**
> > >   * i3c_master_defslvs_locked() - send a DEFSLVS CCC command
> > >   * @master: master used to send frames on the bus
> > >   *
> > > @@ -1542,8 +1633,7 @@ int i3c_master_set_info(struct i3c_master_controller *master,
> > >  	if (!i3c_bus_dev_addr_is_avail(&master->bus, info->dyn_addr))
> > >  		return -EINVAL;
> > >  
> > > -	if (I3C_BCR_DEVICE_ROLE(info->bcr) == I3C_BCR_I3C_MASTER &&
> > > -	    master->secondary)
> > > +	if (I3C_BCR_DEVICE_ROLE(info->bcr) != I3C_BCR_I3C_MASTER)
> > >  		return -EINVAL;
> > >  
> > >  	if (master->this)
> > > @@ -2381,6 +2471,81 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
> > >  	return 0;
> > >  }
> > >  
> > > +int i3c_sec_master_bus_init(struct i3c_master_controller *master)
> > > +{
> > > +	unsigned long i2c_scl_rate = I3C_BUS_I2C_FM_PLUS_SCL_RATE;
> > > +	struct i3c_bus *i3cbus = i3c_master_get_bus(master);
> > > +	enum i3c_bus_mode mode = i3cbus->mode;
> > > +	struct i3c_defslvs_info *defslvsinfo;
> > > +	int ret = 0;
> > > +
> > > +	if (master->init_done)
> > > +		return -EINVAL;
> > > +
> > > +	list_for_each_entry(defslvsinfo, &master->defslvs, node) {
> > > +		if (defslvsinfo->slave.dyn_addr)
> > > +			continue;
> > > +
> > > +		switch (defslvsinfo->slave.lvr & I3C_LVR_I2C_INDEX_MASK) {
> > > +		case I3C_LVR_I2C_INDEX(0):
> > > +			if (mode < I3C_BUS_MODE_MIXED_FAST)
> > > +				mode = I3C_BUS_MODE_MIXED_FAST;
> > > +			break;
> > > +		case I3C_LVR_I2C_INDEX(1):
> > > +		case I3C_LVR_I2C_INDEX(2):
> > > +			if (mode < I3C_BUS_MODE_MIXED_SLOW)
> > > +				mode = I3C_BUS_MODE_MIXED_SLOW;
> > > +			break;
> > > +		default:
> > > +			ret = -EINVAL;
> > > +			goto err_put_dev;
> > > +		}
> > > +		if (defslvsinfo->slave.lvr & I3C_LVR_I2C_FM_MODE)
> > > +			i2c_scl_rate = I3C_BUS_I2C_FM_SCL_RATE;
> > > +	}
> > > +
> > > +	ret = i3c_bus_set_mode(i3cbus, mode, i2c_scl_rate);
> > > +	if (ret)
> > > +		goto err_put_dev;
> > > +
> > > +	/*
> > > +	 * Now execute the controller specific ->bus_init() routine, which
> > > +	 * might configure its internal logic to match the bus limitations.
> > > +	 */
> > > +	ret = master->ops->bus_init(master);
> > > +	if (ret)
> > > +		goto err_put_dev;
> > > +
> > > +	/*
> > > +	 * The master device should have been instantiated in ->bus_init(),
> > > +	 * complain if this was not the case.
> > > +	 */
> > > +	if (!master->this) {
> > > +		dev_err(&master->dev,
> > > +			"master_set_info() was not called in ->bus_init()\n");
> > > +		ret = -EINVAL;
> > > +		goto err_put_dev;
> > > +	}
> > > +
> > > +	ret = device_add(&master->dev);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/*
> > > +	 * Expose our I3C bus as an I2C adapter so that I2C devices are exposed
> > > +	 * through the I2C subsystem.
> > > +	 */
> > > +	ret = i3c_master_i2c_adapter_init(master);
> > > +	if (ret)
> > > +		goto err_put_dev;
> > > +
> > > +	master->init_done = true;
> > > +
> > > +err_put_dev:
> > > +	return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(i3c_sec_master_bus_init);
> > > +
> > >  /**
> > >   * i3c_master_register() - register an I3C master
> > >   * @master: master used to send frames on the bus
> > > @@ -2413,10 +2578,6 @@ int i3c_master_register(struct i3c_master_controller *master,
> > >  	struct i2c_dev_boardinfo *i2cbi;
> > >  	int ret;
> > >  
> > > -	/* We do not support secondary masters yet. */
> > > -	if (secondary)
> > > -		return -ENOTSUPP;
> > > -
> > >  	ret = i3c_master_check_ops(ops);
> > >  	if (ret)
> > >  		return ret;
> > > @@ -2430,6 +2591,7 @@ int i3c_master_register(struct i3c_master_controller *master,
> > >  	master->secondary = secondary;
> > >  	INIT_LIST_HEAD(&master->boardinfo.i2c);
> > >  	INIT_LIST_HEAD(&master->boardinfo.i3c);
> > > +	INIT_LIST_HEAD(&master->defslvs);
> > >  
> > >  	ret = i3c_bus_init(i3cbus);
> > >  	if (ret)
> > > @@ -2475,6 +2637,9 @@ int i3c_master_register(struct i3c_master_controller *master,
> > >  		goto err_put_dev;
> > >  	}
> > >  
> > > +	if (secondary)
> > > +		return 0;
> > > +
> > >  	ret = i3c_master_bus_init(master);
> > >  	if (ret)
> > >  		goto err_put_dev;
> > > @@ -2547,6 +2712,11 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> > >  	if (!master || !xfers)
> > >  		return -EINVAL;
> > >  
> > > +	if (master->bus.cur_master != master->this) {
> > > +		master->ops->request_mastership(master);
> > > +		return -EBUSY;
> > 
> > I don't like this approach, so you have to re-trigger the operation when
> > this master becomes current master. It is not transparent. Especially,
> > HCI 1.1 describes the process in detail, even  on flow chart and you can 
> > see there that you should block all the transfers/tasks on your side and
> > wait for GETACCMST.
> 
> I forgot to explain that this is part is not fully operational and my 
> intention was to address this in near future.
> To quickly head-up, what I had in my mind when did this was if a device 
> wants to do a xfer and sec master is not current master the framework 
> will request the bus ownership and them pass a EBUSY in case of success 
> or another error in case current master Nacks the MR request.
> 
> > 
> > > +	}
> > > +
> > >  	if (!master->ops->priv_xfers)
> > >  		return -ENOTSUPP;
> > >  
> > > @@ -2638,6 +2808,185 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
> > >  	dev->ibi = NULL;
> > >  }
> > >  
> > > +static const char *const i3c_dr_modes[] = {
> > > +	[I3C_DR_MODE_MASTER]		= "master",
> > > +	[I3C_DR_MODE_SEC_MASTER]	= "sec-master",
> > > +	[I3C_DR_MODE_SLAVE]		= "slave",
> > > +};
> > > +
> > > +static enum i3c_dr_mode i3c_get_dr_mode_from_string(const char *str)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = match_string(i3c_dr_modes, ARRAY_SIZE(i3c_dr_modes), str);
> > > +	return (ret < 0) ? I3C_DR_MODE_MASTER : ret;
> > > +}
> > > +
> > > +enum i3c_dr_mode i3c_get_dr_mode(struct device *dev)
> > > +{
> > > +	const char *dr_mode;
> > > +	int err;
> > > +
> > > +	err = device_property_read_string(dev, "dr-mode", &dr_mode);
> > > +	if (err < 0)
> > > +		return I3C_DR_MODE_MASTER;
> > > +
> > > +	return i3c_get_dr_mode_from_string(dr_mode);
> > > +}
> > > +EXPORT_SYMBOL_GPL(i3c_get_dr_mode);
> > > +
> > > +int i3c_sec_master_request_mastership(struct i3c_master_controller *master)
> > > +{
> > > +	int ret;
> > > +
> > > +	i3c_bus_normaluse_lock(&master->bus);
> > > +	ret = master->ops->request_mastership(master);
> > > +	i3c_bus_normaluse_unlock(&master->bus);
> > > +
> > > +	return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(i3c_sec_master_request_mastership);
> > > +
> > > +int i3c_master_deliver_mastership(struct i3c_master_controller *master, u8 addr)
> > 
> > I agree, wa can introduce this now. But we decided to postpone it. As
> > you can see, it shouldn't be so hard.
> 
> IMO this is important, I could use directly the CCC but I know that there 
> is other HC that may use a different approach.
> 
> > 
> > > +{
> > > +	struct i3c_dev_desc *dev;
> > > +	int ret;
> > > +
> > > +	i3c_bus_normaluse_lock(&master->bus);
> > > +	i3c_bus_for_each_i3cdev(&master->bus, dev) {
> > > +		if (dev->ibi) {
> > > +			mutex_lock(&dev->ibi_lock);
> > > +			i3c_dev_disable_ibi_locked(dev);
> > > +			mutex_unlock(&dev->ibi_lock);
> > > +		}
> > > +	}
> > > +	i3c_master_disec_locked(master, I3C_BROADCAST_ADDR,
> > > +				I3C_CCC_EVENT_MR | I3C_CCC_EVENT_HJ);
> > > +
> > > +	ret = master->ops->deliver_mastership(master, addr);
> > > +	i3c_bus_normaluse_unlock(&master->bus);
> > > +
> > > +	return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(i3c_master_deliver_mastership);
> > > +
> > > +int defslvs_populate_i3c_bus(struct i3c_master_controller *master,
> > > +			     struct i3c_ccc_dev_desc defslvs)
> > > +{
> > > +	struct i3c_defslvs_info *defslvsinfo;
> > > +	struct device *dev = &master->dev;
> > > +
> > > +	i3c_bus_maintenance_lock(&master->bus);
> > > +	defslvsinfo = devm_kzalloc(dev, sizeof(*defslvsinfo), GFP_KERNEL);
> > > +	if (!defslvsinfo)
> > > +		return -ENOMEM;
> > > +
> > > +	defslvsinfo->slave = defslvs;
> > > +
> > > +	list_add_tail(&defslvsinfo->node, &master->defslvs);
> > 
> > I don't get why can't we call i3c_master_add_i3c_dev_locked when
> > populating the bus.
> 
> I want to avoid the populating bus call back.

Why?

> 
> > You have all the data on your plate (in HC driver)
> > when you are populating it from SEC_DEV_CHAR_TABLE_LOC.
> 
> Yes, I told you that I have a table for that, yet I decide to not use it. 
> My concern is about the HC that doesn't have?
> For me passing this task for the framework is more universal. 
> 

Looks like we can do the same in HCI.
HC driver has to know always the devices on the bus.

> > 
> > I decided to do it similarly, but then Boris suggested to rework it and
> > we use only i3c_master_add_i3c_dev_locked.
> > 
> > > +
> > > +	i3c_bus_maintenance_unlock(&master->bus);
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(defslvs_populate_i3c_bus);
> > > +
> > > +static void i3c_master_add_new_defslvs(struct i3c_master_controller *master)
> > > +{
> > > +	struct i3c_defslvs_info *defslvsinfo;
> > > +
> > > +	list_for_each_entry(defslvsinfo, &master->defslvs, node) {
> > > +		/* TODO: add i2c devices to the bus */
> > > +		if (!defslvsinfo->slave.dyn_addr)
> > > +			continue;
> > > +
> > > +		if (defslvsinfo->slave.dyn_addr == master->this->info.dyn_addr)
> > > +			continue;
> > > +
> > > +		if (!i3c_bus_dev_addr_is_avail(&master->bus,
> > > +					       defslvsinfo->slave.dyn_addr))
> > 
> > We can add those checks also but we also have i3c_master_attach_i3c_dev
> > and i3c_master_get_i3c_addrs which takes care of this everything.
> 
> Yes, but them you will be allocating and free devs unnecessarily.
> 

Can you explain that?

> > 
> > > +			continue;
> > > +
> > > +		i3c_master_add_i3c_dev_locked(master, defslvsinfo->slave.dyn_addr);
> > > +	}
> > > +
> > > +	while (!list_empty(&master->defslvs)) {
> > > +		defslvsinfo = list_first_entry(&master->defslvs,
> > > +					       struct i3c_defslvs_info, node);
> > > +		list_del(&defslvsinfo->node);
> > 
> > I feel like this code is redundant, we have to allocate it, then delete.
> 
> No. you need to clean the list. I may receive another one in the future 
> due a HJ or a dynamic address change.
>

I like more the way when HC driver is updateing that. It makes API
simpler.

> > 
> > > +	}
> > > +}
> > > +
> > > +int i3c_master_switch_operation_mode(struct i3c_master_controller *master,
> > > +				     bool secondary)
> > > +{
> > > +	struct i3c_dev_desc *dev;
> > > +	int ret;
> > > +
> > > +	if (master->secondary == secondary)
> > > +		return -EEXIST;
> > > +
> > > +	/* TODO: get the current master information */
> > > +	if (secondary)
> > > +		master->bus.cur_master = NULL;
> > > +	else
> > > +		master->bus.cur_master = master->this;
> > > +
> > > +	if (!master->init_done && !secondary)
> > > +		i3c_sec_master_bus_init(master);
> > > +
> > > +	master->secondary = secondary;
> > > +
> > > +	dev_info(&master->dev, "changing to %s\n",
> > > +		 master->secondary ? "Sec Master" : "Master");
> > > +
> > > +	/* TODO: Analyse the use of maintenan_lock for everything */
> > > +	if (!list_empty(&master->defslvs) && !secondary) {
> > > +		i3c_bus_maintenance_lock(&master->bus);
> > > +		i3c_master_add_new_defslvs(master);
> > > +		i3c_bus_maintenance_unlock(&master->bus);
> > > +
> > > +		i3c_bus_normaluse_lock(&master->bus);
> > > +		i3c_master_register_new_i3c_devs(master);
> > 
> > Take a look also at i3c_master_bus_takeover from my latest patch. BTW.
> > what about I2C devices? We worked on that also, and this is part of the
> > latest patch also. I'm testing it with I2C devices also.
> 
> Please check the comments for that. Anyway you can declare the i2c 
> devices of DT on both sides, what I think it should be a good practice.
> 

This is what we are doing, but we are comparing I2C devices from DEFSLVS
list with those defined in DT. We discussed that already.

> > 
> > > +		i3c_bus_normaluse_unlock(&master->bus);
> > > +	}
> > > +
> > > +	if (!secondary) {
> > > +		i3c_bus_normaluse_lock(&master->bus);
> > > +		i3c_bus_for_each_i3cdev(&master->bus, dev) {
> > > +			if (dev->ibi) {
> > > +				mutex_lock(&dev->ibi_lock);
> > > +				ret = i3c_dev_enable_ibi_locked(dev);
> > > +				if (ret)
> > > +					dev_err(&master->dev,
> > > +						"Failed to re-enable IBI on device %d-%llx",
> > > +						master->bus.id, dev->info.pid);
> > > +				mutex_unlock(&dev->ibi_lock);
> > > +				}
> > > +		}
> > > +
> > > +		/* TODO: Enable MR only for the elegible devices */
> > 
> > This was postponed also, but we had that before. We can add per-device
> > granularity to i3c_master_bus_takeover().
> 
> Here we need to do the same as for ibi and maybe get the eligible devices 
> from DT or based on its DCR,BCR and PID.
> This is something that should be address because it represent a big 
> security gap.
> 
> > 
> > > +		i3c_master_enec_locked(master, I3C_BROADCAST_ADDR,
> > > +					I3C_CCC_EVENT_MR | I3C_CCC_EVENT_HJ);
> > > +		i3c_bus_normaluse_unlock(&master->bus);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +EXPORT_SYMBOL_GPL(i3c_master_switch_operation_mode);
> > > +
> > > +int i3c_for_each_dev(void *data, int (*fn)(struct device *, void *))
> > > +{
> > > +	int res;
> > > +
> > > +	mutex_lock(&i3c_core_lock);
> > > +	res = bus_for_each_dev(&i3c_bus_type, NULL, data, fn);
> > > +	mutex_unlock(&i3c_core_lock);
> > > +
> > > +	return res;
> > > +}
> > > +EXPORT_SYMBOL_GPL(i3c_for_each_dev);
> > > +
> > >  static int __init i3c_init(void)
> > >  {
> > >  	return bus_register(&i3c_bus_type);
> > > diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> > > index 9cb39d9..09bd99c 100644
> > > --- a/include/linux/i3c/master.h
> > > +++ b/include/linux/i3c/master.h
> > > @@ -426,6 +426,8 @@ struct i3c_bus {
> > >   *		      for a future IBI
> > >   *		      This method is mandatory only if ->request_ibi is not
> > >   *		      NULL.
> > > + * @request_mastership: Request mastership.
> > > + * @deliver_mastership: Deliver mastership
> > >   */
> > >  struct i3c_master_controller_ops {
> > >  	int (*bus_init)(struct i3c_master_controller *master);
> > > @@ -452,6 +454,21 @@ struct i3c_master_controller_ops {
> > >  	int (*disable_ibi)(struct i3c_dev_desc *dev);
> > >  	void (*recycle_ibi_slot)(struct i3c_dev_desc *dev,
> > >  				 struct i3c_ibi_slot *slot);
> > > +	int (*request_mastership)(struct i3c_master_controller *master);
> > > +	int (*deliver_mastership)(struct i3c_master_controller *master,
> > > +				  u8 addr);
> > > +};
> > > +
> > > +/**
> > > + * struct i3c_defslvs_info - defslvs information object
> > > + * @node: used to insert the defslvs object in the  list
> > > + * @slave: I3C/I2C device descriptor used for DEFSLVS
> > > + *
> > > + * This structure is used to hold defslvs information on Secondary Master.
> > > + */
> > > +struct i3c_defslvs_info {
> > > +	struct list_head node;
> > > +	struct i3c_ccc_dev_desc slave;
> > >  };
> > >  
> > >  /**
> > > @@ -468,6 +485,7 @@ struct i3c_master_controller_ops {
> > >   * @boardinfo.i3c: list of I3C  boardinfo objects
> > >   * @boardinfo.i2c: list of I2C boardinfo objects
> > >   * @boardinfo: board-level information attached to devices connected on the bus
> > > + * @defslvs: List of defslvs objects
> > >   * @bus: I3C bus exposed by this master
> > >   * @wq: workqueue used to execute IBI handlers. Can also be used by master
> > >   *	drivers if they need to postpone operations that need to take place
> > > @@ -491,6 +509,7 @@ struct i3c_master_controller {
> > >  		struct list_head i3c;
> > >  		struct list_head i2c;
> > >  	} boardinfo;
> > > +	struct list_head defslvs;
> > >  	struct i3c_bus bus;
> > >  	struct workqueue_struct *wq;
> > >  };
> > > @@ -525,6 +544,7 @@ int i3c_master_disec_locked(struct i3c_master_controller *master, u8 addr,
> > >  			    u8 evts);
> > >  int i3c_master_enec_locked(struct i3c_master_controller *master, u8 addr,
> > >  			   u8 evts);
> > > +int i3c_master_getaccmst_locked(struct i3c_master_controller *master, u8 addr);
> > >  int i3c_master_entdaa_locked(struct i3c_master_controller *master);
> > >  int i3c_master_defslvs_locked(struct i3c_master_controller *master);
> > >  
> > > @@ -652,4 +672,23 @@ void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot);
> > >  
> > >  struct i3c_ibi_slot *i3c_master_get_free_ibi_slot(struct i3c_dev_desc *dev);
> > >  
> > > +enum i3c_dr_mode {
> > > +	I3C_DR_MODE_MASTER,
> > > +	I3C_DR_MODE_SEC_MASTER,
> > > +	I3C_DR_MODE_SLAVE,
> > > +};
> > > +
> > > +enum i3c_dr_mode i3c_get_dr_mode(struct device *dev);
> > > +
> > > +int i3c_master_switch_operation_mode(struct i3c_master_controller *master,
> > > +				     bool secondary);
> > > +
> > > +int i3c_sec_master_request_mastership(struct i3c_master_controller *master);
> > > +int i3c_master_deliver_mastership(struct i3c_master_controller *master,
> > > +				  u8 addr);
> > > +
> > > +int i3c_sec_master_bus_init(struct i3c_master_controller *master);
> > > +int defslvs_populate_i3c_bus(struct i3c_master_controller *master,
> > > +			     struct i3c_ccc_dev_desc defslvs);
> > > +
> > >  #endif /* I3C_MASTER_H */
> > > -- 
> > > 2.7.4
> > > 
> > 
> > I feel like this is based on early approach which has evolved by the time
> > and I think some of the nice part are missing. The biggest parts to
> > discuass are:
> > - bus population using devslvs device list instead of using
> >   i3c_master_add_i3c_dev locked, have you tried that? If something does
> >   not work for you, wa can adjust it but I really want you to try the
> >   new approach
> 
> To me the i3c_master_add_i3c_dev_locked just need an improvement to 
> propagate the boardinfo to all devices, something that already I started, 
> and we need to discuss if on secondary master side we can change the 
> devices addresses which imply to send DEFSLVS at the end of the process.

So let's improve it. Can you point me to that?

> 
> > 
> > - the way how we are requesting mastership, IMO, we should wait untill
> >   the process is finished, as also described in HCI spec for example.
> 
> I think you are confusing the concept here. I understand you want to do 
> the xfer straight way after receive GETACCMST and I agree with that.
> The thing is that you don't know what will happen on the bus between the 
> time you send the request and you get the bus ownership. I just think we 
> need to find another solution for that like defer the transfer to another 
> time and when the controller switch the rule trigger all transfers in the 
> pipeline (something like this) even before restore all ibi. If you block 
> the bus you are not able to pass the defslvs to the framework.  
> 

If the MR request was acked, we know that we'll get the control. And it
doesn't matter if current master will enable/disable something, change
the activity state, send another DEFSLVS, we still want to make a
transfer. 

In your approach it is possible that we get the control, we'll
not make the transfer and give control back to a diffent master. 
I have tests for more than 2 masters.

And also, I don't feel like queueing the transfers is good idea. When
some upper layer wants to transfer the data again, old data may be stale
but we still will transfer that.

> >   When I introduce interrupt-based solution, everything should be fine.
> >   Could you do that also in your driver?
> 
> I did it but had issues and didn't fit in my use case. That the reason I 
> did this approach.

Can you describe what issues you faced with this approach? What is your
use case? If we get the control, we just make the transfers, if not,
return exit code to upper layer and that's it.

> 
> > 
> > Again, good to have that. I'm really counting on a fair discussion :-)
> > 
> > -- 
> > --
> > Regards, 
> > Przemyslaw Gaj
> 
> As you can see this is based on your work. Off course it as some lose 
> ends that should be addressed (like i2c devices, bus mode...) but don't 
> have big impact in what I want to show.

Yes, but on my work in early stage and I think this approach wasn't
perfect. Then we decided to refork some parts which is not part of that.
I feel like we can't find common view.

> For me it is important to rely on framework the way how bus ownership 
> exchange is made because it will be easier to maintain in long term and 
> we can introduce algorithms for the bus access in the future.
> 

Yes, why not. My latest patchset does not break anything here.

> If you are using i3c-tree/next you can apply this directly and if you 
> find anything else that isn't going ok please let me know.
> 
> Best regards,
> Vitor Soares

-- 
-- 
Regards,
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
