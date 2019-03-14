Return-Path: <SRS0=x7GA=RR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FDAC43381
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Mar 2019 07:48:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2078B2087C
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Mar 2019 07:48:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lVa64iZ6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="UACUJR9B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="WLhgqmtD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2078B2087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TD0bz8a93s2Db0LGxA8Hy2fbIwBTcNOvdopx/b/Knyg=; b=lVa64iZ6DOEe6n
	QxRSgaotpJp8Rv1tCPmfJhcNUIm/ziQk3GSS5LIXDdYgS0/n1av9L4Z4YSX9uOQcDY/cD7M2ASXkU
	W/lDQbbmq70s224/ndndxvix9L8ZtqQAXy5jb2NmDj0YvMOXWUE3Vrwlr3N84M/HVBcKFE8MnVGAK
	klX1yrAd0kr82/D+jRajsWOMgqIiFPOdmEYiwNk5P0ivxLhGJHcUCzi+0qPdyDUPtDSahIA36ASiw
	99SjrlmKFWQlLaZSDvrnCzghHTE0PLfQbHJfEBCgVD5Ait/7EKyebDxng/hr4kj9+tG2lDgocNOZI
	648BTLPmUjpOYwyPXccg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4L6A-00028n-Oh; Thu, 14 Mar 2019 07:48:18 +0000
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4L68-00028I-0w
 for linux-i3c@lists.infradead.org; Thu, 14 Mar 2019 07:48:17 +0000
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
 by mx0a-0014ca01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2E7ljmr023110; Thu, 14 Mar 2019 00:48:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=ISfjiZz1EZ4lC6XiKSLe/CPvpBZPjNceglRtiuwKx88=;
 b=UACUJR9BOpI7j6djGZ3al7h9gbTV73ImdlFeizokGMXi/InP29Noxyccm2m2AYptNExQ
 Y3K9laBcAJgGmb59aei5FC2JHX0XXmVIPPVoPZctIQX9jsdzqGT3x937qkW/uA0psjge
 qleUMGuLrgeMJE3cKwnE7241zm58OT1qoNzYR/Z89MPIsGwRqQ4v3TCt4KQhtWeQeX60
 0B2v3YVKyDL6YSyBN/83fZs/7UY4zVuIVqIJrtxPAshgPg0Ht47mW7rUTcAdb6so0jZp
 3hkCfmO2UuAPkfa1/vUhGoKv7uQPHFub3FlVUp+yOjQzHzJfIVs0MPDkb/EtIJgcaDFs ZA== 
Authentication-Results: cadence.com;
	spf=pass smtp.mailfrom=pgaj@cadence.com
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2053.outbound.protection.outlook.com [104.47.36.53])
 by mx0a-0014ca01.pphosted.com with ESMTP id 2r6sq56gjc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 14 Mar 2019 00:48:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISfjiZz1EZ4lC6XiKSLe/CPvpBZPjNceglRtiuwKx88=;
 b=WLhgqmtDadwHJyT7/aR/yLog6QyNN/uLaW1yh9riQ1gFHxrn4CYzkFv8/2OrxDp4huUY03yF+Xx68d3Em/nTlSWGkvtHe6fRz84mZT0hbGQLjPtAirKKS+xjGB6yISkV4l+/Nw3jJ1bglyHEP6TcS1zZn211RzabaAbHeVQHRX8=
Received: from CO2PR07CA0045.namprd07.prod.outlook.com (2603:10b6:100::13) by
 MN2PR07MB5917.namprd07.prod.outlook.com (2603:10b6:208:ae::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.13; Thu, 14 Mar 2019 07:48:06 +0000
Received: from DM3NAM05FT053.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::207) by CO2PR07CA0045.outlook.office365.com
 (2603:10b6:100::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1709.14 via Frontend
 Transport; Thu, 14 Mar 2019 07:48:05 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 DM3NAM05FT053.mail.protection.outlook.com (10.152.98.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1730.2 via Frontend Transport; Thu, 14 Mar 2019 07:48:04 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id x2E7m3Yl029500
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 14 Mar 2019 00:48:04 -0700
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 14 Mar 2019 00:48:02 -0700
Date: Thu, 14 Mar 2019 07:47:59 +0000
From: Przemyslaw Gaj <pgaj@cadence.com>
To: vitor <vitor.soares@synopsys.com>
Subject: Re: [PATCH 1/4] i3c: Drop support for I2C 10 bit addresing
Message-ID: <20190314074758.GA26498@global.cadence.com>
References: <20190307095808.22540-1-pgaj@cadence.com>
 <20190307095808.22540-2-pgaj@cadence.com>
 <82326a77-9cd5-16d7-3fc2-5ffce2c44aeb@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <82326a77-9cd5-16d7-3fc2-5ffce2c44aeb@synopsys.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj7.global.cadence.com (158.140.32.114) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(136003)(346002)(376002)(2980300002)(36092001)(199004)(189003)(47776003)(8936002)(486006)(53546011)(186003)(66066001)(7696005)(26826003)(6916009)(23676004)(6116002)(8676002)(478600001)(76176011)(2486003)(426003)(16526019)(386003)(7636002)(7736002)(956004)(50466002)(305945005)(3846002)(126002)(11346002)(446003)(4326008)(33656002)(336012)(26005)(476003)(107886003)(6246003)(58126008)(106466001)(14444005)(5024004)(53416004)(16586007)(2906002)(55016002)(246002)(1076003)(6666004)(356004)(6286002)(86362001)(105596002)(5660300002)(229853002)(316002)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR07MB5917; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7014e4ab-7332-4780-e92d-08d6a8516467
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:MN2PR07MB5917; 
X-MS-TrafficTypeDiagnostic: MN2PR07MB5917:
X-Microsoft-Antispam-PRVS: <MN2PR07MB5917BBE72910EE53C4B0CD99C24B0@MN2PR07MB5917.namprd07.prod.outlook.com>
X-Forefront-PRVS: 09760A0505
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: UosCdxqRTOx2W59oEyfPRxIANQ5y3prw1oep+KQcx/jbKuabJ00vmVScWeBKt2atcQ88H5JVw32D0Fhk8dXnhx/mXet16/NMiEcTvi0inxiYmuPMQop/2HXTpiK6wPOZ7y8bsOgj5hyiTZwv41jOLgsCxUJqroLPoMvJnEaRptzdLDQDGMU5ubUbDgPDMmIJMtIg0yv4TFyXd3KmgsZREVyL++c9QFP0cSsTHo1gSP9UJ6Uw+jsIkgYVUozNVe1/r0EbmXwsfpClJAejOuCOIvQVhXtPlTzGHgrBShAUXLcWdP0wfvd1iDmoR5VhpZVK/0b/fRGY1NHYrcjKgxIs7pRwM+WHcgsxlV0Knfd6FNNvxGQZnVyIL+4TuIIaWLpSUnt8WG/OLXinUjjD6xomNEaikx1yrV+1Y5H2YXSPqnY=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2019 07:48:04.7010 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7014e4ab-7332-4780-e92d-08d6a8516467
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR07MB5917
X-Proofpoint-SPF-Result: pass
X-Proofpoint-SPF-Record: v=spf1 include:_spf.salesforce.com
 include:mktomail.com
 include:spf-0014ca01.pphosted.com include:spf.protection.outlook.com
 include:auth.msgapp.com include:spf.mandrillapp.com ~all
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-14_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0
 priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903140054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190314_004816_439192_0CA4AFFA 
X-CRM114-Status: GOOD (  21.84  )
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
Cc: linux-i3c@lists.infradead.org, rafalc@cadence.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Vitor,

The 03/13/2019 19:30, vitor wrote:
> 
> 
> Hi Przemek,
> 
> 
> On 07/03/19 09:58, Przemyslaw Gaj wrote:
> > This patch dropps support for I2C devices with 10 bit addressing. When I2C
> > device with 10 bit address is defined in DT, I3C master registration fails.
> >
> > Address space for I2C devices has been reduced and ->i2c_funcs() hook has been
> > removed.
> >
> > Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> > ---
> >  drivers/i3c/master.c       | 19 +++++++++++--------
> >  include/linux/i3c/master.h |  5 +----
> >  2 files changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 2dc628d..5b3adb3 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -1962,6 +1962,16 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
> >  	if (ret)
> >  		return ret;
> >  
> > +	/*
> > +	 * The I3C Specification does not clearly say I2C devices with 10-bit
> > +	 * address are supported. These devices can't be passed properly through
> > +	 * DEFSLVS command.
> > +	 */
> > +	if (boardinfo->base.flags & I2C_CLIENT_TEN) {
> > +		dev_err(&master->dev, "I2C device with 10 bit address not supported.");
> > +		return -ENOTSUPP;
> > +	}
> > +
> >  	/* LVR is encoded in reg[2]. */
> >  	boardinfo->lvr = reg[2];
> >  
> > @@ -2111,16 +2121,9 @@ static int i3c_master_i2c_adapter_xfer(struct i2c_adapter *adap,
> >  	return ret ? ret : nxfers;
> >  }
> >  
> > -static u32 i3c_master_i2c_functionalities(struct i2c_adapter *adap)
> > -{
> > -	struct i3c_master_controller *master = i2c_adapter_to_i3c_master(adap);
> > -
> > -	return master->ops->i2c_funcs(master);
> > -}
> > -
> >  static const struct i2c_algorithm i3c_master_i2c_algo = {
> >  	.master_xfer = i3c_master_i2c_adapter_xfer,
> > -	.functionality = i3c_master_i2c_functionalities,
> > +	.functionality = I2C_FUNC_SMBUS_EMUL | I2C_FUNC_I2C,
> >  };
> >  
> >  static int i3c_master_i2c_adapter_init(struct i3c_master_controller *master)
> > diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> > index f13fd8b..eca8337 100644
> > --- a/include/linux/i3c/master.h
> > +++ b/include/linux/i3c/master.h
> > @@ -48,7 +48,7 @@ struct i3c_i2c_dev_desc {
> >  #define I3C_LVR_I2C_INDEX(x)		((x) << 5)
> >  #define I3C_LVR_I2C_FM_MODE		BIT(4)
> >  
> > -#define I2C_MAX_ADDR			GENMASK(9, 0)
> > +#define I2C_MAX_ADDR			GENMASK(6, 0)
> >  
> >  /**
> >   * struct i2c_dev_boardinfo - I2C device board information
> > @@ -390,8 +390,6 @@ struct i3c_bus {
> >   *	       and i2c_put_dma_safe_msg_buf() helpers provided by the I2C
> >   *	       framework.
> >   *	       This method is mandatory.
> > - * @i2c_funcs: expose the supported I2C functionalities.
> > - *	       This method is mandatory.
> >   * @request_ibi: attach an IBI handler to an I3C device. This implies defining
> >   *		 an IBI handler and the constraints of the IBI (maximum payload
> >   *		 length and number of pre-allocated slots).
> > @@ -437,7 +435,6 @@ struct i3c_master_controller_ops {
> >  	void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
> >  	int (*i2c_xfers)(struct i2c_dev_desc *dev,
> >  			 const struct i2c_msg *xfers, int nxfers);
> > -	u32 (*i2c_funcs)(struct i3c_master_controller *master);
> >  	int (*request_ibi)(struct i3c_dev_desc *dev,
> >  			   const struct i3c_ibi_setup *req);
> >  	void (*free_ibi)(struct i3c_dev_desc *dev);
> 
> Still need to remove ops->i2c_funcs from i3c_master_check_ops.

I thought I did that. I need to check that patch carefully. I'm sure I compiled
that, now I'm wondering why it worked. Thank you!

> 
> Best regards, 
> Vitor Soares

-- 
-- 
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
