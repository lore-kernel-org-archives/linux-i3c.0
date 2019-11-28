Return-Path: <SRS0=pqjR=ZU=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4751FC432C0
	for <linux-i3c@archiver.kernel.org>; Thu, 28 Nov 2019 05:50:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 123C4215E5
	for <linux-i3c@archiver.kernel.org>; Thu, 28 Nov 2019 05:50:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ikA8ROHE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="MxDZfAyT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="JrTrD2sh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 123C4215E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5spPOiCZb0NWkCN2gqtO+RyMUiEFIYmGcd6zfIDoYC0=; b=ikA8ROHE/nxu0b
	OaExEhmH9wAIMd0bngXJGNps5cdh/9pOZoyp+APK5+FgzHX+bgAilePxZ/yr8x7lsSt8+vOo4TtFT
	oJcR+cJgziYwexdN6kgmbvpj6SFgwxgk9mgXRPI+luTwzvJ2SmhwUBppBtWWMA4k9mHjbm/Tsf3IX
	zIHpHISUOTGK75dDcb9/5mfd8pI1150n5JD9jjhZbC+vO3fMBEdk+cZIBEfpmkPa3PIxPcSmdsxye
	iPfvoa0Y3rZ61v0NjDR8XrSaazAyrFvSiahif42z7hwHisw922pJbjuqOKQL66YiTlpm1ncLzBd9p
	pl5S765tt1neLc07Q0Yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iaChC-0001Ar-EL; Thu, 28 Nov 2019 05:50:30 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iaCh8-0001AH-BZ
 for linux-i3c@lists.infradead.org; Thu, 28 Nov 2019 05:50:29 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAS5nBWM001502; Wed, 27 Nov 2019 21:50:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=proofpoint;
 bh=F/GocL5kGThIy5BqUPT69665E2TTxVAEW0SKSfoJlKc=;
 b=MxDZfAyTUnrzIi/JZHgJCy3MoqnPNU48PCG79V43MqYi94kR8IdNOMcgoSxTkzfXduH4
 uyUw71KdPDAd5NyMQQ0W61zsbynzv87YyD0nzqCeUwAGr5A3iWH4XaGaQ5ravo/H/VEt
 Iy8rjzT2W+vBL7yFFF4+odAzfLzzePea7OLvInr2CwqPFpm3QEbb6YCrFZQ0PbVRKbt5
 e3NLu6iLc9/u7CsTMMqma2p02yjQT7/VeO/cXx6/FsrOEXSRuI8AJqr1KC4r6zDDqiv/
 3fYBwQj+4oGX3hvv6h6JzkYr36Zurc2/Px7EB6u82n8IVNEWeiFqwoIHDKmoW1OEUwar LA== 
Received: from nam04-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2058.outbound.protection.outlook.com [104.47.46.58])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2whcyexyxe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 21:50:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVt3Ee8syTRbrzNHUHNL2/Xm7wKT+whEBxH9qbe2GSTTlAEa8qk+zS3DiGqNOceUnn2ksuVae6QxPdXpWQQRJ40MjuXKIIlYvkUd4qAGklg4B8siCgVS8NY90zvpSvWQVzLRkoqkhA+RBHr12tvhJyRXtCkfnp8KG6YUbjz5h2VRGkrBCtk3uk3f/Z68MahZwQaEchwjsKg1Mmb+2lg5CEBnDKg1aTHKKwHRtPSzyMLF12UsJ5siyJdWmYALGOnmMAMA/1STTqQfcekfn1R/wGAMR8WXhbcSYrhF+z1NtLbsmF3AaxakjM5b1zOQoYq6Q49hKiDlTZsKktwuOPziWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/GocL5kGThIy5BqUPT69665E2TTxVAEW0SKSfoJlKc=;
 b=BED8yiPKKfHjQChlrseI/VtqH+9TLL9BEGent/FaXU4uGrEfIkTPE4JIdQibkm0y4x1H7G55FYQ6SiqAu6HXFvDOT08EZdpF5y+evSuz8+M+47y0Hfwy/dqkkEN8UsSF1djRxvaYVo3qK0YPrE00aa3ngE0gQY5hiOY9QxbjbCEXZy95SJOYwlG8sGErGDEt5lFagCPKbokYPe3tFai6Ce+uxBTMvqUMSKjjTxU8JtiHrLvAk/RZ/BOWQyRo5S9poV9YhtK6sOV01PKpxJUxSgeGnj65WdwVzh5vs5VQoRmpMo7mduNUNeqb91M8udchQRKS1invvRJpzTlkar229Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 64.207.220.243) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=cadence.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=cadence.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/GocL5kGThIy5BqUPT69665E2TTxVAEW0SKSfoJlKc=;
 b=JrTrD2shAo1lA6xyHcxoHZ2ZVN3P8+mQin2foAXhvXFndZ/8cgePaHSDJAGjR45RndGIkw0RM9GfeHWvr8sPTo9NSIQ7uxCR4d/tjwlLQi7CN6xQXFzwKYP0weuVq+NwnDxT6XYTX0mVIrYghgP0WitgeCzcezmpORrUYDqk5P4=
Received: from BYAPR07CA0005.namprd07.prod.outlook.com (2603:10b6:a02:bc::18)
 by CH2PR07MB6758.namprd07.prod.outlook.com (2603:10b6:610:2f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.19; Thu, 28 Nov
 2019 05:50:18 +0000
Received: from DM6NAM12FT047.eop-nam12.prod.protection.outlook.com
 (2a01:111:f400:fe59::207) by BYAPR07CA0005.outlook.office365.com
 (2603:10b6:a02:bc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17 via Frontend
 Transport; Thu, 28 Nov 2019 05:50:18 +0000
Received-SPF: Pass (protection.outlook.com: domain of cadence.com designates
 64.207.220.243 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.207.220.243; helo=wcmailrelayl01.cadence.com;
Received: from wcmailrelayl01.cadence.com (64.207.220.243) by
 DM6NAM12FT047.mail.protection.outlook.com (10.13.179.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Thu, 28 Nov 2019 05:50:15 +0000
Received: from mailsj6.global.cadence.com (mailsj6.cadence.com
 [158.140.32.112])
 by wcmailrelayl01.cadence.com (8.14.7/8.14.4) with ESMTP id xAS5oDQq177649
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=OK);
 Wed, 27 Nov 2019 21:50:13 -0800
X-CrossPremisesHeadersFilteredBySendConnector: mailsj6.global.cadence.com
Received: from global.cadence.com (158.140.32.37) by
 mailsj6.global.cadence.com (158.140.32.112) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 21:50:11 -0800
Date: Thu, 28 Nov 2019 06:50:08 +0100
From: Przemyslaw Gaj <pgaj@cadence.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [RFC 1/2] i3c: Add preliminary support for secondary master
Message-ID: <20191128055007.GA11250@global.cadence.com>
References: <cover.1574897246.git.vitor.soares@synopsys.com>
 <a9466e3de90e1aae1111a17bbbd08311e7bf87c3.1574897246.git.vitor.soares@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a9466e3de90e1aae1111a17bbbd08311e7bf87c3.1574897246.git.vitor.soares@synopsys.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Originating-IP: [158.140.32.37]
X-ClientProxiedBy: mailsj6.global.cadence.com (158.140.32.112) To
 mailsj6.global.cadence.com (158.140.32.112)
X-OrganizationHeadersPreserved: mailsj6.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:64.207.220.243; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(346002)(36092001)(189003)(199004)(6116002)(446003)(426003)(6286002)(6246003)(2486003)(336012)(11346002)(316002)(956004)(7696005)(4326008)(5024004)(386003)(14444005)(6916009)(106002)(54906003)(6666004)(356004)(36906005)(70206006)(55016002)(478600001)(3846002)(229853002)(16586007)(66066001)(86362001)(30864003)(33656002)(5660300002)(58126008)(2906002)(47776003)(305945005)(50466002)(70586007)(76176011)(81156014)(81166006)(186003)(16526019)(8676002)(26005)(7736002)(1076003)(23676004)(8936002)(53416004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR07MB6758; H:wcmailrelayl01.cadence.com;
 FPR:; SPF:Pass; LANG:en; PTR:ErrorRetry; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d01f776-4a34-4f16-f5d7-08d773c6d7f0
X-MS-TrafficTypeDiagnostic: CH2PR07MB6758:
X-Microsoft-Antispam-PRVS: <CH2PR07MB675882CBBBB911940C3F0021C2470@CH2PR07MB6758.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0235CBE7D0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rj5yPUqFbJ0cni7E2NfCGoJDiMhIBg+GlNJGXfscKI31qK0LO2EERdWVTjeUB6HclfL33LInKhTnO6v3ST52oXWBHgw4whboKGZqJHZBeOXqHLreIg87iAFPp550OmzuXexjC5o8s5vIRtHysjnCY2yunasEX43uZgbdchM/JvftAhShOOyJ0M3UEuhdnyodEmScm2lXQsd7RdkZ0weckw6WMiZelN462IoQe/x/MM6IbHcr69ELKJUizrevX4PTX82QyG8MF+KV50dqZxKtgLAG/7uNbOqGYMzWqodlUo7KYjAU329UKRW2sTuoHMFLh/kN3kPxC5p7SwiTqT9raqJQaAmoNos8A98unLm3S+Ua6sY3tDvTLP/3uwM5amOignWhJ1HwSGT5CzVIwP033VaAuB9GQQE9OU1p9uyXmvEtEF5VRYkxG6d366xGiZzrnKwjQuk9KPq0UfAR5DOCeA==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2019 05:50:15.8755 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d01f776-4a34-4f16-f5d7-08d773c6d7f0
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[64.207.220.243];
 Helo=[wcmailrelayl01.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR07MB6758
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_07:2019-11-27,2019-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911280048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191127_215026_884679_E7C9947C 
X-CRM114-Status: GOOD (  28.96  )
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
Cc: linux-i3c@lists.infradead.org, Joao.Pinto@synopsys.com,
 bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Vitor,

First, you woke up my son and he couldn't sleep the rest of the night
:-)
I appreciate you sent that so we can discuss it.

The 11/28/2019 02:15, Vitor Soares wrote:
> 
> This patch adds the preliminary support for secondary master feature to
> i3c Framework for testing purposes.
> 
> Key points for consideration:
>   - mastership_[show/store] are only used for testing
>   - secondary master registration is made in two steps, one in
>   i3c_master_register() and another in i3c_sec_master_bus_init() when
>   secondary master became current master first time. This is made in this
>   way to get all dt declared boardinfo list, create defslvs list and
>   provide work_queue.
>   - When the current master wants to deliver_mastership it necessary to
>   disable all in-band events to avoid unwanted interrupt during bus
>   ownership exchange. For now this patch doesn't reflect all
>   improvements/changes made in v1.1 I3C Bus spec. But it can be extended
>   by adding some commands and checks to the flow.
>   - i3c_defslvs_info: The DEFSLVS info can be differently stored in
>   diferen HC. Hence it is used a defslvs list similar to boardinfo list in
>   the bus structure to hold this data. Them HC is taccking over the bus
>   ownership can initialize each device of that list. For now, this not
>   address the i2c devices since they are only statically described.
>   - [request/deliver]_mastership(): Mastership request deliver may be done
>   differently in different HC, hence the need to have a call back for each
>   process.
>   - Add dr_mode to DT: Similar to USB, HC can be programmed to Master only
>   mode, Slave only mode or Secondary Master which aren't necessarily
>   hardcoded.
>   - bus_mode definition: The bus mode is defined even without defslvs
>   information with DT info since the definition of i2c devices are those
>   that have impact on bus_mode definition and need to statically declared.
>   The only use case that may cause issues is when i2c devices aren't
>   declared in secondary master side and bus mode doesn't match the
>   main master. Anyway this can be solde without extra complexity.
> 
> Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> ---
>  drivers/i3c/master.c       | 365 ++++++++++++++++++++++++++++++++++++++++++++-
>  include/linux/i3c/master.h |  39 +++++
>  2 files changed, 396 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 0436916..b398d77 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -449,6 +449,46 @@ static ssize_t mode_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RO(mode);
>  
> +static ssize_t
> +mastership_show(struct device *dev, struct device_attribute *da, char *buf)
> +{
> +	struct i3c_master_controller *master = dev_to_i3cmaster(dev);
> +	ssize_t ret;
> +
> +	if (master->secondary)
> +		ret = sprintf(buf, "Secondary Master\n");
> +	else
> +		ret = sprintf(buf, "Master\n");
> +
> +	return ret;
> +}
> +
> +static ssize_t
> +mastership_store(struct device *dev, struct device_attribute *attr,
> +		 const char *buf, size_t count)
> +{
> +	struct i3c_master_controller *master = dev_to_i3cmaster(dev);
> +	struct i3c_bus *i3cbus = dev_to_i3cbus(dev);
> +
> +	if (i3cbus->cur_master == master->this) {
> +		dev_err(dev, "I'm current mater.");
> +		return count;
> +	}
> +
> +	if (!master->ops->request_mastership) {
> +		dev_err(dev, "mastership_request not supported.");
> +		return count;
> +	}
> +
> +	if (master->ops->request_mastership(master))
> +		dev_err(dev, "mastership_request failed");
> +	else
> +		dev_err(dev, "mastership_request success");
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(mastership);
> +
>  static ssize_t current_master_show(struct device *dev,
>  				   struct device_attribute *da,
>  				   char *buf)
> @@ -457,8 +497,11 @@ static ssize_t current_master_show(struct device *dev,
>  	ssize_t ret;
>  
>  	i3c_bus_normaluse_lock(i3cbus);
> -	ret = sprintf(buf, "%d-%llx\n", i3cbus->id,
> -		      i3cbus->cur_master->info.pid);
> +	if (i3cbus->cur_master)
> +		ret = sprintf(buf, "%d-%llx\n", i3cbus->id,
> +			      i3cbus->cur_master->info.pid);
> +	else
> +		ret = sprintf(buf, "Not Current Master\n");
>  	i3c_bus_normaluse_unlock(i3cbus);
>  
>  	return ret;
> @@ -497,6 +540,7 @@ static DEVICE_ATTR_RO(i2c_scl_frequency);
>  
>  static struct attribute *i3c_masterdev_attrs[] = {
>  	&dev_attr_mode.attr,
> +	&dev_attr_mastership.attr,
>  	&dev_attr_current_master.attr,
>  	&dev_attr_i3c_scl_frequency.attr,
>  	&dev_attr_i2c_scl_frequency.attr,
> @@ -854,6 +898,53 @@ int i3c_master_enec_locked(struct i3c_master_controller *master, u8 addr,
>  EXPORT_SYMBOL_GPL(i3c_master_enec_locked);
>  
>  /**
> + * i3c_master_getaccmst_locked() - send an GETACCMST CCC command
> + * @master: master used to send frames on the bus
> + * @addr: a valid I3C slave address
> + *
> + * Sends an GETACCMST CCC command to offer bus Mastership to an
> + * I3C Secondary Master.
> + *
> + * This function must be called with the bus lock held in write mode.
> + *
> + * Return: 0 in case of success, a positive I3C error code if the error is
> + * one of the official Mx error codes, and a negative error code otherwise.
> + */
> +int i3c_master_getaccmst_locked(struct i3c_master_controller *master, u8 addr)
> +{
> +	enum i3c_addr_slot_status addrstat;
> +	struct i3c_ccc_getaccmst *accmst;
> +	struct i3c_ccc_cmd_dest dest;
> +	struct i3c_ccc_cmd cmd;
> +	int ret;
> +
> +	if (!master)
> +		return -EINVAL;
> +
> +	addrstat = i3c_bus_get_addr_slot_status(&master->bus, addr);
> +	if (addr == I3C_BROADCAST_ADDR || addrstat != I3C_ADDR_SLOT_I3C_DEV)
> +		return -EINVAL;
> +
> +	accmst = i3c_ccc_cmd_dest_init(&dest, addr, sizeof(*accmst));
> +	if (!accmst)
> +		return -ENOMEM;
> +
> +	i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETACCMST, &dest, 1);
> +
> +	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
> +	if (ret)
> +		goto out;
> +
> +	if (accmst->newmaster >> 1 != addr)

I really like this check. This is something I realized working
on next patch version.

> +		ret = -EIO;
> +out:
> +	i3c_ccc_cmd_dest_cleanup(&dest);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_getaccmst_locked);
> +
> +/**
>   * i3c_master_defslvs_locked() - send a DEFSLVS CCC command
>   * @master: master used to send frames on the bus
>   *
> @@ -1542,8 +1633,7 @@ int i3c_master_set_info(struct i3c_master_controller *master,
>  	if (!i3c_bus_dev_addr_is_avail(&master->bus, info->dyn_addr))
>  		return -EINVAL;
>  
> -	if (I3C_BCR_DEVICE_ROLE(info->bcr) == I3C_BCR_I3C_MASTER &&
> -	    master->secondary)
> +	if (I3C_BCR_DEVICE_ROLE(info->bcr) != I3C_BCR_I3C_MASTER)
>  		return -EINVAL;
>  
>  	if (master->this)
> @@ -2381,6 +2471,81 @@ static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
>  	return 0;
>  }
>  
> +int i3c_sec_master_bus_init(struct i3c_master_controller *master)
> +{
> +	unsigned long i2c_scl_rate = I3C_BUS_I2C_FM_PLUS_SCL_RATE;
> +	struct i3c_bus *i3cbus = i3c_master_get_bus(master);
> +	enum i3c_bus_mode mode = i3cbus->mode;
> +	struct i3c_defslvs_info *defslvsinfo;
> +	int ret = 0;
> +
> +	if (master->init_done)
> +		return -EINVAL;
> +
> +	list_for_each_entry(defslvsinfo, &master->defslvs, node) {
> +		if (defslvsinfo->slave.dyn_addr)
> +			continue;
> +
> +		switch (defslvsinfo->slave.lvr & I3C_LVR_I2C_INDEX_MASK) {
> +		case I3C_LVR_I2C_INDEX(0):
> +			if (mode < I3C_BUS_MODE_MIXED_FAST)
> +				mode = I3C_BUS_MODE_MIXED_FAST;
> +			break;
> +		case I3C_LVR_I2C_INDEX(1):
> +		case I3C_LVR_I2C_INDEX(2):
> +			if (mode < I3C_BUS_MODE_MIXED_SLOW)
> +				mode = I3C_BUS_MODE_MIXED_SLOW;
> +			break;
> +		default:
> +			ret = -EINVAL;
> +			goto err_put_dev;
> +		}
> +		if (defslvsinfo->slave.lvr & I3C_LVR_I2C_FM_MODE)
> +			i2c_scl_rate = I3C_BUS_I2C_FM_SCL_RATE;
> +	}
> +
> +	ret = i3c_bus_set_mode(i3cbus, mode, i2c_scl_rate);
> +	if (ret)
> +		goto err_put_dev;
> +
> +	/*
> +	 * Now execute the controller specific ->bus_init() routine, which
> +	 * might configure its internal logic to match the bus limitations.
> +	 */
> +	ret = master->ops->bus_init(master);
> +	if (ret)
> +		goto err_put_dev;
> +
> +	/*
> +	 * The master device should have been instantiated in ->bus_init(),
> +	 * complain if this was not the case.
> +	 */
> +	if (!master->this) {
> +		dev_err(&master->dev,
> +			"master_set_info() was not called in ->bus_init()\n");
> +		ret = -EINVAL;
> +		goto err_put_dev;
> +	}
> +
> +	ret = device_add(&master->dev);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Expose our I3C bus as an I2C adapter so that I2C devices are exposed
> +	 * through the I2C subsystem.
> +	 */
> +	ret = i3c_master_i2c_adapter_init(master);
> +	if (ret)
> +		goto err_put_dev;
> +
> +	master->init_done = true;
> +
> +err_put_dev:
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_sec_master_bus_init);
> +
>  /**
>   * i3c_master_register() - register an I3C master
>   * @master: master used to send frames on the bus
> @@ -2413,10 +2578,6 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	struct i2c_dev_boardinfo *i2cbi;
>  	int ret;
>  
> -	/* We do not support secondary masters yet. */
> -	if (secondary)
> -		return -ENOTSUPP;
> -
>  	ret = i3c_master_check_ops(ops);
>  	if (ret)
>  		return ret;
> @@ -2430,6 +2591,7 @@ int i3c_master_register(struct i3c_master_controller *master,
>  	master->secondary = secondary;
>  	INIT_LIST_HEAD(&master->boardinfo.i2c);
>  	INIT_LIST_HEAD(&master->boardinfo.i3c);
> +	INIT_LIST_HEAD(&master->defslvs);
>  
>  	ret = i3c_bus_init(i3cbus);
>  	if (ret)
> @@ -2475,6 +2637,9 @@ int i3c_master_register(struct i3c_master_controller *master,
>  		goto err_put_dev;
>  	}
>  
> +	if (secondary)
> +		return 0;
> +
>  	ret = i3c_master_bus_init(master);
>  	if (ret)
>  		goto err_put_dev;
> @@ -2547,6 +2712,11 @@ int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
>  	if (!master || !xfers)
>  		return -EINVAL;
>  
> +	if (master->bus.cur_master != master->this) {
> +		master->ops->request_mastership(master);
> +		return -EBUSY;

I don't like this approach, so you have to re-trigger the operation when
this master becomes current master. It is not transparent. Especially,
HCI 1.1 describes the process in detail, even  on flow chart and you can 
see there that you should block all the transfers/tasks on your side and
wait for GETACCMST.

> +	}
> +
>  	if (!master->ops->priv_xfers)
>  		return -ENOTSUPP;
>  
> @@ -2638,6 +2808,185 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
>  	dev->ibi = NULL;
>  }
>  
> +static const char *const i3c_dr_modes[] = {
> +	[I3C_DR_MODE_MASTER]		= "master",
> +	[I3C_DR_MODE_SEC_MASTER]	= "sec-master",
> +	[I3C_DR_MODE_SLAVE]		= "slave",
> +};
> +
> +static enum i3c_dr_mode i3c_get_dr_mode_from_string(const char *str)
> +{
> +	int ret;
> +
> +	ret = match_string(i3c_dr_modes, ARRAY_SIZE(i3c_dr_modes), str);
> +	return (ret < 0) ? I3C_DR_MODE_MASTER : ret;
> +}
> +
> +enum i3c_dr_mode i3c_get_dr_mode(struct device *dev)
> +{
> +	const char *dr_mode;
> +	int err;
> +
> +	err = device_property_read_string(dev, "dr-mode", &dr_mode);
> +	if (err < 0)
> +		return I3C_DR_MODE_MASTER;
> +
> +	return i3c_get_dr_mode_from_string(dr_mode);
> +}
> +EXPORT_SYMBOL_GPL(i3c_get_dr_mode);
> +
> +int i3c_sec_master_request_mastership(struct i3c_master_controller *master)
> +{
> +	int ret;
> +
> +	i3c_bus_normaluse_lock(&master->bus);
> +	ret = master->ops->request_mastership(master);
> +	i3c_bus_normaluse_unlock(&master->bus);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_sec_master_request_mastership);
> +
> +int i3c_master_deliver_mastership(struct i3c_master_controller *master, u8 addr)

I agree, wa can introduce this now. But we decided to postpone it. As
you can see, it shouldn't be so hard.

> +{
> +	struct i3c_dev_desc *dev;
> +	int ret;
> +
> +	i3c_bus_normaluse_lock(&master->bus);
> +	i3c_bus_for_each_i3cdev(&master->bus, dev) {
> +		if (dev->ibi) {
> +			mutex_lock(&dev->ibi_lock);
> +			i3c_dev_disable_ibi_locked(dev);
> +			mutex_unlock(&dev->ibi_lock);
> +		}
> +	}
> +	i3c_master_disec_locked(master, I3C_BROADCAST_ADDR,
> +				I3C_CCC_EVENT_MR | I3C_CCC_EVENT_HJ);
> +
> +	ret = master->ops->deliver_mastership(master, addr);
> +	i3c_bus_normaluse_unlock(&master->bus);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_deliver_mastership);
> +
> +int defslvs_populate_i3c_bus(struct i3c_master_controller *master,
> +			     struct i3c_ccc_dev_desc defslvs)
> +{
> +	struct i3c_defslvs_info *defslvsinfo;
> +	struct device *dev = &master->dev;
> +
> +	i3c_bus_maintenance_lock(&master->bus);
> +	defslvsinfo = devm_kzalloc(dev, sizeof(*defslvsinfo), GFP_KERNEL);
> +	if (!defslvsinfo)
> +		return -ENOMEM;
> +
> +	defslvsinfo->slave = defslvs;
> +
> +	list_add_tail(&defslvsinfo->node, &master->defslvs);

I don't get why can't we call i3c_master_add_i3c_dev_locked when
populating the bus. You have all the data on your plate (in HC driver)
when you are populating it from SEC_DEV_CHAR_TABLE_LOC.

I decided to do it similarly, but then Boris suggested to rework it and
we use only i3c_master_add_i3c_dev_locked.

> +
> +	i3c_bus_maintenance_unlock(&master->bus);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(defslvs_populate_i3c_bus);
> +
> +static void i3c_master_add_new_defslvs(struct i3c_master_controller *master)
> +{
> +	struct i3c_defslvs_info *defslvsinfo;
> +
> +	list_for_each_entry(defslvsinfo, &master->defslvs, node) {
> +		/* TODO: add i2c devices to the bus */
> +		if (!defslvsinfo->slave.dyn_addr)
> +			continue;
> +
> +		if (defslvsinfo->slave.dyn_addr == master->this->info.dyn_addr)
> +			continue;
> +
> +		if (!i3c_bus_dev_addr_is_avail(&master->bus,
> +					       defslvsinfo->slave.dyn_addr))

We can add those checks also but we also have i3c_master_attach_i3c_dev
and i3c_master_get_i3c_addrs which takes care of this everything.

> +			continue;
> +
> +		i3c_master_add_i3c_dev_locked(master, defslvsinfo->slave.dyn_addr);
> +	}
> +
> +	while (!list_empty(&master->defslvs)) {
> +		defslvsinfo = list_first_entry(&master->defslvs,
> +					       struct i3c_defslvs_info, node);
> +		list_del(&defslvsinfo->node);

I feel like this code is redundant, we have to allocate it, then delete.

> +	}
> +}
> +
> +int i3c_master_switch_operation_mode(struct i3c_master_controller *master,
> +				     bool secondary)
> +{
> +	struct i3c_dev_desc *dev;
> +	int ret;
> +
> +	if (master->secondary == secondary)
> +		return -EEXIST;
> +
> +	/* TODO: get the current master information */
> +	if (secondary)
> +		master->bus.cur_master = NULL;
> +	else
> +		master->bus.cur_master = master->this;
> +
> +	if (!master->init_done && !secondary)
> +		i3c_sec_master_bus_init(master);
> +
> +	master->secondary = secondary;
> +
> +	dev_info(&master->dev, "changing to %s\n",
> +		 master->secondary ? "Sec Master" : "Master");
> +
> +	/* TODO: Analyse the use of maintenan_lock for everything */
> +	if (!list_empty(&master->defslvs) && !secondary) {
> +		i3c_bus_maintenance_lock(&master->bus);
> +		i3c_master_add_new_defslvs(master);
> +		i3c_bus_maintenance_unlock(&master->bus);
> +
> +		i3c_bus_normaluse_lock(&master->bus);
> +		i3c_master_register_new_i3c_devs(master);

Take a look also at i3c_master_bus_takeover from my latest patch. BTW.
what about I2C devices? We worked on that also, and this is part of the
latest patch also. I'm testing it with I2C devices also.

> +		i3c_bus_normaluse_unlock(&master->bus);
> +	}
> +
> +	if (!secondary) {
> +		i3c_bus_normaluse_lock(&master->bus);
> +		i3c_bus_for_each_i3cdev(&master->bus, dev) {
> +			if (dev->ibi) {
> +				mutex_lock(&dev->ibi_lock);
> +				ret = i3c_dev_enable_ibi_locked(dev);
> +				if (ret)
> +					dev_err(&master->dev,
> +						"Failed to re-enable IBI on device %d-%llx",
> +						master->bus.id, dev->info.pid);
> +				mutex_unlock(&dev->ibi_lock);
> +				}
> +		}
> +
> +		/* TODO: Enable MR only for the elegible devices */

This was postponed also, but we had that before. We can add per-device
granularity to i3c_master_bus_takeover().

> +		i3c_master_enec_locked(master, I3C_BROADCAST_ADDR,
> +					I3C_CCC_EVENT_MR | I3C_CCC_EVENT_HJ);
> +		i3c_bus_normaluse_unlock(&master->bus);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(i3c_master_switch_operation_mode);
> +
> +int i3c_for_each_dev(void *data, int (*fn)(struct device *, void *))
> +{
> +	int res;
> +
> +	mutex_lock(&i3c_core_lock);
> +	res = bus_for_each_dev(&i3c_bus_type, NULL, data, fn);
> +	mutex_unlock(&i3c_core_lock);
> +
> +	return res;
> +}
> +EXPORT_SYMBOL_GPL(i3c_for_each_dev);
> +
>  static int __init i3c_init(void)
>  {
>  	return bus_register(&i3c_bus_type);
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 9cb39d9..09bd99c 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -426,6 +426,8 @@ struct i3c_bus {
>   *		      for a future IBI
>   *		      This method is mandatory only if ->request_ibi is not
>   *		      NULL.
> + * @request_mastership: Request mastership.
> + * @deliver_mastership: Deliver mastership
>   */
>  struct i3c_master_controller_ops {
>  	int (*bus_init)(struct i3c_master_controller *master);
> @@ -452,6 +454,21 @@ struct i3c_master_controller_ops {
>  	int (*disable_ibi)(struct i3c_dev_desc *dev);
>  	void (*recycle_ibi_slot)(struct i3c_dev_desc *dev,
>  				 struct i3c_ibi_slot *slot);
> +	int (*request_mastership)(struct i3c_master_controller *master);
> +	int (*deliver_mastership)(struct i3c_master_controller *master,
> +				  u8 addr);
> +};
> +
> +/**
> + * struct i3c_defslvs_info - defslvs information object
> + * @node: used to insert the defslvs object in the  list
> + * @slave: I3C/I2C device descriptor used for DEFSLVS
> + *
> + * This structure is used to hold defslvs information on Secondary Master.
> + */
> +struct i3c_defslvs_info {
> +	struct list_head node;
> +	struct i3c_ccc_dev_desc slave;
>  };
>  
>  /**
> @@ -468,6 +485,7 @@ struct i3c_master_controller_ops {
>   * @boardinfo.i3c: list of I3C  boardinfo objects
>   * @boardinfo.i2c: list of I2C boardinfo objects
>   * @boardinfo: board-level information attached to devices connected on the bus
> + * @defslvs: List of defslvs objects
>   * @bus: I3C bus exposed by this master
>   * @wq: workqueue used to execute IBI handlers. Can also be used by master
>   *	drivers if they need to postpone operations that need to take place
> @@ -491,6 +509,7 @@ struct i3c_master_controller {
>  		struct list_head i3c;
>  		struct list_head i2c;
>  	} boardinfo;
> +	struct list_head defslvs;
>  	struct i3c_bus bus;
>  	struct workqueue_struct *wq;
>  };
> @@ -525,6 +544,7 @@ int i3c_master_disec_locked(struct i3c_master_controller *master, u8 addr,
>  			    u8 evts);
>  int i3c_master_enec_locked(struct i3c_master_controller *master, u8 addr,
>  			   u8 evts);
> +int i3c_master_getaccmst_locked(struct i3c_master_controller *master, u8 addr);
>  int i3c_master_entdaa_locked(struct i3c_master_controller *master);
>  int i3c_master_defslvs_locked(struct i3c_master_controller *master);
>  
> @@ -652,4 +672,23 @@ void i3c_master_queue_ibi(struct i3c_dev_desc *dev, struct i3c_ibi_slot *slot);
>  
>  struct i3c_ibi_slot *i3c_master_get_free_ibi_slot(struct i3c_dev_desc *dev);
>  
> +enum i3c_dr_mode {
> +	I3C_DR_MODE_MASTER,
> +	I3C_DR_MODE_SEC_MASTER,
> +	I3C_DR_MODE_SLAVE,
> +};
> +
> +enum i3c_dr_mode i3c_get_dr_mode(struct device *dev);
> +
> +int i3c_master_switch_operation_mode(struct i3c_master_controller *master,
> +				     bool secondary);
> +
> +int i3c_sec_master_request_mastership(struct i3c_master_controller *master);
> +int i3c_master_deliver_mastership(struct i3c_master_controller *master,
> +				  u8 addr);
> +
> +int i3c_sec_master_bus_init(struct i3c_master_controller *master);
> +int defslvs_populate_i3c_bus(struct i3c_master_controller *master,
> +			     struct i3c_ccc_dev_desc defslvs);
> +
>  #endif /* I3C_MASTER_H */
> -- 
> 2.7.4
> 

I feel like this is based on early approach which has evolved by the time
and I think some of the nice part are missing. The biggest parts to
discuass are:
- bus population using devslvs device list instead of using
  i3c_master_add_i3c_dev locked, have you tried that? If something does
  not work for you, wa can adjust it but I really want you to try the
  new approach

- the way how we are requesting mastership, IMO, we should wait untill
  the process is finished, as also described in HCI spec for example.
  When I introduce interrupt-based solution, everything should be fine.
  Could you do that also in your driver?

Again, good to have that. I'm really counting on a fair discussion :-)

-- 
--
Regards, 
Przemyslaw Gaj

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
